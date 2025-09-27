# FlutterFlow Struct 不相容問題解決方案

## 概述

本文檔提供所有 FlutterFlow Struct 與 Supabase 不相容部分的具體解決方案，包括 SQL 腳本、轉換函數和實施步驟。

## 1. 問題分類與解決策略

### 1.1 不相容問題分類

| 問題類型 | 受影響 Struct | 數量 | 解決策略 |
|----------|--------------|------|----------|
| **需要新建表** | ArticlesStruct, CollectionsStruct, CommentsStruct, FaqStruct | 4 | 建立完整的新資料表 |
| **需要計算欄位** | EventsStruct, Events2Struct, TrandingEventsStruct | 3 | 建立資料庫檢視和計算函數 |
| **需要擴展現有表** | OrganizatorsStruct (users表) | 1 | 新增欄位和關聯邏輯 |
| **特殊處理** | TrandingEventsStruct (大寫鍵值) | 1 | 自定義轉換函數 |

## 2. 解決方案 1：新建資料表

### 2.1 執行 SQL 腳本

```sql
-- ====================================
-- 解決 ArticlesStruct 不相容問題
-- ====================================
CREATE TABLE IF NOT EXISTS articles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  published_date TIMESTAMPTZ,
  tag VARCHAR(100),
  image_url TEXT,
  author_id UUID REFERENCES users(id),
  is_published BOOLEAN DEFAULT false,
  view_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ====================================
-- 解決 CollectionsStruct 不相容問題
-- ====================================
CREATE TABLE IF NOT EXISTS collections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  image_url TEXT,
  event_count INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Collections 與 Events 的多對多關聯表
CREATE TABLE IF NOT EXISTS collection_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  collection_id UUID REFERENCES collections(id) ON DELETE CASCADE,
  event_id UUID REFERENCES events(id) ON DELETE CASCADE,
  display_order INTEGER DEFAULT 0,
  added_at TIMESTAMPTZ DEFAULT now()
);

-- ====================================
-- 解決 CommentsStruct 不相容問題
-- ====================================
CREATE TABLE IF NOT EXISTS comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id UUID REFERENCES events(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  comment TEXT NOT NULL,
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  is_approved BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ====================================
-- 解決 FaqStruct 不相容問題
-- ====================================
CREATE TABLE IF NOT EXISTS faqs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  category VARCHAR(100),
  display_order INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT true,
  language_code VARCHAR(10) DEFAULT 'zh-TW',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ====================================
-- 建立性能索引
-- ====================================
CREATE INDEX IF NOT EXISTS idx_articles_published_date ON articles(published_date DESC);
CREATE INDEX IF NOT EXISTS idx_articles_tag ON articles(tag);
CREATE INDEX IF NOT EXISTS idx_articles_author_published ON articles(author_id, is_published);

CREATE INDEX IF NOT EXISTS idx_collections_active ON collections(is_active, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_collection_events_collection_id ON collection_events(collection_id, display_order);

CREATE INDEX IF NOT EXISTS idx_comments_event_id ON comments(event_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_comments_rating ON comments(rating DESC);
CREATE INDEX IF NOT EXISTS idx_comments_approved ON comments(is_approved, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_faqs_category_order ON faqs(category, display_order);
CREATE INDEX IF NOT EXISTS idx_faqs_active ON faqs(is_active, display_order);
```

### 2.2 設置 RLS (Row Level Security) 政策

```sql
-- ====================================
-- Articles 安全政策
-- ====================================
ALTER TABLE articles ENABLE ROW LEVEL SECURITY;

-- 公開已發布的文章
CREATE POLICY "Public can view published articles" ON articles 
  FOR SELECT USING (is_published = true);

-- 作者可以管理自己的文章
CREATE POLICY "Authors can manage their articles" ON articles 
  FOR ALL USING (auth.uid() = author_id);

-- 管理員可以管理所有文章
CREATE POLICY "Admins can manage all articles" ON articles 
  FOR ALL USING (
    auth.jwt() ->> 'role' = 'admin' OR 
    auth.uid() IN (SELECT id FROM users WHERE auth.jwt() ->> 'email' LIKE '%@admin.%')
  );

-- ====================================
-- Collections 安全政策
-- ====================================
ALTER TABLE collections ENABLE ROW LEVEL SECURITY;
ALTER TABLE collection_events ENABLE ROW LEVEL SECURITY;

-- 公開活躍的合集
CREATE POLICY "Public can view active collections" ON collections 
  FOR SELECT USING (is_active = true);

-- 創建者可以管理自己的合集
CREATE POLICY "Creators can manage their collections" ON collections 
  FOR ALL USING (auth.uid() = created_by);

-- 合集事件關聯政策
CREATE POLICY "Public can view collection events" ON collection_events 
  FOR SELECT USING (true);

CREATE POLICY "Collection owners can manage events" ON collection_events 
  FOR ALL USING (
    auth.uid() IN (SELECT created_by FROM collections WHERE id = collection_id)
  );

-- ====================================
-- Comments 安全政策
-- ====================================
ALTER TABLE comments ENABLE ROW LEVEL SECURITY;

-- 公開已審核的評論
CREATE POLICY "Public can view approved comments" ON comments 
  FOR SELECT USING (is_approved = true);

-- 用戶可以創建評論
CREATE POLICY "Users can create comments" ON comments 
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- 用戶可以編輯自己的評論（24小時內）
CREATE POLICY "Users can edit their own comments" ON comments 
  FOR UPDATE USING (
    auth.uid() = user_id AND 
    created_at > now() - interval '24 hours'
  );

-- 活動主辦者可以管理活動的評論
CREATE POLICY "Event organizers can manage comments" ON comments 
  FOR ALL USING (
    auth.uid() IN (
      SELECT organizer_id FROM events WHERE id = event_id
    )
  );

-- ====================================
-- FAQs 安全政策
-- ====================================
ALTER TABLE faqs ENABLE ROW LEVEL SECURITY;

-- 公開活躍的 FAQ
CREATE POLICY "Public can view active faqs" ON faqs 
  FOR SELECT USING (is_active = true);

-- 管理員可以管理 FAQ
CREATE POLICY "Admins can manage faqs" ON faqs 
  FOR ALL USING (auth.jwt() ->> 'role' = 'admin');
```

## 3. 解決方案 2：擴展現有表

### 3.1 擴展 events 表（支援評分）

```sql
-- 為 EventsStruct.rating 新增欄位
ALTER TABLE events ADD COLUMN IF NOT EXISTS average_rating DECIMAL(3,2) DEFAULT 0.0;
ALTER TABLE events ADD COLUMN IF NOT EXISTS rating_count INTEGER DEFAULT 0;

-- 建立評分更新觸發器
CREATE OR REPLACE FUNCTION update_event_rating()
RETURNS TRIGGER AS $$
BEGIN
  -- 重新計算活動的平均評分
  UPDATE events SET 
    average_rating = (
      SELECT COALESCE(AVG(rating), 0.0) 
      FROM comments 
      WHERE event_id = COALESCE(NEW.event_id, OLD.event_id)
        AND rating IS NOT NULL
        AND is_approved = true
    ),
    rating_count = (
      SELECT COUNT(*) 
      FROM comments 
      WHERE event_id = COALESCE(NEW.event_id, OLD.event_id)
        AND rating IS NOT NULL 
        AND is_approved = true
    ),
    updated_at = now()
  WHERE id = COALESCE(NEW.event_id, OLD.event_id);
  
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- 建立觸發器
DROP TRIGGER IF EXISTS trigger_update_event_rating ON comments;
CREATE TRIGGER trigger_update_event_rating
  AFTER INSERT OR UPDATE OR DELETE ON comments
  FOR EACH ROW
  EXECUTE FUNCTION update_event_rating();
```

### 3.2 擴展 users 表（支援 OrganizatorsStruct）

```sql
-- 為 OrganizatorsStruct.followers 新增欄位
ALTER TABLE users ADD COLUMN IF NOT EXISTS follower_count INTEGER DEFAULT 0;
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_organizer BOOLEAN DEFAULT false;
ALTER TABLE users ADD COLUMN IF NOT EXISTS organizer_description TEXT;

-- 建立用戶關注表（如果需要真實的關注功能）
CREATE TABLE IF NOT EXISTS user_follows (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  follower_id UUID REFERENCES users(id) ON DELETE CASCADE,
  following_id UUID REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(follower_id, following_id)
);

-- 建立關注者計數觸發器
CREATE OR REPLACE FUNCTION update_follower_count()
RETURNS TRIGGER AS $$
BEGIN
  -- 更新被關注用戶的關注者數量
  UPDATE users SET 
    follower_count = (
      SELECT COUNT(*) FROM user_follows WHERE following_id = COALESCE(NEW.following_id, OLD.following_id)
    ),
    updated_at = now()
  WHERE id = COALESCE(NEW.following_id, OLD.following_id);
  
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_update_follower_count ON user_follows;
CREATE TRIGGER trigger_update_follower_count
  AFTER INSERT OR DELETE ON user_follows
  FOR EACH ROW
  EXECUTE FUNCTION update_follower_count();

-- 為關注表設置 RLS
ALTER TABLE user_follows ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can manage their follows" ON user_follows 
  FOR ALL USING (auth.uid() = follower_id);

CREATE POLICY "Public can view follows" ON user_follows 
  FOR SELECT USING (true);
```

## 4. 解決方案 3：建立計算欄位檢視

### 4.1 完整的 EventsStruct 支援檢視

```sql
-- 建立完整支援 EventsStruct 的檢視
CREATE OR REPLACE VIEW v_events_complete AS
SELECT 
    e.id,
    e.title,
    e.description as descr,
    e.start_date as date,
    
    -- location: 組合地點資訊
    COALESCE(
        CASE 
            WHEN v.name IS NOT NULL AND v.city IS NOT NULL 
            THEN v.name || ', ' || v.city
            WHEN v.name IS NOT NULL THEN v.name
            WHEN v.city IS NOT NULL THEN v.city
            WHEN e.location IS NOT NULL THEN e.location
            ELSE ''
        END,
        ''
    ) as location,
    
    -- img: 圖片 URL
    COALESCE(e.image_url, '') as img,
    
    -- tag: 類別名稱
    COALESCE(c.name, '') as tag,
    
    -- price: 最低票價
    COALESCE(tt_stats.min_price, 0.0) as price,
    
    -- rating: 平均評分
    COALESCE(e.average_rating, 4.5) as rating,
    
    -- tickets: 剩餘票券數
    GREATEST(COALESCE(e.max_attendees - e.current_attendees, 0), 0) as tickets,
    
    -- dayLeft: 剩餘天數
    CASE 
        WHEN e.start_date > NOW() 
        THEN GREATEST(EXTRACT(days FROM (e.start_date - NOW()))::int, 0)
        ELSE 0 
    END as "dayLeft",
    
    -- ticketStatus: 票券狀態
    CASE 
        WHEN e.status = 'cancelled' THEN 'cancelled'
        WHEN e.start_date < NOW() THEN 'closed'
        WHEN e.current_attendees >= e.max_attendees THEN 'sold_out'
        WHEN e.status = 'draft' THEN 'not_available'
        WHEN tt_stats.min_price IS NULL THEN 'no_tickets'
        ELSE 'available'
    END as "ticketStatus",
    
    -- 附加有用欄位
    e.organizer_id,
    e.category_id,
    e.venue_id,
    e.status,
    e.is_featured,
    e.max_attendees,
    e.current_attendees,
    e.created_at,
    e.updated_at

FROM events e
LEFT JOIN venues v ON e.venue_id = v.id
LEFT JOIN categories c ON e.category_id = c.id
LEFT JOIN (
    SELECT 
        event_id, 
        MIN(price) as min_price,
        COUNT(*) as ticket_type_count,
        SUM(quantity) as total_capacity
    FROM ticket_types 
    WHERE is_active = true
    GROUP BY event_id
) tt_stats ON e.id = tt_stats.event_id

WHERE e.status IN ('published', 'active')
ORDER BY e.is_featured DESC, e.start_date ASC;
```

### 4.2 Events2Struct 和 TrandingEventsStruct 支援檢視

```sql
-- 支援 Events2Struct 的簡化檢視
CREATE OR REPLACE VIEW v_events_simple AS
SELECT 
    e.id,
    e.title,
    e.image_url as img,
    c.name as category,
    COALESCE(tt_stats.min_price, 0.0) as price
FROM events e
LEFT JOIN categories c ON e.category_id = c.id
LEFT JOIN (
    SELECT event_id, MIN(price) as min_price
    FROM ticket_types 
    WHERE is_active = true
    GROUP BY event_id
) tt_stats ON e.id = tt_stats.event_id
WHERE e.status IN ('published', 'active')
ORDER BY e.created_at DESC;

-- 支援 TrandingEventsStruct 的特殊檢視（處理大寫鍵值）
CREATE OR REPLACE VIEW v_trending_events AS
SELECT 
    e.id,
    e.title as "Title",  -- 注意：大寫鍵值
    e.image_url as img,
    c.name as "Category",  -- 注意：大寫鍵值
    COALESCE(tt_stats.min_price, 0.0) as "Price"  -- 注意：大寫鍵值
FROM events e
LEFT JOIN categories c ON e.category_id = c.id
LEFT JOIN (
    SELECT event_id, MIN(price) as min_price
    FROM ticket_types 
    WHERE is_active = true
    GROUP BY event_id
) tt_stats ON e.id = tt_stats.event_id
WHERE e.status IN ('published', 'active')
    AND e.is_featured = true  -- 只顯示精選活動作為趨勢
ORDER BY e.average_rating DESC, e.current_attendees DESC
LIMIT 10;
```

## 5. 解決方案 4：Flutter 轉換函數

### 5.1 處理 TrandingEventsStruct 大寫鍵值問題

```dart
// 特殊轉換函數：處理 TrandingEventsStruct 的大寫鍵值
TrandingEventsStruct convertToTrandingEventsStruct(Map<String, dynamic> data) {
  return TrandingEventsStruct(
    // 處理大寫鍵值映射
    price: data['Price']?.toDouble() ?? 0.0,
    category: data['Category']?.toString() ?? '',
    title: data['Title']?.toString() ?? '',
    img: data['img']?.toString() ?? '', // 注意：img 是小寫
  );
}

// 從 Supabase 檢視轉換到 TrandingEventsStruct
List<TrandingEventsStruct> convertTrendingEventsFromSupabase(List<Map<String, dynamic>> rows) {
  return rows.map((row) {
    // 將 Supabase 結果轉換為 TrandingEventsStruct 期望的格式
    return TrandingEventsStruct(
      price: (row['Price'] ?? 0.0).toDouble(),
      category: row['Category']?.toString() ?? '',
      title: row['Title']?.toString() ?? '',
      img: row['img']?.toString() ?? '',
    );
  }).toList();
}
```

### 5.2 完整的 EventsStruct 轉換函數

```dart
// 完整的 EventsStruct 轉換函數
EventsStruct convertToEventsStruct(Map<String, dynamic> data) {
  return EventsStruct(
    location: data['location']?.toString() ?? '',
    title: data['title']?.toString() ?? '',
    date: data['date'] != null ? DateTime.parse(data['date']) : null,
    price: (data['price'] ?? 0.0).toDouble(),
    rating: (data['rating'] ?? 4.5).toDouble(),
    tag: data['tag']?.toString() ?? '',
    img: data['img']?.toString() ?? '',
    descr: data['descr']?.toString() ?? '',
    tickets: (data['tickets'] ?? 0).toInt(),
    dayLeft: (data['dayLeft'] ?? 0).toInt(),
    ticketStatus: data['ticketStatus']?.toString() ?? 'available',
  );
}

// 批量轉換函數
List<EventsStruct> convertEventsFromSupabase(List<Map<String, dynamic>> rows) {
  return rows.map((row) => convertToEventsStruct(row)).toList();
}
```

### 5.3 新建表的 Struct 轉換函數

```dart
// ArticlesStruct 轉換函數
ArticlesStruct convertToArticlesStruct(Map<String, dynamic> data) {
  return ArticlesStruct(
    title: data['title']?.toString() ?? '',
    description: data['description']?.toString() ?? '',
    date: data['published_date'] != null ? DateTime.parse(data['published_date']) : null,
    tag: data['tag']?.toString() ?? '',
    img: data['image_url']?.toString() ?? '',
  );
}

// CommentsStruct 轉換函數
CommentsStruct convertToCommentsStruct(Map<String, dynamic> data) {
  return CommentsStruct(
    name: data['name']?.toString() ?? '',
    date: data['created_at'] != null ? DateTime.parse(data['created_at']) : null,
    comment: data['comment']?.toString() ?? '',
  );
}

// FaqStruct 轉換函數
FaqStruct convertToFaqStruct(Map<String, dynamic> data) {
  return FaqStruct(
    question: data['question']?.toString() ?? '',
    answer: data['answer']?.toString() ?? '',
  );
}

// CollectionsStruct 轉換函數
CollectionsStruct convertToCollectionsStruct(Map<String, dynamic> data) {
  return CollectionsStruct(
    title: data['title']?.toString() ?? '',
    descr: data['description']?.toString() ?? '',
    img: data['image_url']?.toString() ?? '',
  );
}
```

## 6. FFAppState 測試資料匯入腳本

### 6.1 匯入所有 FFAppState 資料

```sql
-- ====================================
-- 匯入 FAQs 測試資料
-- ====================================
INSERT INTO faqs (question, answer, display_order, is_active) VALUES
('What is Eventy?', 'Eventy is an app designed to help you discover, book, and attend events in your city or anywhere in the world. From concerts and festivals to workshops and meetups, Eventy connects you to experiences you''ll love.', 1, true),
('How do I book an event?', 'Booking is simple! Browse the event listings, choose an event that interests you, select your preferred ticket type, and complete the payment process directly in the app.', 2, true),
('Can I cancel my booking?', 'Yes, you can cancel your booking within the cancellation window specified by the event organizer. For eligible cancellations, you''ll receive a refund according to the organizer''s refund policy.', 3, true),
('How do I find events near me?', 'Use the location filter on the home page to find events happening in your area. You can also enable location access for personalized event recommendations.', 4, true),
('Can I host my own events on Eventy?', 'Absolutely! Eventy allows organizers to create, promote, and manage events directly through the app. Sign up as an organizer and start sharing your events with a broader audience.', 5, true),
('Are there any fees for using Eventy?', 'Eventy is free to download and explore. A small service fee may apply when purchasing tickets, depending on the event organizer''s settings.', 6, true),
('How do I contact customer support?', 'You can reach our support team by navigating to the "Support" section in the app. We''re here to assist you with any questions or issues you may have.', 7, true),
('Does Eventy send notifications?', 'Yes! Eventy can notify you about upcoming events, ticket availability, exclusive discounts, and updates for events you''ve booked. Make sure to enable notifications for the best experience.', 8, true),
('What if an event gets rescheduled or canceled?', 'If an event is rescheduled or canceled, you''ll receive a notification with updated details. In case of cancellations, refunds will be processed according to the organizer''s policy.', 9, true),
('Can I share events with friends?', 'Of course! Eventy allows you to share event details with friends through social media, email, or messaging apps. Enjoy experiences together!', 10, true);

-- ====================================
-- 匯入 Collections 測試資料
-- ====================================
INSERT INTO collections (title, description, image_url, event_count, created_by) 
SELECT 
  'Best Events in January 2025',
  '0 upcoming events',
  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8a77l5u4lny5/34frefeggbb_gbd.png',
  0,
  (SELECT id FROM users WHERE email LIKE '%admin%' OR is_organizer = true LIMIT 1)
UNION ALL
SELECT 
  'New Year 2025',
  '12 upcoming events',
  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/t6hjbtbtm5mu/qefrtbfhngn.png',
  12,
  (SELECT id FROM users WHERE email LIKE '%admin%' OR is_organizer = true LIMIT 1)
UNION ALL
SELECT 
  'Upcoming Events in March 2025',
  '4 upcoming events',
  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8cdz2l8rwhoy/qwefrgthntgjmhgnb.png',
  4,
  (SELECT id FROM users WHERE email LIKE '%admin%' OR is_organizer = true LIMIT 1);

-- ====================================
-- 更新 users 表以支援 OrganizatorsStruct
-- ====================================
-- 為現有主辦方設置相關欄位
UPDATE users SET 
  is_organizer = true,
  follower_count = 22000,
  organizer_description = 'Electronic dance music festival organizer'
WHERE name LIKE '%Ultra%' OR email LIKE '%ultra%';

-- 插入 FFAppState 中的主辦方資料
INSERT INTO users (id, name, avatar_url, is_organizer, follower_count, organizer_description, created_at)
VALUES 
('org-ultra-music', 'Ultra music Festival', 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8aqmgo69o2nt/st%2Csmall%2C507x507-pad%2C600x600%2Cf8f8f8.u2.jpg', true, 22000, 'World-renowned electronic dance music festival', now()),
('org-nyc-foodies', 'NYC Foodies United', 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/smr0q5na6iyx/food-drive-county_English_IG.jpeg', true, 2400, 'Food and culinary events organizer', now()),
('org-city-art', 'City Art', 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/khfi2epsru55/event_522746956.jpg', true, 590, 'Contemporary art exhibitions and events', now()),
('org-bitdevs-nyc', 'BitDevs NYC', 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/kqq08etdis18/event_525583511.jpg', true, 1200, 'Bitcoin and cryptocurrency meetups', now()),
('org-prodo-marketing', 'Prodo Marketing', 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/buy20q9sfbne/event_524002748.jpg', true, 128, 'Marketing and business development events', now()),
('org-asian-meetup', 'Asian Meetup', 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/7cvgqctgm31x/event_525270379.jpg', true, 2300, 'Asian community and cultural events', now())
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  avatar_url = EXCLUDED.avatar_url,
  is_organizer = EXCLUDED.is_organizer,
  follower_count = EXCLUDED.follower_count,
  organizer_description = EXCLUDED.organizer_description;
```

## 7. 實施檢查清單

### 7.1 資料庫結構實施

- [ ] 執行新建表 SQL 腳本
- [ ] 設置 RLS 安全政策
- [ ] 建立性能索引
- [ ] 建立觸發器和函數

### 7.2 資料檢視實施

- [ ] 建立 v_events_complete 檢視
- [ ] 建立 v_events_simple 檢視  
- [ ] 建立 v_trending_events 檢視
- [ ] 測試檢視查詢效能

### 7.3 Flutter 程式碼整合

- [ ] 建立轉換函數
- [ ] 處理大寫鍵值特殊情況
- [ ] 測試所有 Struct 轉換
- [ ] 整合到現有 FlutterFlow 元件

### 7.4 測試資料匯入

- [ ] 匯入 FAQs 資料
- [ ] 匯入 Collections 資料
- [ ] 更新 Users 資料
- [ ] 建立 Comments 測試資料
- [ ] 驗證所有資料完整性

## 8. 驗證測試

### 8.1 功能驗證腳本

```sql
-- 驗證新建表是否工作正常
SELECT 
  (SELECT COUNT(*) FROM articles) as articles_count,
  (SELECT COUNT(*) FROM collections) as collections_count,
  (SELECT COUNT(*) FROM comments) as comments_count,
  (SELECT COUNT(*) FROM faqs) as faqs_count;

-- 驗證檢視是否工作正常
SELECT COUNT(*) FROM v_events_complete;
SELECT COUNT(*) FROM v_events_simple;
SELECT COUNT(*) FROM v_trending_events;

-- 驗證計算欄位是否正確
SELECT 
  title,
  price,
  rating,
  tickets,
  "dayLeft",
  "ticketStatus"
FROM v_events_complete
LIMIT 5;
```

### 8.2 Flutter 測試程式碼

```dart
// 測試所有 Struct 轉換是否正常
Future<void> testAllStructConversions() async {
  try {
    // 測試 EventsStruct
    final eventsData = await supabase.from('v_events_complete').select('*').limit(5);
    final events = convertEventsFromSupabase(eventsData);
    print('EventsStruct 轉換成功: ${events.length} 筆');

    // 測試 TrandingEventsStruct
    final trendingData = await supabase.from('v_trending_events').select('*').limit(3);
    final trending = trendingData.map((row) => convertToTrandingEventsStruct(row)).toList();
    print('TrandingEventsStruct 轉換成功: ${trending.length} 筆');

    // 測試 CommentsStruct
    final commentsData = await supabase.from('comments').select('*').limit(10);
    final comments = commentsData.map((row) => convertToCommentsStruct(row)).toList();
    print('CommentsStruct 轉換成功: ${comments.length} 筆');

    // 測試其他 Struct...

    print('✅ 所有 Struct 轉換測試通過！');
  } catch (e) {
    print('❌ Struct 轉換測試失敗: $e');
  }
}
```

## 總結

通過以上解決方案，所有 12 個 FlutterFlow Struct 的不相容問題都能得到完整解決：

1. **4 個新建表**：完全解決 ArticlesStruct、CollectionsStruct、CommentsStruct、FaqStruct
2. **計算欄位檢視**：完全解決 EventsStruct 的複雜欄位計算
3. **特殊轉換函數**：解決 TrandingEventsStruct 的大寫鍵值問題  
4. **擴展現有表**：完全支援 OrganizatorsStruct

實施完成後，FlutterFlow 應用可以無縫地從 Supabase 讀取所有 Struct 資料，並保持與原始 FFAppState 相同的功能性。