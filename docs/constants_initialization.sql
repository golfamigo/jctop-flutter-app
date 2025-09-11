-- Constants 多語言資料初始化腳本
-- 基於現有 FFAppConstants 建立多語言版本

-- 建立表格結構
CREATE TABLE IF NOT EXISTS app_constants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  constant_type VARCHAR(50) NOT NULL,
  constant_key VARCHAR(100) NOT NULL,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

CREATE TABLE IF NOT EXISTS app_constant_translations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  constant_id UUID REFERENCES app_constants(id) ON DELETE CASCADE,
  language_code VARCHAR(10) NOT NULL,
  display_text TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  UNIQUE(constant_id, language_code)
);

-- 建立多語言查詢 View
CREATE OR REPLACE VIEW v_localized_constants AS
SELECT 
  ac.constant_type,
  ac.constant_key,
  ac.display_order,
  act.language_code,
  act.display_text
FROM app_constants ac
JOIN app_constant_translations act ON ac.id = act.constant_id
ORDER BY ac.constant_type, ac.display_order, act.language_code;

-- 插入興趣分類 (interests)
INSERT INTO app_constants (constant_type, constant_key, display_order) VALUES
('interests', 'music', 1),
('interests', 'sports', 2),
('interests', 'technology', 3),
('interests', 'arts_crafts', 4),
('interests', 'food_drinks', 5),
('interests', 'travel', 6),
('interests', 'health_wellness', 7),
('interests', 'business', 8),
('interests', 'gaming', 9),
('interests', 'photography', 10),
('interests', 'literature', 11),
('interests', 'film_cinema', 12),
('interests', 'cultural_heritage', 13),
('interests', 'theater', 14),
('interests', 'outdoor_activities', 15);

-- 興趣分類多語言翻譯
WITH interest_constants AS (
  SELECT id, constant_key FROM app_constants WHERE constant_type = 'interests'
)
INSERT INTO app_constant_translations (constant_id, language_code, display_text)
SELECT ic.id, 'zh-TW', 
  CASE ic.constant_key
    WHEN 'music' THEN '🎵 音樂'
    WHEN 'sports' THEN '⚽ 運動'
    WHEN 'technology' THEN '💻 科技'
    WHEN 'arts_crafts' THEN '🎨 藝術工藝'
    WHEN 'food_drinks' THEN '🍔 美食飲品'
    WHEN 'travel' THEN '🌍 旅遊'
    WHEN 'health_wellness' THEN '🧘 健康養生'
    WHEN 'business' THEN '💼 商業'
    WHEN 'gaming' THEN '🎮 遊戲'
    WHEN 'photography' THEN '📸 攝影'
    WHEN 'literature' THEN '📚 文學'
    WHEN 'film_cinema' THEN '🎥 電影'
    WHEN 'cultural_heritage' THEN '🏛️ 文化遺產'
    WHEN 'theater' THEN '🎭 戲劇'
    WHEN 'outdoor_activities' THEN '🏕️ 戶外活動'
  END
FROM interest_constants ic
UNION ALL
SELECT ic.id, 'en',
  CASE ic.constant_key
    WHEN 'music' THEN '🎵 Music'
    WHEN 'sports' THEN '⚽ Sports'
    WHEN 'technology' THEN '💻 Technology'
    WHEN 'arts_crafts' THEN '🎨 Arts & Crafts'
    WHEN 'food_drinks' THEN '🍔 Food & Drinks'
    WHEN 'travel' THEN '🌍 Travel'
    WHEN 'health_wellness' THEN '🧘 Health & Wellness'
    WHEN 'business' THEN '💼 Business'
    WHEN 'gaming' THEN '🎮 Gaming'
    WHEN 'photography' THEN '📸 Photography'
    WHEN 'literature' THEN '📚 Literature'
    WHEN 'film_cinema' THEN '🎥 Film & Cinema'
    WHEN 'cultural_heritage' THEN '🏛️ Cultural Heritage'
    WHEN 'theater' THEN '🎭 Theater'
    WHEN 'outdoor_activities' THEN '🏕️ Outdoor Activities'
  END
FROM interest_constants ic;

-- 插入排序選項 (sort_options)
INSERT INTO app_constants (constant_type, constant_key, display_order) VALUES
('sort_options', 'popularity', 1),
('sort_options', 'rating', 2),
('sort_options', 'price_low_high', 3),
('sort_options', 'price_high_low', 4),
('sort_options', 'views', 5);

-- 排序選項多語言翻譯
WITH sort_constants AS (
  SELECT id, constant_key FROM app_constants WHERE constant_type = 'sort_options'
)
INSERT INTO app_constant_translations (constant_id, language_code, display_text)
SELECT sc.id, 'zh-TW',
  CASE sc.constant_key
    WHEN 'popularity' THEN '人氣度'
    WHEN 'rating' THEN '評分'
    WHEN 'price_low_high' THEN '價格：從低到高'
    WHEN 'price_high_low' THEN '價格：從高到低'
    WHEN 'views' THEN '瀏覽次數'
  END
FROM sort_constants sc
UNION ALL
SELECT sc.id, 'en',
  CASE sc.constant_key
    WHEN 'popularity' THEN 'Popularity'
    WHEN 'rating' THEN 'Rating'
    WHEN 'price_low_high' THEN 'Price: Low to High'
    WHEN 'price_high_low' THEN 'Price: High to Low'
    WHEN 'views' THEN 'Number of views'
  END
FROM sort_constants sc;

-- 插入熱門搜尋 (popular_searches)
INSERT INTO app_constants (constant_type, constant_key, display_order) VALUES
('popular_searches', 'tomorrowland', 1),
('popular_searches', 'concerts', 2),
('popular_searches', 'cinema', 3),
('popular_searches', 'rooftops', 4),
('popular_searches', 'exhibitions', 5);

-- 熱門搜尋多語言翻譯
WITH search_constants AS (
  SELECT id, constant_key FROM app_constants WHERE constant_type = 'popular_searches'
)
INSERT INTO app_constant_translations (constant_id, language_code, display_text)
SELECT sc.id, 'zh-TW',
  CASE sc.constant_key
    WHEN 'tomorrowland' THEN 'Tomorrowland'
    WHEN 'concerts' THEN '演唱會'
    WHEN 'cinema' THEN '電影院'
    WHEN 'rooftops' THEN '屋頂派對'
    WHEN 'exhibitions' THEN '展覽'
  END
FROM search_constants sc
UNION ALL
SELECT sc.id, 'en',
  CASE sc.constant_key
    WHEN 'tomorrowland' THEN 'Tomorrowland'
    WHEN 'concerts' THEN 'Concerts'
    WHEN 'cinema' THEN 'Cinema'
    WHEN 'rooftops' THEN 'Rooftops'
    WHEN 'exhibitions' THEN 'Exhibitions'
  END
FROM search_constants sc;

-- 插入舉報原因 (report_reasons)
INSERT INTO app_constants (constant_type, constant_key, display_order) VALUES
('report_reasons', 'cancelled', 1),
('report_reasons', 'postponed', 2),
('report_reasons', 'adult_content', 3),
('report_reasons', 'fake_inappropriate', 4),
('report_reasons', 'spam', 5),
('report_reasons', 'remove_request', 6),
('report_reasons', 'private_event', 7);

-- 舉報原因多語言翻譯
WITH report_constants AS (
  SELECT id, constant_key FROM app_constants WHERE constant_type = 'report_reasons'
)
INSERT INTO app_constant_translations (constant_id, language_code, display_text)
SELECT rc.id, 'zh-TW',
  CASE rc.constant_key
    WHEN 'cancelled' THEN '此活動已取消'
    WHEN 'postponed' THEN '此活動已延期'
    WHEN 'adult_content' THEN '此活動包含成人內容'
    WHEN 'fake_inappropriate' THEN '此活動是假的/不當的/重複的'
    WHEN 'spam' THEN '此活動是垃圾訊息'
    WHEN 'remove_request' THEN '請移除此活動'
    WHEN 'private_event' THEN '此活動是私人活動'
  END
FROM report_constants rc
UNION ALL
SELECT rc.id, 'en',
  CASE rc.constant_key
    WHEN 'cancelled' THEN 'This event has been cancelled.'
    WHEN 'postponed' THEN 'This event has been postponed.'
    WHEN 'adult_content' THEN 'This event has adult content.'
    WHEN 'fake_inappropriate' THEN 'This event is fake/Inappropriate/Duplicate.'
    WHEN 'spam' THEN 'This event is a spam.'
    WHEN 'remove_request' THEN 'Please remove this event.'
    WHEN 'private_event' THEN 'This event is private.'
  END
FROM report_constants rc;

-- 插入性別選項 (genders)
INSERT INTO app_constants (constant_type, constant_key, display_order) VALUES
('genders', 'male', 1),
('genders', 'female', 2);

-- 性別選項多語言翻譯
WITH gender_constants AS (
  SELECT id, constant_key FROM app_constants WHERE constant_type = 'genders'
)
INSERT INTO app_constant_translations (constant_id, language_code, display_text)
SELECT gc.id, 'zh-TW',
  CASE gc.constant_key
    WHEN 'male' THEN '男性'
    WHEN 'female' THEN '女性'
  END
FROM gender_constants gc
UNION ALL
SELECT gc.id, 'en',
  CASE gc.constant_key
    WHEN 'male' THEN 'Male'
    WHEN 'female' THEN 'Female'
  END
FROM gender_constants gc;

-- 插入尋找目標 (looking_for)
INSERT INTO app_constants (constant_type, constant_key, display_order) VALUES
('looking_for', 'make_friends', 1),
('looking_for', 'practice_hobby', 2),
('looking_for', 'professional_network', 3),
('looking_for', 'socialize', 4);

-- 尋找目標多語言翻譯
WITH looking_constants AS (
  SELECT id, constant_key FROM app_constants WHERE constant_type = 'looking_for'
)
INSERT INTO app_constant_translations (constant_id, language_code, display_text)
SELECT lc.id, 'zh-TW',
  CASE lc.constant_key
    WHEN 'make_friends' THEN '結交新朋友'
    WHEN 'practice_hobby' THEN '與他人共同練習興趣愛好'
    WHEN 'professional_network' THEN '建立專業人脈網絡'
    WHEN 'socialize' THEN '與他人社交'
  END
FROM looking_constants lc
UNION ALL
SELECT lc.id, 'en',
  CASE lc.constant_key
    WHEN 'make_friends' THEN 'Make new friends'
    WHEN 'practice_hobby' THEN 'Practice a hobby with others'
    WHEN 'professional_network' THEN 'Build your professional network'
    WHEN 'socialize' THEN 'Socialize with others'
  END
FROM looking_constants lc;

-- 建立查詢特定類型常數的便利函數
CREATE OR REPLACE FUNCTION get_localized_constants(
  p_constant_type VARCHAR(50),
  p_language_code VARCHAR(10) DEFAULT 'zh-TW'
)
RETURNS TABLE(display_text TEXT) AS $$
BEGIN
  RETURN QUERY
  SELECT vlc.display_text
  FROM v_localized_constants vlc
  WHERE vlc.constant_type = p_constant_type
    AND vlc.language_code = p_language_code
  ORDER BY vlc.display_order;
END;
$$ LANGUAGE plpgsql;

-- 使用範例：
-- SELECT * FROM get_localized_constants('interests', 'zh-TW');
-- SELECT * FROM get_localized_constants('sort_options', 'en');