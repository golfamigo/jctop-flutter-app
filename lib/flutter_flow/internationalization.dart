import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hant'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HantText = '',
  }) =>
      [enText, zh_HantText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'izb5ydh3': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    '3iajxtcw': {
      'en': 'Discover live shows ...',
      'zh_Hant': '發現現場表演...',
    },
    'i5p4nfkk': {
      'en': 'This Week',
      'zh_Hant': '本星期',
    },
    'zre8l2f9': {
      'en': 'New shows',
      'zh_Hant': '新節目',
    },
    'hhq28i8f': {
      'en': 'Late night',
      'zh_Hant': '深夜',
    },
    'a58awuuc': {
      'en': 'Popular',
      'zh_Hant': '受歡迎的',
    },
    'xzqf83d5': {
      'en': 'Categories',
      'zh_Hant': '類別',
    },
    'i3s8m8qg': {
      'en': 'See all',
      'zh_Hant': '看全部',
    },
    'uenxs928': {
      'en': 'Near Your Place',
      'zh_Hant': '在你附近',
    },
    '7pgw16am': {
      'en': 'See all',
      'zh_Hant': '看全部',
    },
    'dxsrwvdf': {
      'en': 'New Shows',
      'zh_Hant': '新節目',
    },
    'mtrn5fb5': {
      'en': 'Just Announced. Updated every day.',
      'zh_Hant': '剛剛發布。每天更新。',
    },
    'cuqr0i9m': {
      'en': 'Popular in your city',
      'zh_Hant': '您所在城市受歡迎',
    },
    'o3jjv50x': {
      'en': 'See all',
      'zh_Hant': '看全部',
    },
    'lwpb52ts': {
      'en': 'Find Your Next Great Experience!',
      'zh_Hant': '尋找您的下一個精彩體驗！',
    },
    'edkcp20m': {
      'en': 'Swipe through a world of exciting events tailored just for you!',
      'zh_Hant': '瀏覽專為您量身打造的精彩活動世界！',
    },
    'rsct5l37': {
      'en': 'Start Swiping',
      'zh_Hant': '開始滑動',
    },
    '1rhmnn26': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // MyTickets
  {
    'y3gzlb44': {
      'en': 'Upcoming',
      'zh_Hant': '即將推出',
    },
    'v1i0sss7': {
      'en': 'Past tickets',
      'zh_Hant': '過去的票',
    },
    '4qq5p754': {
      'en': 'Search your tickets',
      'zh_Hant': '搜尋您的票',
    },
    'b4cssg4s': {
      'en': 'Bookings history',
      'zh_Hant': '預訂歷史記錄',
    },
    'msr5tqxg': {
      'en': 'My tickets',
      'zh_Hant': '我的票',
    },
    'hfsfsazv': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Favorites
  {
    'a7gtrx5s': {
      'en': 'All',
      'zh_Hant': '全部',
    },
    'rw2czicc': {
      'en': 'Active',
      'zh_Hant': '積極的',
    },
    '9im6t7mb': {
      'en': 'Inactive',
      'zh_Hant': '不活躍',
    },
    'mbh56xrb': {
      'en': 'Favorites',
      'zh_Hant': '收藏夾',
    },
    'slotspae': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Account
  {
    'vd9uga8m': {
      'en': 'Alex Johnson',
      'zh_Hant': '亞歷克斯·約翰遜',
    },
    'f9eeg0wk': {
      'en': 'alexjohnson@gmail.com',
      'zh_Hant': 'alexjohnson@gmail.com',
    },
    '6dhse0du': {
      'en': '45',
      'zh_Hant': '45',
    },
    'cd53ehmb': {
      'en': 'Likes',
      'zh_Hant': '喜歡',
    },
    'rr9cs4st': {
      'en': '9',
      'zh_Hant': '9',
    },
    '1c40hmuo': {
      'en': 'My Tickets',
      'zh_Hant': '我的票',
    },
    '9r58m74s': {
      'en': '12',
      'zh_Hant': '12',
    },
    'rj6pes5o': {
      'en': 'Following',
      'zh_Hant': '下列的',
    },
    'tgiboddm': {
      'en': 'PERSONAL',
      'zh_Hant': '個人的',
    },
    '3rh55183': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    'a3jugg35': {
      'en': 'Change city',
      'zh_Hant': '更改城市',
    },
    '7en0j992': {
      'en': 'My tickets',
      'zh_Hant': '我的票',
    },
    'qe049r10': {
      'en': 'All tickets from your purchase',
      'zh_Hant': '您購買的所有門票',
    },
    'wlkknl8k': {
      'en': 'Support',
      'zh_Hant': '支援',
    },
    '0oxxh68q': {
      'en': 'Get quick help',
      'zh_Hant': '獲得快速幫助',
    },
    '6co7mwth': {
      'en': 'PREFERENCES',
      'zh_Hant': '偏好',
    },
    'pqq4u6tn': {
      'en': 'Account',
      'zh_Hant': '帳戶',
    },
    'u464cuwn': {
      'en': 'Profile edit / Logout',
      'zh_Hant': '個人資料編輯/登出',
    },
    'mut1bj2k': {
      'en': 'Notifications',
      'zh_Hant': '通知',
    },
    'b5sj3d6h': {
      'en': 'Push & Email Notifications',
      'zh_Hant': '推播和電子郵件通知',
    },
    '3eyeqbm1': {
      'en': 'Payment methods',
      'zh_Hant': '付款方式',
    },
    'fn2gnmlp': {
      'en': 'Add or edit payment methods',
      'zh_Hant': '新增或編輯付款方式',
    },
    'fw0aag0t': {
      'en': 'Additional settings',
      'zh_Hant': '其他設定',
    },
    '6zm2fgrt': {
      'en': 'Language / Theme',
      'zh_Hant': '語言/主題',
    },
    '33svo6pl': {
      'en': 'INFORMATION',
      'zh_Hant': '資訊',
    },
    'teludejd': {
      'en': 'About',
      'zh_Hant': '關於',
    },
    '0ru3yw8f': {
      'en': 'Version / Privacy policy',
      'zh_Hant': '版本/隱私權政策',
    },
    'k7wf27ov': {
      'en': 'Help Center',
      'zh_Hant': '幫助中心',
    },
    'geroxtrc': {
      'en': 'FAQs / Contact support',
      'zh_Hant': '常見問題/聯絡支持',
    },
    'ibdx46ss': {
      'en': 'Rate Our App',
      'zh_Hant': '評價我們的應用程式',
    },
    'l5slbdlj': {
      'en': 'Your opinion is important to us',
      'zh_Hant': '您的意見對我們很重要',
    },
    'bf68ms1u': {
      'en': 'Security',
      'zh_Hant': '安全',
    },
    'p4lpow6m': {
      'en': 'Privacy and security',
      'zh_Hant': '隱私和安全',
    },
    'sb8pub5o': {
      'en': 'Invite friends',
      'zh_Hant': '邀請好友',
    },
    '2dzlpxqg': {
      'en': 'Get bonuses from the invitation',
      'zh_Hant': '邀請即可獲得獎勵',
    },
    'hxlfhz0s': {
      'en': 'Logout',
      'zh_Hant': '登出',
    },
    '9t4qc53m': {
      'en': 'Logout Your Account',
      'zh_Hant': '登出您的帳號',
    },
    '6rptqura': {
      'en': 'App version 1.01.0',
      'zh_Hant': '應用程式版本 1.01.0',
    },
    'nd1hjorn': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Walkthrough
  {
    'mys9oo8l': {
      'en': 'DISCOVER EVENTS NEAR YOU',
      'zh_Hant': '發現您附近的活動',
    },
    'ssxhm4gk': {
      'en':
          'Explore a curated list of exciting events happening in your city, from festivals to workshops.',
      'zh_Hant': '探索您所在城市舉辦的精彩活動列表，包括節慶和研討會。',
    },
    'ssf13b3t': {
      'en': 'FIND YOUR PERFECT EXPERIENCE',
      'zh_Hant': '找到您的完美體驗',
    },
    '1klzraip': {
      'en':
          'Find events you’ll love! From concerts to workshops, explore and book experiences tailored to you.',
      'zh_Hant': '找到你心儀的活動！從音樂會到工作坊，探索並預訂你專屬的體驗。',
    },
    'pwsuqrnj': {
      'en': 'BOOK AND ATTEND WITH EASE',
      'zh_Hant': '輕鬆預訂並參加',
    },
    'pt8g2xgz': {
      'en':
          'Effortlessly book your spot, manage your tickets, and enjoy a seamless event experience from start to finish.',
      'zh_Hant': '輕鬆預訂您的位置、管理您的門票，並從開始到結束享受無縫的活動體驗。',
    },
    'fekoon5s': {
      'en': 'HOST YOUR OWN EVENT',
      'zh_Hant': '舉辦自己的活動',
    },
    '0555028v': {
      'en':
          'Share your passion, connect with your audience, and bring your unique event to life with ease.',
      'zh_Hant': '分享您的熱情，與您的觀眾建立聯繫，並輕鬆地讓您的獨特活動栩栩如生。',
    },
    'yk3xzz5a': {
      'en': 'NEXT',
      'zh_Hant': '下一個',
    },
    'f7w0vaf6': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Login
  {
    'kv81hpib': {
      'en': 'Get Started',
      'zh_Hant': '開始',
    },
    '7pkakh11': {
      'en':
          'Register for events, subscribe to calendars and manage events you\'re going to.',
      'zh_Hant': '註冊活動、訂閱日曆並管理您要參加的活動。',
    },
    'wpe57lz6': {
      'en': 'Continue with Google',
      'zh_Hant': '繼續使用 Google',
    },
    '68ve4y0m': {
      'en': 'Continue with Facebook',
      'zh_Hant': '繼續使用 Facebook',
    },
    's0mv27d3': {
      'en': 'Continue with Apple',
      'zh_Hant': '繼續使用 Apple',
    },
    't9vczu40': {
      'en': 'OR',
      'zh_Hant': '或者',
    },
    '2ah223rn': {
      'en': 'Email',
      'zh_Hant': '電子郵件',
    },
    'csq74trp': {
      'en': 'Emter your email',
      'zh_Hant': '輸入您的電子郵件',
    },
    'ly9lhvi5': {
      'en': 'test@example.com',
      'zh_Hant': 'example@domain.com',
    },
    'mtnho0ch': {
      'en': 'Password',
      'zh_Hant': '密碼',
    },
    'oak43m2q': {
      'en': 'Enter your password',
      'zh_Hant': '輸入您的密碼',
    },
    'j85a8rk4': {
      'en': 'testpassword123',
      'zh_Hant': 'example@domain.com',
    },
    '855s2zdq': {
      'en': 'Continue',
      'zh_Hant': '繼續',
    },
    'ezwh63qq': {
      'en': 'Don\'t have accoumt',
      'zh_Hant': '還沒有帳號',
    },
    'hzsbpx5t': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // HelpCenter
  {
    'lcf1lxi0': {
      'en': 'Help & Support',
      'zh_Hant': '幫助與支持',
    },
    '5lo3nc8l': {
      'en': 'FAQ',
      'zh_Hant': '常問問題',
    },
    '2xx8hm2n': {
      'en': 'Contact Support',
      'zh_Hant': '聯繫支持',
    },
    'qtus371e': {
      'en': 'Privacy Policy',
      'zh_Hant': '隱私權政策',
    },
    'wx1byevb': {
      'en': 'Terms & Conditions',
      'zh_Hant': '條款與條件',
    },
    'vyif43wp': {
      'en': 'Partnership with Eventy',
      'zh_Hant': '與 Eventy 合作',
    },
    'n3cgkr5o': {
      'en': 'Feedback',
      'zh_Hant': '回饋',
    },
    'f9xg2uov': {
      'en': 'Rate Us',
      'zh_Hant': '評價我們',
    },
    'y8u89k0w': {
      'en': 'Visit Our Website',
      'zh_Hant': '造訪我們的網站',
    },
    'a4dj9lg6': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // HelpCenterFAQ
  {
    '7i1zjafj': {
      'en': 'FAQ',
      'zh_Hant': '常問問題',
    },
    '4c4kzxuc': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // HelpCenterSupport
  {
    'lj0ljmjv': {
      'en': 'Contact Support',
      'zh_Hant': '聯繫支持',
    },
    '2jvigcnp': {
      'en': 'Customer Service',
      'zh_Hant': '客戶服務',
    },
    'zvzcmh5d': {
      'en': 'WhatsApp',
      'zh_Hant': 'WhatsApp',
    },
    '24aa2161': {
      'en': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    '61rt2t0f': {
      'en': 'Visit our Website',
      'zh_Hant': '造訪我們的網站',
    },
    '20r4x8bg': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // HelpCenterPrivacy
  {
    'vchww7zj': {
      'en': 'Privacy Policy',
      'zh_Hant': '隱私權政策',
    },
    'ppjwol3o': {
      'en':
          'At Eventy, your privacy is a priority. This Privacy Policy explains how we collect, use, and protect your personal information when you use our app.\n\n1. Information We Collect\nPersonal Information: Name, email address, phone number, and payment details (collected during registration or ticket purchase).\nLocation Data: To suggest events near you (only if you allow location access).\nUsage Data: How you interact with the app to improve our services.\nEvent Information: Events you attend, book, or host through Eventy.\n\n2. How We Use Your Information\nTo recommend events tailored to your interests.\nTo process event bookings and payments.\nTo send updates, reminders, or notifications about events.\nTo improve app performance and your overall experience.\nFor customer support and communication purposes.\n\n3. How We Protect Your Information\nWe use industry-standard encryption to secure your data.\nAccess to your personal information is limited to authorized personnel only.\nWe do not sell or share your data with third-party advertisers.\n\n4. Third-Party Services\nWe may share your information with trusted service providers (e.g., payment processors) to complete transactions or deliver services. These providers follow strict data protection rules.\n\n5. Your Rights\nYou can update or delete your account at any time.\nYou can opt-out of notifications through your app settings.\nYou can request a copy of the data we store about you.\n\n6. Cookies and Tracking\nWe may use cookies to personalize your experience. You can disable cookies in your browser or app settings, though some features may not work properly.\n\n7. Changes to This Policy\nWe may update this Privacy Policy to reflect changes in our practices or services. You’ll be notified of significant updates through the app or email.',
      'zh_Hant':
          'Eventy 高度重視您的隱私。本隱私權政策解釋了當您使用我們的應用程式時，我們如何收集、使用和保護您的個人資訊。\n\n1. 我們收集的資訊\n個人資訊：姓名、電子郵件地址、電話號碼和付款詳情（註冊或購票時收集）。\n位置資料：用於推薦您附近的活動（僅在您允許存取位置資訊的情況下）。\n使用數據：您如何與應用程式互動以改善我們的服務。\n活動資訊：您透過 Eventy 參加、預訂或主辦的活動。\n\n2. 我們如何使用您的訊息\n推薦符合您興趣的活動。\n處理活動預訂和付款。\n發送活動更新、提醒或通知。\n提升應用程式效能和您的整體體驗。\n用於客戶支援和溝通。\n\n3. 我們如何保護您的訊息\n我們使用業界標準加密技術來保護您的資料。\n只有授權人員才能存取您的個人資訊。\n我們不會向第三方廣告商出售或分享您的資料。\n\n4. 第三方服務\n我們可能會與值得信賴的服務提供者（例如支付處理商）分享您的訊息，以完成交易或提供服務。這些提供者遵守嚴格的資料保護規則。\n\n5. 您的權利\n您可以隨時更新或刪除您的帳戶。\n您可以透過應用程式設定選擇退出通知。\n您可以要求取得我們儲存的您的資料副本。\n\n6. Cookie 和追蹤\n我們可能會使用 Cookie 來個人化您的體驗。您可以在瀏覽器或應用程式設定中停用 Cookie，但某些功能可能無法正常運作。\n\n7. 本政策的變更\n我們可能會更新本隱私權政策，以反映我們實踐或服務的變更。我們將透過應用程式或電子郵件通知您重大更新。',
    },
    'scy46qbc': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // HelpCenterTerms
  {
    'cbn83hcr': {
      'en': 'Terms & Conditions',
      'zh_Hant': '條款與條件',
    },
    'xk3y5b42': {
      'en':
          'Welcome to Eventy! By using our application, you agree to these Terms & Conditions. Please read them carefully before accessing or using the services provided by Eventy.\n\n1. Acceptance of Terms\nBy creating an account, booking an event, or using the Eventy platform, you agree to comply with these terms. If you do not agree, please do not use the app.\n\n2. User Eligibility\nYou must be at least 18 years old to register or make purchases through Eventy.\nYou are responsible for maintaining the confidentiality of your account credentials.\n\n3. Event Bookings\nEvent bookings are subject to availability and the terms set by the event organizers.\nOnce confirmed, bookings may only be canceled or modified according to the cancellation policy specified for that event.\nEventy is not liable for changes, delays, or cancellations made by the event organizer.\n\n4. Hosting Events\nIf you are an organizer, you are solely responsible for the accuracy of event details, ticket pricing, and ensuring compliance with local regulations.\nEventy reserves the right to remove or modify events that violate our policies.\n\n5. Payments and Fees\nAll payments are processed securely through our payment gateway.\nPrices are displayed in [Insert Currency] and may include additional taxes or fees.\nRefunds, if applicable, are processed according to the organizer’s refund policy.\n6. Prohibited Activities\nWhile using Eventy, you agree not to:\n\nPost false, misleading, or fraudulent event information.\nUse the platform for illegal purposes or activities.\nViolate intellectual property rights or upload harmful content.\n7. Limitation of Liability\nEventy acts as a platform connecting users with event organizers. We are not responsible for:\n\nThe quality, safety, or legality of events listed.\nPersonal injuries, damages, or losses incurred during event participation.\n8. Intellectual Property\nAll content and materials on Eventy, including logos, designs, and trademarks, are the property of Eventy. Unauthorized use or reproduction is strictly prohibited.\n\n9. Privacy\nYour use of Eventy is governed by our Privacy Policy, which outlines how we collect and use your information.\n\n10. Modifications to Terms\nEventy reserves the right to update these Terms & Conditions at any time. Changes will be communicated through the app or email, and continued use of the app signifies your acceptance of the updated terms.\n\n11. Dispute Resolution\nAny disputes arising from the use of Eventy will be resolved under the laws of [Insert Country/Region].\n\n',
      'zh_Hant':
          '歡迎來到 Eventy！使用我們的應用程式即表示您同意以下條款和條件。請在存取或使用 Eventy 提供的服務前仔細閱讀。\n\n1. 接受條款\n建立帳戶、預訂活動或使用 Eventy 平台，即表示您同意遵守這些條款。如果您不同意，請勿使用本應用程式。\n\n2. 用戶資格\n您必須年滿 18 歲才能透過 Eventy 註冊或購買。\n您有責任維護您帳戶憑證的機密性。\n\n3. 活動預訂\n活動預訂視供應情況而定，並受活動組織者規定的條款約束。\n預訂一經確認，僅可依該活動指定的取消政策取消或修改。\nEventy 對活動組織者所做的更改、延誤或取消不承擔任何責任。\n\n4. 活動主辦\n如果您是組織者，您將對活動詳情的準確性、門票價格以及確保遵守當地法規負全部責任。\nEventy 保留刪除或修改違反我們政策的活動的權利。\n\n5. 付款和費用\n所有付款均透過我們的支付網關安全處理。\n價格以[輸入貨幣]顯示，可能包含額外的稅金或費用。\n退款（如適用）將根據組織者的退款政策處理。\n6. 禁止活動\n使用 Eventy 時，您同意不：\n\n發布虛假、誤導性或欺詐性的活動資訊。\n將平台用於非法目的或活動。\n侵害智慧財產權或上傳有害內容。\n7. 責任限制\nEventy 是一個連結使用者和活動組織者的平台。我們不對以下事項負責：\n\n所列活動的品質、安全性或合法性。\n參與活動期間發生的人身傷害、損害或損失。\n8. 智慧財產權\nEventy 上的所有內容和資料，包括標誌、設計和商標，均為 Eventy 的財產。嚴禁未經授權使用或複製。\n\n9. 隱私\n您對 Eventy 的使用受我們的隱私權政策約束，該政策概述了我們如何收集和使用您的資訊。\n\n10. 條款修改\nEventy 保留隨時更新本條款和條件的權利。變更將透過應用程式或電子郵件告知，繼續使用應用程式即表示您接受更新後的條款。\n\n11. 爭議解決\n因使用 Eventy 而產生的任何爭議將根據 [插入國家/地區] 的法律解決。',
    },
    '5k3x9fat': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Notifications
  {
    'r0itjhgt': {
      'en': 'Notifications',
      'zh_Hant': '通知',
    },
    'tbzhpuak': {
      'en': 'General Notification',
      'zh_Hant': '一般通知',
    },
    '14atcwda': {
      'en': 'Sound',
      'zh_Hant': '聲音',
    },
    'elhzr9kb': {
      'en': 'Payments',
      'zh_Hant': '付款',
    },
    'ciclknrm': {
      'en': 'App Updates',
      'zh_Hant': '應用程式更新',
    },
    '7vm8na7o': {
      'en': 'Promo & Discount',
      'zh_Hant': '促銷和折扣',
    },
    'eouwgtel': {
      'en': 'Special Offers',
      'zh_Hant': '特別優惠',
    },
    'oa1n44m8': {
      'en': 'Purchased Tickets',
      'zh_Hant': '已購門票',
    },
    'w68tm2fl': {
      'en': 'Recomendations',
      'zh_Hant': '建議',
    },
    't84e20gn': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // AdditionalSettingsLanguages
  {
    'sw2780rm': {
      'en': 'Select Language',
      'zh_Hant': '選擇語言',
    },
    'dsd679qh': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Payment
  {
    'n3wjrpsy': {
      'en': 'Payment',
      'zh_Hant': '支付',
    },
    'rm33bwjh': {
      'en': 'PayPal',
      'zh_Hant': 'PayPal',
    },
    'jupzod7j': {
      'en': 'Connected',
      'zh_Hant': '已連接',
    },
    'cyhdmnta': {
      'en': 'Google Play',
      'zh_Hant': 'Google Play',
    },
    'kigw5ruj': {
      'en': 'Connected',
      'zh_Hant': '已連接',
    },
    'ngig3jo6': {
      'en': '**** 3456',
      'zh_Hant': '**** 3456',
    },
    's2sd6zlg': {
      'en': 'Connected',
      'zh_Hant': '已連接',
    },
    '2y0pxhtu': {
      'en': '**** 6388',
      'zh_Hant': '**** 6388',
    },
    'asev2huh': {
      'en': 'Connected',
      'zh_Hant': '已連接',
    },
    'wvzr48ez': {
      'en': 'Add New Card',
      'zh_Hant': '新增卡',
    },
    'zj9i2g79': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Security
  {
    'evn0fejv': {
      'en': 'Security',
      'zh_Hant': '安全',
    },
    '4bajk56i': {
      'en': 'Remember me',
      'zh_Hant': '記住帳號',
    },
    'gntd8jlh': {
      'en': 'Face ID',
      'zh_Hant': '面容 ID',
    },
    'n0fb36bh': {
      'en': 'Biometric ID',
      'zh_Hant': '生物識別',
    },
    'zqzpt697': {
      'en': 'Google Authenticator',
      'zh_Hant': 'Google 驗證器',
    },
    'la03p4k0': {
      'en': 'Change PIN',
      'zh_Hant': '更改 PIN',
    },
    '4iiyluuc': {
      'en': 'Change Password',
      'zh_Hant': '更改密碼',
    },
    'qwoz8mv7': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // AboutApp
  {
    'v9yy3bf8': {
      'en': 'About EVENTY',
      'zh_Hant': '關於 EVENTY',
    },
    'wbelo5wa': {
      'en':
          'Eventy – Discover, Book, and Enjoy Amazing Events\n\nEventy is your ultimate app for finding events that match your interests. Whether it\'s concerts, festivals, workshops, meetups, or cultural events, Eventy helps you explore and book with ease.',
      'zh_Hant':
          'Eventy – 發現、預訂、享受精彩活動\n\nEventy 是一款幫助您輕鬆找到符合您興趣的活動應用程式。無論是音樂會、節日慶典、工作坊、聚會或文化活動，Eventy 都能幫助您輕鬆探索和預訂。',
    },
    'l3jos7mv': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // InviteFriends
  {
    'y1tuegtb': {
      'en': 'Invite Friends',
      'zh_Hant': '邀請好友',
    },
    'byb64c8m': {
      'en': 'Emily Johnson',
      'zh_Hant': '艾米麗·約翰遜',
    },
    'imnillwj': {
      'en': '+1-3002890231',
      'zh_Hant': '+1-3002890231',
    },
    'zuh985st': {
      'en': 'Invite',
      'zh_Hant': '邀請',
    },
    'j9slha7u': {
      'en': 'Michael Smith',
      'zh_Hant': '麥可史密斯',
    },
    'v7mcgfrf': {
      'en': '+1-323634532',
      'zh_Hant': '+1-323634532',
    },
    '02b88u55': {
      'en': 'Invited',
      'zh_Hant': '受邀',
    },
    'v1ehcjvd': {
      'en': 'Sarah Williams',
      'zh_Hant': '莎拉威廉斯',
    },
    'ofhzblo1': {
      'en': '+1-636452432',
      'zh_Hant': '+1-636452432',
    },
    '5lnoihx1': {
      'en': 'Invite',
      'zh_Hant': '邀請',
    },
    'th9jnxry': {
      'en': 'Jessica Brown',
      'zh_Hant': '傑西卡·布朗',
    },
    '88glrumy': {
      'en': '+1-879352423',
      'zh_Hant': '+1-879352423',
    },
    'd8wdk6mt': {
      'en': 'Invited',
      'zh_Hant': '受邀',
    },
    'ih4re1hb': {
      'en': 'James Anderson',
      'zh_Hant': '詹姆斯安德森',
    },
    'kacnxxkl': {
      'en': '+1-146345534',
      'zh_Hant': '+1-146345534',
    },
    'gbqh4hk9': {
      'en': 'Invite',
      'zh_Hant': '邀請',
    },
    'ovja27pj': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // AccountEdit
  {
    '1p18qbd3': {
      'en': 'Edit Profile',
      'zh_Hant': '編輯個人資料',
    },
    'vnrd6ctg': {
      'en': 'Full Name',
      'zh_Hant': '姓名',
    },
    'ki2f2qws': {
      'en': 'Enter your full name',
      'zh_Hant': '輸入您的全名',
    },
    'ldn0q1e2': {
      'en': 'Alex Johnson',
      'zh_Hant': '亞歷克斯·約翰遜',
    },
    'd2k0rx67': {
      'en': 'Email',
      'zh_Hant': '電子郵件',
    },
    'za5k2nce': {
      'en': 'Emter your email',
      'zh_Hant': '輸入您的電子郵件',
    },
    'amcc0wec': {
      'en': 'example@domain.com',
      'zh_Hant': 'example@domain.com',
    },
    'ryxso85u': {
      'en': 'Gender',
      'zh_Hant': '性別',
    },
    '6kt784w3': {
      'en': 'Age',
      'zh_Hant': '年齡',
    },
    's52xde1d': {
      'en': 'Enter your age',
      'zh_Hant': '輸入您的年齡',
    },
    'unzgwac8': {
      'en': '27',
      'zh_Hant': '二十七',
    },
    '6wxxtxus': {
      'en': 'Save changes',
      'zh_Hant': '儲存變更',
    },
    '9v0fzciq': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // LoginEmail
  {
    '4qvs14u0': {
      'en': 'Enter code',
      'zh_Hant': '輸入代碼',
    },
    'kdk2ilae': {
      'en': 'We sent a verification code to your email example@domain.com',
      'zh_Hant': '我們已將驗證碼寄至您的信箱 example@domain.com',
    },
    'a4c76j43': {
      'en': 'Enter code',
      'zh_Hant': '輸入代碼',
    },
    'q8u24ydm': {
      'en': 'Emter your password',
      'zh_Hant': '輸入您的密碼',
    },
    '20yxyyai': {
      'en': '123456',
      'zh_Hant': '123456',
    },
    'c20d5v9e': {
      'en': 'Next',
      'zh_Hant': '下一個',
    },
    'l820r24r': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // ForgotPassword
  {
    'lttaflgg': {
      'en': 'Forgot Password',
      'zh_Hant': '忘記密碼',
    },
    'wlynvw5h': {
      'en':
          'Enter your email in the lower field. We will send you a new password by email',
      'zh_Hant': '在下方欄位中輸入您的電子郵件地址。我們將透過電子郵件發送新密碼給您',
    },
    '5qalh1yv': {
      'en': 'Email',
      'zh_Hant': '電子郵件',
    },
    'k0iqw9ie': {
      'en': 'Emter your email',
      'zh_Hant': '輸入您的電子郵件',
    },
    '4em5zk1y': {
      'en': 'example@domain.com',
      'zh_Hant': 'example@domain.com',
    },
    'vzwiwa93': {
      'en': 'Reset password',
      'zh_Hant': '重設密碼',
    },
    '270bm2gq': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // ForgotPassword2
  {
    'uqwlyxy8': {
      'en': 'Enter Verification Code',
      'zh_Hant': '輸入驗證碼',
    },
    'wpwf1uyy': {
      'en': 'To continue, please enter the code sent to your email',
      'zh_Hant': '若要繼續，請輸入發送到您信箱的代碼',
    },
    'l32pz8ay': {
      'en': '-',
      'zh_Hant': '-',
    },
    'eros1de6': {
      'en': '5',
      'zh_Hant': '5',
    },
    'z5z3zp9u': {
      'en': '-',
      'zh_Hant': '-',
    },
    '04trtozq': {
      'en': '8',
      'zh_Hant': '8',
    },
    'hu1takt3': {
      'en': '-',
      'zh_Hant': '-',
    },
    'e0ogr5na': {
      'en': '2',
      'zh_Hant': '2',
    },
    'yg5linwo': {
      'en': '-',
      'zh_Hant': '-',
    },
    'qsuryw4e': {
      'en': '9',
      'zh_Hant': '9',
    },
    '4ezcan8n': {
      'en': 'You can resend the code in 54 seconds',
      'zh_Hant': '您可以在 54 秒後重新傳送代碼',
    },
    'fp3s4erc': {
      'en': 'Resend Code',
      'zh_Hant': '重新發送程式碼',
    },
    'g3rirnto': {
      'en': 'Continue',
      'zh_Hant': '繼續',
    },
    '3u5rwuij': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // ForgotPassword3
  {
    '82s0o0zy': {
      'en': 'Create New Password',
      'zh_Hant': '建立新密碼',
    },
    'jxcngx0a': {
      'en': 'In order to recover, you need to enter a new password',
      'zh_Hant': '為了恢復，您需要輸入新密碼',
    },
    'g2z1n6s1': {
      'en': 'New Password',
      'zh_Hant': '新密碼',
    },
    'pt0olwdw': {
      'en': 'Emter your password',
      'zh_Hant': '輸入您的密碼',
    },
    'e6cficfb': {
      'en': '11111111',
      'zh_Hant': '11111111',
    },
    'rldqjqle': {
      'en': 'Confirm Password',
      'zh_Hant': '確認密碼',
    },
    'j2jx9kc4': {
      'en': 'Emter your password',
      'zh_Hant': '輸入您的密碼',
    },
    'ov08z50p': {
      'en': '11111111',
      'zh_Hant': '11111111',
    },
    'dqikhfs2': {
      'en': 'Create New Password',
      'zh_Hant': '建立新密碼',
    },
    '5rgnr2tr': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Questions
  {
    'giv06l1c': {
      'en': 'Select Your Interests',
      'zh_Hant': '選擇您的興趣',
    },
    'zyf8ms7r': {
      'en': 'Discover events tailored to your passions and hobbies.',
      'zh_Hant': '發現符合您的熱情和嗜好的活動。',
    },
    '1pw01zhs': {
      'en': 'What are you looking for?',
      'zh_Hant': '您要尋找什麼？',
    },
    'urhdsgj4': {
      'en': 'Select the option(s) that reflect what you\'re looking for.',
      'zh_Hant': '選擇反映您正在尋找的內容的選項。',
    },
    'nhtmsd8r': {
      'en': 'Follow event \norganizers',
      'zh_Hant': '關注活動組織者',
    },
    'sdppvtm9': {
      'en':
          'Follow groups to attend their events. You\'ll get more suggestions based on what you join.',
      'zh_Hant': '關注群組即可參加他們的活動。您將根據所加入的內容獲得更多建議。',
    },
    '8nw3wmsq': {
      'en': 'Continue',
      'zh_Hant': '繼續',
    },
    'tuic5y2p': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Notificatios
  {
    'b5jzqbb3': {
      'en': 'Notifications',
      'zh_Hant': '通知',
    },
    'x0520g01': {
      'en': 'Your Ticket is Confirmed',
      'zh_Hant': '您的票已確認',
    },
    '87jcczib': {
      'en': 'Today  |  15:25 PM',
      'zh_Hant': '今天 | 下午 15:25',
    },
    'vrpp8kp2': {
      'en':
          'Your booking for Ultra Music Festival is confirmed! Get ready to enjoy an unforgettable event.',
      'zh_Hant': '您的 Ultra 音樂節預訂已確認！準備好享受一場難忘的盛會吧！',
    },
    '0hcbb359': {
      'en': 'Event Rescheduled: New Date Confirmed',
      'zh_Hant': '活動重新安排：新日期已確認',
    },
    '1n5scf0h': {
      'en': 'Yesterday  |  11:25 AM',
      'zh_Hant': '昨天 | 上午 11:25',
    },
    'ubj9ijvo': {
      'en':
          'The \"Ultra Music Festival\" has been rescheduled to March 20, 2025. Your tickets remain valid.',
      'zh_Hant': '「Ultra 音樂節」改期至 2025 年 3 月 20 日。您的門票仍然有效。',
    },
    'n6ext9u3': {
      'en': 'Cancellation Request Approved',
      'zh_Hant': '取消請求已批准',
    },
    'ue8p3tij': {
      'en': '12 Dec  |  15:25 PM',
      'zh_Hant': '12 月 12 日 | 下午 3:25',
    },
    'x04o9bkc': {
      'en':
          'Your cancellation for \"Photography Workshop\" has been processed. Refunds will be issued shortly.',
      'zh_Hant': '您的「攝影工作坊」取消申請已處理。退款將很快發放。',
    },
    'u3sdoazz': {
      'en': 'Your Favorite Event is Back!',
      'zh_Hant': '您最喜歡的活動又回來了！',
    },
    'iip1g2yk': {
      'en': '8 Dec  |  15:25 PM',
      'zh_Hant': '12 月 8 日 | 下午 3:25',
    },
    'dxe143xt': {
      'en':
          '\"Jazz Under the Stars\" returns this summer! Book your tickets now and secure your spot.',
      'zh_Hant': '「星空下的爵士樂」今夏回歸！立即訂票，確保席位。',
    },
    'kfgiu8ui': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Reschedule1
  {
    'z9juzqug': {
      'en': 'Reschedule',
      'zh_Hant': '重新安排',
    },
    'i1ajif38': {
      'en': 'Reason for Reschedule',
      'zh_Hant': '改期原因',
    },
    'c1239li8': {
      'en':
          'I confirm that I have reviewed and agree to the updated schedule. I understand that changes to the booking may affect fees, and I accept any associated terms and conditions.',
      'zh_Hant': '我確認已閱讀並同意更新後的行程安排。我理解預訂變更可能會影響費用，並接受所有相關條款和條件。',
    },
    'o3aogttq': {
      'en': 'Next',
      'zh_Hant': '下一個',
    },
    'tk6gpv2t': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // SimpleCalendar
  {
    'hrdsn01e': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Reschedule2
  {
    'z90e1c5b': {
      'en': 'Reschedule Appointmens',
      'zh_Hant': '重新安排預約',
    },
    'onh9gmzb': {
      'en': 'Select your date and session',
      'zh_Hant': '選擇日期和場次',
    },
    '1drbn2v9': {
      'en': 'Submit',
      'zh_Hant': '提交',
    },
    'y8175iqk': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // CancelTicketReasons
  {
    '563j0cwl': {
      'en': 'Cancel ticket',
      'zh_Hant': '取消票',
    },
    'p0sr16ma': {
      'en': 'Reason for the cancellation of the Ticket',
      'zh_Hant': '取消票的原因',
    },
    '2ymwtgbj': {
      'en':
          'I confirm that I have reviewed and agree to the cancel schedule. I understand that changes to the booking may affect availability and fees, and I accept any associated terms and conditions.',
      'zh_Hant': '我確認已閱讀並同意取消安排。我理解預訂變更可能會影響供應情況和費用，並接受所有相關條款和條件。',
    },
    '0ipt0jk4': {
      'en': 'Submit',
      'zh_Hant': '提交',
    },
    'wyju0vry': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // MyTicketsSingle
  {
    'go53aqap': {
      'en': 'My ticket',
      'zh_Hant': '我的票',
    },
    'boctk39n': {
      'en': 'The world\'s premier electronic music festival',
      'zh_Hant': '世界頂級電子音樂節',
    },
    '86rpq2h2': {
      'en': 'Date',
      'zh_Hant': '日期',
    },
    'wdsy0dq1': {
      'en': '02:00 PM',
      'zh_Hant': '下午 2:00',
    },
    'zrlvvi3n': {
      'en': '\nNov 25, 2025',
      'zh_Hant': '2025年11月25日',
    },
    'xplt2pgw': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    'u3kmqayh': {
      'en': 'Miami, FL',
      'zh_Hant': '佛羅裡達州邁阿密',
    },
    'rd2vq3we': {
      'en': '\nBayfront Park',
      'zh_Hant': '海灣公園',
    },
    'vi9vseaa': {
      'en': 'Personal Information',
      'zh_Hant': '個人資訊',
    },
    'vhuqm6g5': {
      'en': 'Name',
      'zh_Hant': '姓名',
    },
    'e435x5am': {
      'en': 'Alex',
      'zh_Hant': '亞歷克斯',
    },
    '8tdvew4a': {
      'en': 'Last Name',
      'zh_Hant': '姓',
    },
    '74lsm1oj': {
      'en': ' Johnson',
      'zh_Hant': '約翰遜',
    },
    '6m370km5': {
      'en': 'Gender',
      'zh_Hant': '性別',
    },
    'fxpviz2s': {
      'en': 'Male',
      'zh_Hant': '男性',
    },
    'hd397wog': {
      'en': 'Age',
      'zh_Hant': '年齡',
    },
    'w5ut2cms': {
      'en': '26',
      'zh_Hant': '二十六',
    },
    'bt5eroen': {
      'en': 'Order Number',
      'zh_Hant': '訂單編號',
    },
    'jh2rlxf5': {
      'en': '#578363583903',
      'zh_Hant': '#578363583903',
    },
    'szo4y851': {
      'en': 'Ticket/seat',
      'zh_Hant': '票/座位',
    },
    'fcv860wn': {
      'en': 'General Admission (+18), Ultra Premium (+18), Vip Pass (+18)',
      'zh_Hant': '普通門票（+18）、超級門票（+18）、VIP 通行證（+18）',
    },
    '60ccgf6e': {
      'en': 'Gate',
      'zh_Hant': '門',
    },
    'g8u1ol1s': {
      'en': '02',
      'zh_Hant': '02',
    },
    'l41mewy5': {
      'en': 'Row',
      'zh_Hant': '排',
    },
    'lffrrjww': {
      'en': '01',
      'zh_Hant': '01',
    },
    'sb5ruwjn': {
      'en': 'Seat',
      'zh_Hant': '座位',
    },
    '6xdple2c': {
      'en': '15',
      'zh_Hant': '15',
    },
    'bua7o2dm': {
      'en': 'Organizer',
      'zh_Hant': '主辦單位',
    },
    'o07etstc': {
      'en': 'Ultra music Festival',
      'zh_Hant': '超音樂節',
    },
    't4nmzzs3': {
      'en': '220K Followers',
      'zh_Hant': '22萬粉絲',
    },
    'csl4jx6f': {
      'en': 'Follow',
      'zh_Hant': '跟隨',
    },
    '2u291fzl': {
      'en': 'Save ticket as image',
      'zh_Hant': '將票儲存為圖像',
    },
    '5csufmsx': {
      'en': 'EVENTY',
      'zh_Hant': '事件',
    },
    'qcimiu1w': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // LeaveReview
  {
    'a44f7dlb': {
      'en': 'Write Review',
      'zh_Hant': '撰寫評論',
    },
    'u1ls3q4d': {
      'en': 'Write Your Review',
      'zh_Hant': '撰寫您的評論',
    },
    'rra3adzh': {
      'en': 'Enter your review here ...',
      'zh_Hant': '在此輸入您的評論...',
    },
    '43y2jg0r': {
      'en': 'Submit',
      'zh_Hant': '提交',
    },
    'e7vca8iw': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Explore
  {
    'eoapumc1': {
      'en': 'Discover live shows, festivals ...',
      'zh_Hant': '探索現場表演、節慶…',
    },
    '104z7bkh': {
      'en': 'Popular Searches',
      'zh_Hant': '熱門搜尋',
    },
    '5p4yom81': {
      'en': 'Categories',
      'zh_Hant': '類別',
    },
    'xlgpq2ux': {
      'en': 'Explore Events',
      'zh_Hant': '探索活動',
    },
    '7cl2b36u': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // PaymentMethod
  {
    '2jrfeibd': {
      'en': 'Payment',
      'zh_Hant': '支付',
    },
    'wpyjmid1': {
      'en': 'Payment method',
      'zh_Hant': '付款方式',
    },
    '9s20tdao': {
      'en': 'Select the payment method you want to use.',
      'zh_Hant': '選擇您想要使用的付款方式。',
    },
    'f3lb9jt2': {
      'en': 'PayPal',
      'zh_Hant': 'PayPal',
    },
    'y8wfzo0f': {
      'en': 'Google Play',
      'zh_Hant': 'Google Play',
    },
    'a7ntbpnz': {
      'en': '**** 3456',
      'zh_Hant': '**** 3456',
    },
    'avamxbjy': {
      'en': '**** 6388',
      'zh_Hant': '**** 6388',
    },
    '371ofx94': {
      'en': 'Add New Card',
      'zh_Hant': '新增卡',
    },
    'qhm4plvj': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // ExploreSearch
  {
    'le5h9d3h': {
      'en': 'Discover city tours, restaurants ...',
      'zh_Hant': '探索城市旅遊、餐廳......',
    },
    'wc5qtypk': {
      'en': 'Sort',
      'zh_Hant': '種類',
    },
    '803826ka': {
      'en': 'Trending events',
      'zh_Hant': '熱門事件',
    },
    'b1tcahis': {
      'en': 'Search result',
      'zh_Hant': '搜尋結果',
    },
    '0yrqilxd': {
      'en': 'Search results',
      'zh_Hant': '搜尋結果',
    },
    'g4pjcytt': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // PaymentAddCard
  {
    'pag9eqrq': {
      'en': 'Add New Card',
      'zh_Hant': '新增卡',
    },
    'fwrshs0j': {
      'en': 'Add',
      'zh_Hant': '添加',
    },
    'wf4skmp1': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // AdditionalSettings
  {
    'u1hmw2gm': {
      'en': 'Additional Settings',
      'zh_Hant': '其他設定',
    },
    'n2xws1te': {
      'en': 'Dark mode',
      'zh_Hant': '黑暗模式',
    },
    'hlaaos39': {
      'en': 'Languages',
      'zh_Hant': '語言',
    },
    'xvcf0b8o': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Location
  {
    'hk7pvenm': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    'pugybzxc': {
      'en': 'Search by city',
      'zh_Hant': '按城市搜尋',
    },
    'oyc43nc2': {
      'en': 'Use my current location',
      'zh_Hant': '使用我的當前位置',
    },
    '7kds4c2r': {
      'en': 'Suggested cities',
      'zh_Hant': '建議城市',
    },
    'xzi096tk': {
      'en': 'Paris, ',
      'zh_Hant': '巴黎，',
    },
    'lua2wecl': {
      'en': 'France',
      'zh_Hant': '法國',
    },
    'js0byh6e': {
      'en': 'London, ',
      'zh_Hant': '倫敦，',
    },
    'hmso8gkd': {
      'en': 'United Kingdom',
      'zh_Hant': '英國',
    },
    'zqlqgsup': {
      'en': 'New York, ',
      'zh_Hant': '紐約，',
    },
    'secs6sdd': {
      'en': 'United States',
      'zh_Hant': '美國',
    },
    '0jz6tfgd': {
      'en': 'Mexico City, ',
      'zh_Hant': '墨西哥城，',
    },
    'oklydbqo': {
      'en': 'Mexico',
      'zh_Hant': '墨西哥',
    },
    '439j00df': {
      'en': 'Milan, ',
      'zh_Hant': '米蘭,',
    },
    '0enot4br': {
      'en': 'Italy',
      'zh_Hant': '義大利',
    },
    'ug1xd3zy': {
      'en': 'Miami, ',
      'zh_Hant': '邁阿密，',
    },
    'h6l0csi2': {
      'en': 'United States',
      'zh_Hant': '美國',
    },
    'z91jrnys': {
      'en': 'Valencia, ',
      'zh_Hant': '瓦倫西亞,',
    },
    's2c7e7fb': {
      'en': 'Spain',
      'zh_Hant': '西班牙',
    },
    'zy64zpk6': {
      'en': 'Seville, ',
      'zh_Hant': '塞維利亞，',
    },
    'sindlyls': {
      'en': 'Spain',
      'zh_Hant': '西班牙',
    },
    'hwdm8ka6': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // MessageSupport
  {
    'ud6lv45n': {
      'en': 'Oliver Brooks',
      'zh_Hant': '奧利佛·布魯克斯',
    },
    '3bk134wl': {
      'en': 'Online',
      'zh_Hant': '在線的',
    },
    'qplqrmag': {
      'en': 'Today',
      'zh_Hant': '今天',
    },
    'sq6euvxk': {
      'en':
          'Hi, I need help. I’m trying to book a ticket for a seminar, but I’m not sure if my payment went through.',
      'zh_Hant': '您好，我需要幫忙。我想預訂一個研討會的門票，但不確定付款是否成功。',
    },
    '4jj3gpfm': {
      'en': '16:00',
      'zh_Hant': '16:00',
    },
    'lxqztzar': {
      'en':
          'Hello! Thank you for reaching out. Let me check that for you. Could you please share the seminar name and the email address you used for the booking?',
      'zh_Hant': '您好！感謝您的聯繫。我幫您確認一下。請問您能分享一下研討會的名稱以及您預訂時使用的電子郵件地址嗎？',
    },
    'efzelvmg': {
      'en': '16:05',
      'zh_Hant': '16:05',
    },
    'pg3vt5co': {
      'en':
          'Sure, the seminar is \"Digital Marketing 101,\" and my email is alexjohnson@gmail.com.',
      'zh_Hant': '當然，研討會的主題是“數位行銷 101”，我的電子郵件是 alexjohnson@gmail.com。',
    },
    'ei1nfi1s': {
      'en': '16:06',
      'zh_Hant': '16:06',
    },
    'vm9se5i2': {
      'en':
          'Thank you, Alex! I see that your payment is still pending. It might take a few minutes to process. Could you confirm if the payment amount has been deducted from your bank account?',
      'zh_Hant': '謝謝，Alex！我看到您的付款仍在等待處理。可能需要幾分鐘才能處理。請確認付款金額是否已從您的銀行帳戶中扣除？',
    },
    'ys2j4nl9': {
      'en': '16:06',
      'zh_Hant': '16:06',
    },
    '0ftwsoyu': {
      'en': 'Yes, it was deducted.',
      'zh_Hant': '是的，扣除了。',
    },
    'qkws8r4l': {
      'en': '16:08',
      'zh_Hant': '16:08',
    },
    'wc2a0kdn': {
      'en':
          'Got it. In this case, the payment might be stuck in processing. Don’t worry; I’ll escalate this to our payment team. You’ll receive a confirmation within the next 24 hours.',
      'zh_Hant':
          '知道了。在這種情況下，付款可能卡在處理中。別擔心，我會將此事回報給我們的付款團隊。您將在接下來的 24 小時內收到確認訊息。',
    },
    '7ystv613': {
      'en': '16:10',
      'zh_Hant': '16:10',
    },
    '72dn9v4l': {
      'en': 'Okay, thanks! Do I need to do anything else?',
      'zh_Hant': '好的，謝謝！我還需要做什麼嗎？',
    },
    'dyyrc8ap': {
      'en': '16:15',
      'zh_Hant': '16:15',
    },
    '5hv8422a': {
      'en':
          'No, you’re all set for now. We’ll handle it and keep you updated. If you don’t hear from us within 24 hours, feel free to message us again.',
      'zh_Hant': '不，您目前已設定完畢。我們會處理並及時通知您最新情況。如果您在 24 小時內沒有收到我們的回复，請隨時再次給我們留言。',
    },
    'lb8c76cg': {
      'en': '16:17',
      'zh_Hant': '16:17',
    },
    '85w6xbuq': {
      'en': 'Thanks for the help!',
      'zh_Hant': '謝謝您的幫忙！',
    },
    's3w5j3vp': {
      'en': '16:20',
      'zh_Hant': '16:20',
    },
    '1ywxov8j': {
      'en': 'You’re welcome! Have a great day and enjoy the seminar!',
      'zh_Hant': '別客氣！祝您有個愉快的一天，享受研討會！',
    },
    'd8rrny9w': {
      'en': '16:22',
      'zh_Hant': '16:22',
    },
    'pj581vny': {
      'en': 'Type message ',
      'zh_Hant': '鍵入訊息',
    },
    'y8tr4lpj': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // SingleEvent
  {
    'px52dupd': {
      'en': 'Mar 15, 2025, 10:00 AM  ·  ',
      'zh_Hant': '2025 年 3 月 15 日 上午 10:00 ·',
    },
    'g4qb86sz': {
      'en': 'Berlin',
      'zh_Hant': '柏林',
    },
    'shwafw9m': {
      'en': 'Ultra music Festival',
      'zh_Hant': '超音樂節',
    },
    '37wp9bcy': {
      'en': '220K Followers',
      'zh_Hant': '22萬粉絲',
    },
    'p6cfzaeg': {
      'en': 'Follow',
      'zh_Hant': '跟隨',
    },
    '3a6trm8b': {
      'en': 'About',
      'zh_Hant': '關於',
    },
    'bgvljb2k': {
      'en': 'General Information',
      'zh_Hant': '一般資訊',
    },
    '3h8zoos3': {
      'en':
          '📅 Date: Sunday & Thursdays (select your date directly from the ticket selector below)\n🕒 Time: 3:30 p.m.\n⏳ Duration: 3.5 hours\n📍 Meeting point: The Swiss Clock in Leicester Square next to the M&M\'s store\n👤 Age requirement: 18+ with valid ID',
      'zh_Hant':
          '📅 日期：週日和週四（請直接從下方的購票器中選擇日期）\n🕒 時間：下午 3:30\n⏳ 時長：3.5 小時\n📍 集合地點：萊斯特廣場 M&M\'s 商店旁的瑞士鐘\n👤 年齡要求：18 歲以上，持有效身分證件',
    },
    'jbr30uyf': {
      'en': '4.9',
      'zh_Hant': '4.9',
    },
    '7n8mcxct': {
      'en': 'Based on 245 reviews',
      'zh_Hant': '根據 245 條點評',
    },
    'k5dx07of': {
      'en': 'Select your date and session',
      'zh_Hant': '選擇日期和場次',
    },
    'vzg1rpfc': {
      'en': 'Hurry Up! Tickets Are Selling Fast',
      'zh_Hant': '快點！門票正在熱賣中',
    },
    'yd25drs6': {
      'en': 'Tickets are in high demand and availability is limited. ',
      'zh_Hant': '門票需求量大，數量有限。',
    },
    'bhxbb1no': {
      'en': 'Gallery',
      'zh_Hant': '畫廊',
    },
    '6mgtgqy8': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    'lzzpl2sd': {
      'en': 'Bayfront Park, Miami, FL',
      'zh_Hant': '佛羅裡達州邁阿密海濱公園',
    },
    'rjd26l37': {
      'en': 'You\'ll love it',
      'zh_Hant': '你會喜歡的',
    },
    'zzak3sum': {
      'en': 'Get tickets',
      'zh_Hant': '取得門票',
    },
    't53ma0ds': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // ReportEvent
  {
    'xsk3rn6n': {
      'en': 'Report Event',
      'zh_Hant': '報告事件',
    },
    '7prhmr7x': {
      'en': 'Reason',
      'zh_Hant': '原因',
    },
    's29qgxwx': {
      'en': 'Let us know what\'s wrong',
      'zh_Hant': '讓我們知道出了什麼問題',
    },
    'sb7dmk9f': {
      'en': 'Send',
      'zh_Hant': '傳送',
    },
    'f24tivux': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // SingleEventCheckout
  {
    'de7gz12b': {
      'en': 'Checkout',
      'zh_Hant': '查看',
    },
    'u0dfzk57': {
      'en': 'Bayfront Park, Miami, FL',
      'zh_Hant': '佛羅裡達州邁阿密海濱公園',
    },
    'rlbfm6yk': {
      'en': 'Date',
      'zh_Hant': '日期',
    },
    '4jhe5o0j': {
      'en': '02:00 PM',
      'zh_Hant': '下午 2:00',
    },
    'mxi0x6i1': {
      'en': '\nNov 25, 2025',
      'zh_Hant': '2025年11月25日',
    },
    'zlblhdth': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    '6r3qe43a': {
      'en': 'Miami, FL',
      'zh_Hant': '佛羅裡達州邁阿密',
    },
    'g4zylrx3': {
      'en': '\nBayfront Park',
      'zh_Hant': '海灣公園',
    },
    'ruapdo2g': {
      'en': 'Selected tickets 3',
      'zh_Hant': '已選票 3',
    },
    'wwi8tbwy': {
      'en': 'General Admission (+18)',
      'zh_Hant': '普通門票（18 歲以上）',
    },
    'ehhgi3mg': {
      'en': '\$250',
      'zh_Hant': '250美元',
    },
    'qh31x3oe': {
      'en': '  incl. \$1.99 Fee',
      'zh_Hant': '含 1.99 美元費用',
    },
    'g19cvvdw': {
      'en': 'Gate',
      'zh_Hant': '門',
    },
    'yzzeh0od': {
      'en': '12',
      'zh_Hant': '12',
    },
    'dfe5z2e3': {
      'en': 'Row',
      'zh_Hant': '排',
    },
    'vgx9oq6q': {
      'en': '06',
      'zh_Hant': '06',
    },
    '4pz19gh6': {
      'en': 'Seat',
      'zh_Hant': '座位',
    },
    'z7ro7ofg': {
      'en': '56',
      'zh_Hant': '56',
    },
    'z4g54ooe': {
      'en': 'Ultra Premium Package (+18)',
      'zh_Hant': '超高級套餐 (+18)',
    },
    'tt3miokn': {
      'en': '\$1,200',
      'zh_Hant': '1,200美元',
    },
    'qtguu14o': {
      'en': '  incl. \$1.99 Fee',
      'zh_Hant': '含 1.99 美元費用',
    },
    '4x2relj0': {
      'en': 'Gate',
      'zh_Hant': '門',
    },
    'dwnc2lqx': {
      'en': '02',
      'zh_Hant': '02',
    },
    '2c6xibba': {
      'en': 'Row',
      'zh_Hant': '排',
    },
    '5cuhhlgw': {
      'en': '01',
      'zh_Hant': '01',
    },
    'nxw2k03b': {
      'en': 'Seat',
      'zh_Hant': '座位',
    },
    'xzu5fjqs': {
      'en': '15',
      'zh_Hant': '15',
    },
    '3xybcsh6': {
      'en': 'Vip Pass, Premium viewing (+18)',
      'zh_Hant': 'Vip 通行證，進階觀看 (+18)',
    },
    'avx28jxj': {
      'en': '\$500',
      'zh_Hant': '500美元',
    },
    'tlu43fa6': {
      'en': '  incl. \$1.99 Fee',
      'zh_Hant': '含 1.99 美元費用',
    },
    'jk8kshcw': {
      'en': 'Gate',
      'zh_Hant': '門',
    },
    'jymt9npx': {
      'en': '07',
      'zh_Hant': '07',
    },
    'l2voxg8o': {
      'en': 'Row',
      'zh_Hant': '排',
    },
    'xiw8mynj': {
      'en': '08',
      'zh_Hant': '08',
    },
    'o23vvged': {
      'en': 'Seat',
      'zh_Hant': '座位',
    },
    '2yn1zlkx': {
      'en': '25',
      'zh_Hant': '二十五',
    },
    'p3excmwj': {
      'en': 'Contact information',
      'zh_Hant': '聯絡資訊',
    },
    'wa1mmavt': {
      'en': 'Full Name',
      'zh_Hant': '姓名',
    },
    'lj4rsmjq': {
      'en': 'Enter your full name',
      'zh_Hant': '輸入您的全名',
    },
    'hvo8f21y': {
      'en': 'Alex Johnson',
      'zh_Hant': '亞歷克斯·約翰遜',
    },
    '8crz2886': {
      'en': 'Email address',
      'zh_Hant': '電子郵件',
    },
    '3nkzvm0g': {
      'en': 'Enter your full name',
      'zh_Hant': '輸入您的全名',
    },
    '0huoxzev': {
      'en': 'example@domain.com',
      'zh_Hant': 'example@domain.com',
    },
    '6oog1m4w': {
      'en': 'Payment method',
      'zh_Hant': '付款方式',
    },
    'r666qyr4': {
      'en': '\$125.00',
      'zh_Hant': '125.00 美元',
    },
    'mjqr4g8y': {
      'en': 'Fee',
      'zh_Hant': '費用',
    },
    'ong4wz91': {
      'en': '\$1.99',
      'zh_Hant': '1.99 美元',
    },
    'd62d34v9': {
      'en': 'Discount',
      'zh_Hant': '折扣',
    },
    'fwickfeh': {
      'en': '-\$12.00',
      'zh_Hant': '-12.00美元',
    },
    'bazv5idm': {
      'en': 'Total',
      'zh_Hant': '全部的',
    },
    'dlp3jfod': {
      'en': '\$114.99',
      'zh_Hant': '114.99 美元',
    },
    'gmj1n8x2': {
      'en': 'Free Cancellation Available',
      'zh_Hant': '可免費取消',
    },
    'lyw19ajy': {
      'en':
          'Enjoy peace of mind with free cancellation up to 48 hours before the event. No penalties, full refund guaranteed!',
      'zh_Hant': '活動開始前48小時內可免費取消，安心無憂。無罰金，保證全額退款！',
    },
    'iwpswelk': {
      'en':
          'Keep me updated on more events and news from this event organizer.',
      'zh_Hant': '請讓我了解該活動組織者的更多活動和新聞。',
    },
    '8k86wcdk': {
      'en': 'I accept the ',
      'zh_Hant': '我接受',
    },
    '3g8qne5e': {
      'en': 'Terms & Conditions ',
      'zh_Hant': '條款與條件',
    },
    'q907yzys': {
      'en': 'and ',
      'zh_Hant': '和',
    },
    'amaveusz': {
      'en': 'Privacy Policy',
      'zh_Hant': '隱私權政策',
    },
    'xlcgqxtv': {
      'en': ' (Required)',
      'zh_Hant': '（必需的）',
    },
    'ld7bigip': {
      'en': 'Purchase now',
      'zh_Hant': '立即購買',
    },
    '11pdauz7': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // PaymentMethodAdd
  {
    '34r9bnn1': {
      'en': 'Add New Card',
      'zh_Hant': '新增卡',
    },
    'gliiq26l': {
      'en': 'Add',
      'zh_Hant': '添加',
    },
    'x0gh7154': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // SingleEventCheckoutSuccess
  {
    '6kw52t4c': {
      'en': 'Payment successful',
      'zh_Hant': '付款成功',
    },
    '3zb58ncu': {
      'en': 'Successfully paid \$114.99',
      'zh_Hant': '成功支付\$114.99',
    },
    'j1i58fxc': {
      'en': 'View my ticket',
      'zh_Hant': '查看我的票',
    },
    'syih3vvz': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // SingleEventOwner
  {
    '3bd0npmq': {
      'en': 'Organizer',
      'zh_Hant': '主辦單位',
    },
    '1z3habne': {
      'en': 'Ultra Music Festival',
      'zh_Hant': '超音樂節',
    },
    '675e8yrg': {
      'en': 'Miami, FL',
      'zh_Hant': '佛羅裡達州邁阿密',
    },
    'khnw24jm': {
      'en': '220K',
      'zh_Hant': '22萬',
    },
    'oxf9ay0w': {
      'en': 'Followers',
      'zh_Hant': '追蹤者',
    },
    'k27virz8': {
      'en': '2.5K',
      'zh_Hant': '2.5千',
    },
    'nzvquce5': {
      'en': 'Events',
      'zh_Hant': '活動',
    },
    '8v7ywv2d': {
      'en': '530',
      'zh_Hant': '530',
    },
    'pw96wb9h': {
      'en': 'Collections',
      'zh_Hant': '收藏',
    },
    'f0kcvxvj': {
      'en': 'Follow',
      'zh_Hant': '跟隨',
    },
    's3cqg9uw': {
      'en': 'Events',
      'zh_Hant': '活動',
    },
    '6kghjq05': {
      'en': 'Collections',
      'zh_Hant': '收藏',
    },
    'cq21syno': {
      'en': 'About',
      'zh_Hant': '關於',
    },
    'cmv8x0fz': {
      'en': 'Upcoming',
      'zh_Hant': '即將推出',
    },
    'h6kvj2ft': {
      'en':
          'Ultra Events is the driving force behind the globally renowned Ultra Music Festival. With a passion for delivering unforgettable experiences, they specialize in producing large-scale music festivals, live events, and cultural gatherings that bring people together. \n\nKnown for their commitment to quality and innovation, Ultra Events has become a trusted name in the entertainment industry.',
      'zh_Hant':
          'Ultra Events 是全球知名 Ultra 音樂節的幕後推手。他們致力於打造令人難忘的體驗，專注於舉辦大型音樂節、現場活動和文化聚會，將人們聚集在一起。\n\nUltra Events 以其對品質和創新的承諾而聞名，已成為娛樂產業值得信賴的品牌。',
    },
    'i58npew7': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // LostItems
  {
    'qr4wl4ce': {
      'en': 'Lost items',
      'zh_Hant': '遺失物品',
    },
    'mazhitr1': {
      'en': 'Lost Something? Let’s Help You Find It',
      'zh_Hant': '丟失了東西？讓我們幫你找回',
    },
    '6edo65jn': {
      'en':
          'Can’t locate your belongings? Don’t worry! Provide us with the details of your lost item, and we’ll do our best to assist you in recovering it quickly and efficiently.',
      'zh_Hant': '找不到您的物品？別擔心！請提供您遺失物品的詳細信息，我們將竭誠協助您快速有效地找回。',
    },
    'o5kofei4': {
      'en': 'Submit',
      'zh_Hant': '提交',
    },
    'r61bemi3': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // MyTicketsSearch
  {
    'nawqzwf8': {
      'en': 'Search for tickets',
      'zh_Hant': '搜尋門票',
    },
    'nqvoworf': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // LoginEmail2
  {
    'fpki5a0b': {
      'en': 'Add your Phone',
      'zh_Hant': '新增您的電話',
    },
    'wh7su29r': {
      'en': 'Enter your phone number to get yourself verified and book events.',
      'zh_Hant': '輸入您的電話號碼以進行驗證並預訂活動。',
    },
    'do3e58v0': {
      'en': 'Phone number',
      'zh_Hant': '電話號碼',
    },
    '8a7e3vxk': {
      'en': 'Emter your password',
      'zh_Hant': '輸入您的密碼',
    },
    'zew43lx0': {
      'en': '+1 23456789',
      'zh_Hant': '+1 23456789',
    },
    '3i8jh02a': {
      'en': 'Next',
      'zh_Hant': '下一個',
    },
    'd3a5ryi5': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // AllowNotifications
  {
    'e5y34lzz': {
      'en': 'GET NOTIFIED',
      'zh_Hant': '收到通知',
    },
    'n02876mc': {
      'en':
          'Keep up with event invites, updates, and chats from your organizators.',
      'zh_Hant': '關注組織者的活動邀請、更新和聊天。',
    },
    '9h5w60op': {
      'en': 'Turn On Notifications',
      'zh_Hant': '開啟通知',
    },
    '04444yyk': {
      'en': 'Not Right Now',
      'zh_Hant': '現在不行',
    },
    'u3t1ku55': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // SingleEvent2
  {
    'l64iulgh': {
      'en': 'Mar 15, 2025, 10:00 AM  ·  ',
      'zh_Hant': '2025 年 3 月 15 日 上午 10:00 ·',
    },
    'i5n3dps7': {
      'en': 'Berlin',
      'zh_Hant': '柏林',
    },
    'pxuwqxpj': {
      'en': 'Ultra music Festival',
      'zh_Hant': '超音樂節',
    },
    '4orhc1fw': {
      'en': '220K Followers',
      'zh_Hant': '22萬粉絲',
    },
    'cn7w053m': {
      'en': 'Follow',
      'zh_Hant': '跟隨',
    },
    'fe4k4jg0': {
      'en': 'About',
      'zh_Hant': '關於',
    },
    'egj2cxd9': {
      'en': 'General Information',
      'zh_Hant': '一般資訊',
    },
    '8crh8s47': {
      'en':
          '📅 Date: Sunday & Thursdays (select your date directly from the ticket selector below)\n🕒 Time: 3:30 p.m.\n⏳ Duration: 3.5 hours\n📍 Meeting point: The Swiss Clock in Leicester Square next to the M&M\'s store\n👤 Age requirement: 18+ with valid ID',
      'zh_Hant':
          '📅 日期：週日和週四（請直接從下方的購票器中選擇日期）\n🕒 時間：下午 3:30\n⏳ 時長：3.5 小時\n📍 集合地點：萊斯特廣場 M&M\'s 商店旁的瑞士鐘\n👤 年齡要求：18 歲以上，持有效身分證件',
    },
    '5st2iqu7': {
      'en': '4.9',
      'zh_Hant': '4.9',
    },
    'zsasd5x9': {
      'en': 'Based on 245 reviews',
      'zh_Hant': '根據 245 條點評',
    },
    '72s1c97b': {
      'en': 'Select your date and session',
      'zh_Hant': '選擇日期和場次',
    },
    'pgjikgsm': {
      'en': 'Hurry Up! Tickets Are Selling Fast',
      'zh_Hant': '快點！門票正在熱賣中',
    },
    '665pmbxd': {
      'en': 'Tickets are in high demand and availability is limited. ',
      'zh_Hant': '門票需求量大，數量有限。',
    },
    'c6gdglla': {
      'en': 'Gallery',
      'zh_Hant': '畫廊',
    },
    'xbjk9loj': {
      'en': 'Location',
      'zh_Hant': '地點',
    },
    'dl21dxeb': {
      'en': 'Bayfront Park, Miami, FL',
      'zh_Hant': '佛羅裡達州邁阿密海濱公園',
    },
    '4kyutjmd': {
      'en': 'You\'ll love it',
      'zh_Hant': '你會喜歡的',
    },
    '9e4s0hb3': {
      'en': 'Get tickets',
      'zh_Hant': '取得門票',
    },
    'txekkqub': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // FindNewEvents
  {
    'lj5f9ouh': {
      'en': 'FIND EVENTS \nYOU’LL LOVE',
      'zh_Hant': '尋找您喜愛的活動',
    },
    'w2288oeu': {
      'en': 'Swipe through a world of exciting events tailored just for you!',
      'zh_Hant': '瀏覽專為您量身打造的精彩活動世界！',
    },
    '8iz856l6': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // HelpCenterPartner
  {
    'sdv1dddy': {
      'en': 'Partnership with Eventy',
      'zh_Hant': '與 Eventy 合作',
    },
    'x77qcm84': {
      'en':
          'Welcome to the partnership page of Eventy — a platform for booking events, where users can easily find and purchase tickets for concerts, exhibitions, festivals, and more. We offer unique opportunities for partners to expand their audience and increase brand awareness.\n\nWhy Partner with Eventy?\nEventy provides its partners with access to a large user base interested in cultural and entertainment events. By partnering with us, you can:\n\nPromote your events: Our platform offers simple and effective tools for event listing, helping increase visibility.\nReach a new audience: We attract users from all over the world, helping event organizers grow their audience.\nBoost ticket sales: The booking and payment system on Eventy is intuitive and user-friendly, leading to higher sales.\nEnhance brand recognition: Collaborative marketing campaigns and sponsorship opportunities increase your brand’s visibility and trust.\nHow to Become a Partner?\nBecoming a partner with Eventy is easy:\n\nRegister in our system.\nSubmit your event or show proposal.\nGain access to personalized promotional and analytical tools.\nStart attracting attendees and maximize the benefits of collaboration.\nWe offer flexible partnership options for all types of events — from small gatherings to large international festivals.\n\nTypes of Partnership\nWe offer various partnership options, including:\n\nEvent Listings: Register and list your event with the option to use our promotional tools.\nAdvertising Partnership: Promote your brand through banners, sponsorship programs, and other advertising formats.\nExclusive Discounts: Attract users with special offers and discounts.',
      'zh_Hant':
          '歡迎來到 Eventy 的合作夥伴頁面。 Eventy 是一個活動預訂平台，用戶可以輕鬆找到和購買音樂會、展覽、音樂節等活動的門票。我們為合作夥伴提供獨特的機會，擴大受眾群體並提升品牌知名度。\n\n為何選擇與 Eventy 合作？\nEventy 為合作夥伴提供龐大的文化娛樂活動用戶群。與我們合作，您可以：\n\n推廣您的活動：我們的平台提供簡單有效的活動發佈工具，協助提升活動曝光。\n觸達新受眾：我們吸引來自世界各地的用戶，幫助活動組織者擴大受眾。\n提升門票銷售：Eventy 的預訂和支付系統直覺易用，有助於提升銷售量。\n提升品牌知名度：合作行銷活動和贊助機會可提升您品牌的知名度和信任度。\n如何成為合作夥伴？\n成為 Eventy 的合作夥伴非常簡單：\n\n在我們的系統中註冊。\n提交您的活動或演出計畫。\n取得個人化的推廣和分析工具。\n開始吸引參與者，並最大限度地發揮合作效益。\n我們為各種類型的活動提供靈活的合作方案—從小型聚會到大型國際盛會。\n\n合作類型\n我們提供各種合作方案，包括：\n\n活動清單：註冊並列出您的活動，並可選擇使用我們的推廣工具。\n廣告合作：透過橫幅廣告、贊助計畫和其他廣告形式推廣您的品牌。\n獨家折扣：透過特別優惠和折扣吸引用戶。',
    },
    'hb3dti8i': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // MyTicketTest
  {
    'uqpau6fn': {
      'en': 'Upcoming',
      'zh_Hant': '即將推出',
    },
    'xo4098ph': {
      'en': 'Past tickets',
      'zh_Hant': '過去的票',
    },
    'nl3i70ip': {
      'en': 'Search your tickets',
      'zh_Hant': '搜尋您的票',
    },
    'ecffjdw2': {
      'en': 'Bookings history',
      'zh_Hant': '預訂歷史記錄',
    },
    'yp31c15e': {
      'en': 'My tickets',
      'zh_Hant': '我的票',
    },
    'l44zrn8f': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // Register
  {
    'dmwcz0y7': {
      'en': 'Get Register',
      'zh_Hant': '開始註冊',
    },
    'blgqy64i': {
      'en':
          'Register for events, subscribe to calendars and manage events you\'re going to.',
      'zh_Hant': '註冊活動、訂閱日曆並管理您要參加的活動。',
    },
    '911nm66v': {
      'en': 'Continue with Google',
      'zh_Hant': '繼續使用 Google',
    },
    'ne2buif0': {
      'en': 'Continue with Facebook',
      'zh_Hant': '繼續使用 Facebook',
    },
    '3zjnd17h': {
      'en': 'Continue with Apple',
      'zh_Hant': '繼續使用 Apple',
    },
    '97q8bu3p': {
      'en': 'OR',
      'zh_Hant': '或者',
    },
    '2aieec86': {
      'en': 'Email',
      'zh_Hant': '電子郵件',
    },
    'qjqb5588': {
      'en': 'Emter your email',
      'zh_Hant': '輸入您的電子郵件',
    },
    '1uoqdyr1': {
      'en': 'test@example.com',
      'zh_Hant': 'example@domain.com',
    },
    'wp8n8gtj': {
      'en': 'Password',
      'zh_Hant': '密碼',
    },
    'rciaincf': {
      'en': 'Enter your password',
      'zh_Hant': '輸入您的密碼',
    },
    'nlzylbsl': {
      'en': 'testpassword123',
      'zh_Hant': 'example@domain.com',
    },
    'tkh5pjdx': {
      'en': 'Continue',
      'zh_Hant': '繼續',
    },
    'h9dk58sy': {
      'en': 'Home',
      'zh_Hant': '家',
    },
  },
  // DialogLogut
  {
    '6t537g2s': {
      'en': 'Logout',
      'zh_Hant': '登出',
    },
    'ttv3d0zd': {
      'en': 'Are you sure you want to log out?',
      'zh_Hant': '您確定要退出嗎？',
    },
    's14qxzag': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'vk5etu32': {
      'en': 'Logout',
      'zh_Hant': '登出',
    },
  },
  // WidgetNavbar
  {
    'wp5173si': {
      'en': 'Home',
      'zh_Hant': '家',
    },
    'erx5qsdv': {
      'en': 'Explore',
      'zh_Hant': '探索',
    },
    't46jl33h': {
      'en': 'Favorites',
      'zh_Hant': '收藏夾',
    },
    'oe6y9blt': {
      'en': 'Tickets',
      'zh_Hant': '門票',
    },
    'rgb21vy8': {
      'en': 'Profile',
      'zh_Hant': '個人',
    },
  },
  // PasswordChanged
  {
    'txykk575': {
      'en': 'Password Changed!',
      'zh_Hant': '密碼已更改！',
    },
    'y2nnbga2': {
      'en': 'Your password is saved. Click Log In to continue',
      'zh_Hant': '您的密碼已儲存。點擊“登入”繼續',
    },
    'j12apuyv': {
      'en': 'Continue',
      'zh_Hant': '繼續',
    },
  },
  // LoadingRegister
  {
    'hdn4uzgq': {
      'en': 'Loading ...',
      'zh_Hant': '載入中 ...',
    },
  },
  // ChatOptions
  {
    'fob8cb25': {
      'en': 'Clear Chat',
      'zh_Hant': '清除聊天',
    },
    'xteh5m0d': {
      'en': 'Export Chat',
      'zh_Hant': '匯出聊天',
    },
    'ed3sworm': {
      'en': 'Delete Chat',
      'zh_Hant': '刪除聊天',
    },
    '7kraqhy9': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // WidgetNotificationsOptions
  {
    '3ximwgw4': {
      'en': 'Read All',
      'zh_Hant': '閱讀全部',
    },
    '7hhdcp7m': {
      'en': 'Notifications Settings',
      'zh_Hant': '通知設定',
    },
    'c9w9bzc4': {
      'en': 'Remove Notificactions',
      'zh_Hant': '刪除通知',
    },
    'mw4njzpi': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // MyTicketsOptions
  {
    '9q4i0ex8': {
      'en': 'Sort by',
      'zh_Hant': '排序方式',
    },
    'n94uqspi': {
      'en': 'Help Center',
      'zh_Hant': '幫助中心',
    },
    'vkxtjn5a': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // RescheduleSuccess
  {
    'plili8gf': {
      'en': 'Rescheduling Success!',
      'zh_Hant': '重新安排成功！',
    },
    '6nofz97g': {
      'en': 'You have successfully rescheduled your appointment',
      'zh_Hant': '您已成功重新安排預約',
    },
    'jfz48ztq': {
      'en': 'Close',
      'zh_Hant': '關閉',
    },
  },
  // CancelTicket
  {
    'yrk2w4xr': {
      'en': 'Cancel tickets',
      'zh_Hant': '取消機票',
    },
    'rxraj3j3': {
      'en':
          'Are you sure you want to cancel your Ешслуе? Only 70% of the funds will be returned to your card.',
      'zh_Hant': '您確定要取消您的退款嗎？只有 70% 的資金會退還到您的卡上。',
    },
    'unpyuzcj': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    '31yv4gqi': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
  },
  // CancelTicketSuccess
  {
    'm0eq5i2w': {
      'en': 'You have successfully cancelled your Ticket.',
      'zh_Hant': '您已成功取消機票。',
    },
    'lampx7a0': {
      'en': 'OK',
      'zh_Hant': '好的',
    },
  },
  // MyTicketsCardOptions
  {
    'lhb1x5s7': {
      'en': 'Reschedule',
      'zh_Hant': '重新安排',
    },
    'frk8gzfd': {
      'en': 'Cancel Booking',
      'zh_Hant': '取消預訂',
    },
    'cbbmu1ki': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // LeaveReviewSuccess
  {
    'azmtjdwt': {
      'en': 'Successfully published',
      'zh_Hant': '成功發布',
    },
    'vm2tp05a': {
      'en': 'Your review has been successfully submitted, thank you so much!',
      'zh_Hant': '您的評論已成功提交，非常感謝！',
    },
    'cgeg7ftt': {
      'en': 'Close',
      'zh_Hant': '關閉',
    },
  },
  // ProfileOptions
  {
    'ksljgnek': {
      'en': 'Share my profile',
      'zh_Hant': '分享我的個人資料',
    },
    'dhbqah53': {
      'en': 'Edit profile',
      'zh_Hant': '編輯個人資料',
    },
    '3qkariti': {
      'en': 'Logout',
      'zh_Hant': '登出',
    },
    'uab7226n': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // WidgetCreditCard
  {
    'ptzsi8vl': {
      'en': '**** 3456',
      'zh_Hant': '**** 3456',
    },
    'hbwgo9gb': {
      'en': 'Change',
      'zh_Hant': '改變',
    },
  },
  // UploadImage
  {
    'gjyfmqvv': {
      'en': 'Take a picture',
      'zh_Hant': '拍照',
    },
    'l71bxkuk': {
      'en': 'Upload from library',
      'zh_Hant': '從庫上傳',
    },
    '8kxcl2cw': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // InviteFriendsShare
  {
    'x3xmp0kp': {
      'en': 'Invite your friends',
      'zh_Hant': '邀請你的朋友',
    },
    'mzss72d1': {
      'en': 'Copy and share the link with your friends',
      'zh_Hant': '複製連結並分享給你的朋友',
    },
    '1ctxk0lk': {
      'en': 'https://share.com/vt8t2',
      'zh_Hant': 'https://share.com/vt8t2',
    },
    'faer38bx': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // AllowLocation
  {
    'bwibal0o': {
      'en': 'Allow EVENTY to use your location?',
      'zh_Hant': '允許 EVENTY 使用您的位置嗎？',
    },
    'tlcrhra3': {
      'en': 'We will use your location to show events in your city.',
      'zh_Hant': '我們將使用您的位置來顯示您所在城市的活動。',
    },
    'jrk79urv': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'pyfmivmj': {
      'en': 'Allow',
      'zh_Hant': '允許',
    },
  },
  // RateUs
  {
    '85g4nv5a': {
      'en': 'Love EVENTY?',
      'zh_Hant': '喜歡 VENTY 嗎？',
    },
    'duwwcamq': {
      'en': 'Please recommend us to others on the Google Play',
      'zh_Hant': '請在 Google Play 上向其他人推薦我們',
    },
    'y3kome3m': {
      'en': 'Rate us',
      'zh_Hant': '給我們評分',
    },
    'xg74b285': {
      'en': 'No, Thank you',
      'zh_Hant': '不，謝謝',
    },
  },
  // FilterSort
  {
    'nhagxftx': {
      'en': 'Sort',
      'zh_Hant': '種類',
    },
    'y4vekv4l': {
      'en': 'Apply',
      'zh_Hant': '申請',
    },
  },
  // FilterByDate
  {
    'xzk0x8wa': {
      'en': 'Date',
      'zh_Hant': '日期',
    },
    'f3scdwzz': {
      'en': 'Apply',
      'zh_Hant': '申請',
    },
  },
  // FilterByCategory
  {
    '7txw4tor': {
      'en': 'Categories',
      'zh_Hant': '類別',
    },
  },
  // WidgetEmptyFavorites
  {
    'ptfk1br7': {
      'en': 'Your Favorites List is Empty',
      'zh_Hant': '您的收藏清單為空',
    },
    'fv4duyf1': {
      'en':
          'Browse events and save your top picks here for quick access anytime!',
      'zh_Hant': '瀏覽活動並在此保存您的首選，以便隨時快速訪問！',
    },
  },
  // WidgetFavoritesOptions
  {
    '26h3k8kn': {
      'en': 'Sort By',
      'zh_Hant': '排序方式',
    },
    'khry3elu': {
      'en': 'Remove All',
      'zh_Hant': '全部移除',
    },
    '0wth6ryu': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // WidgetAllowRemoving
  {
    'flt2ncrv': {
      'en': 'Clear the list of favorite events',
      'zh_Hant': '清除收藏事件列表',
    },
    'x5unigzj': {
      'en': 'Are you sure you want to clear the list of favorite events?',
      'zh_Hant': '您確定要清除收藏事件清單嗎？',
    },
    'vzd17zvk': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'rkn56jsz': {
      'en': 'Clear',
      'zh_Hant': '清除',
    },
  },
  // FilterSortFavorites
  {
    'xwrrf0qn': {
      'en': 'Sort',
      'zh_Hant': '種類',
    },
    'ai24cdrf': {
      'en': 'Apply',
      'zh_Hant': '申請',
    },
  },
  // WidgetEventsOptions
  {
    '7pwf3i09': {
      'en': 'I\'m Interested',
      'zh_Hant': '我感興趣',
    },
    'vl2ytcyh': {
      'en': 'Add to Calendar',
      'zh_Hant': '新增到日曆',
    },
    'k0g0q2bn': {
      'en': 'Share',
      'zh_Hant': '分享',
    },
    '9n19985i': {
      'en': 'Report Event',
      'zh_Hant': '報告事件',
    },
    'ajy5bqke': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // TicketCard
  {
    '3purpmjs': {
      'en': '  incl. \$1.99 Fee',
      'zh_Hant': '含 1.99 美元費用',
    },
  },
  // WidgetCheckoutOptions
  {
    '5k1tk7o1': {
      'en': 'Save for later',
      'zh_Hant': '保存以供日後使用',
    },
    '8rcrlzto': {
      'en': 'Share',
      'zh_Hant': '分享',
    },
    'ki0uejyb': {
      'en': 'Report Event',
      'zh_Hant': '報告事件',
    },
    'qt0s9mbh': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // WidgetAllowClearTickets
  {
    '9vnr7k7l': {
      'en': 'Delete all tickets',
      'zh_Hant': '刪除所有票證',
    },
    'rwpm9xqm': {
      'en': 'Are you sure you want to delete all tickets from checkout?',
      'zh_Hant': '您確定要刪除結帳時的所有票券嗎？',
    },
    'k95njine': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'h49c8h0k': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
  },
  // TicketCard2
  {
    'xktobvtd': {
      'en': '  incl. \$1.99 Fee',
      'zh_Hant': '含 1.99 美元費用',
    },
    'lqbai4sw': {
      'en': 'Gate',
      'zh_Hant': '門',
    },
    'nocc1ry5': {
      'en': '16',
      'zh_Hant': '16',
    },
    'zywjzzkc': {
      'en': 'Row',
      'zh_Hant': '排',
    },
    'g4iuhnuy': {
      'en': 'Seat',
      'zh_Hant': '座位',
    },
    'iaiuk5p9': {
      'en': '25',
      'zh_Hant': '二十五',
    },
  },
  // WidgetCheckoutLoading
  {
    'kybdstoo': {
      'en': 'Please wait ...',
      'zh_Hant': '請稍等 ...',
    },
  },
  // WidgetCheckoutOptions2
  {
    'fltk3mfk': {
      'en': 'Share',
      'zh_Hant': '分享',
    },
    'l2kpah25': {
      'en': 'Delete',
      'zh_Hant': '刪除',
    },
    'zswqj3bd': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // WidgetAllowClearTicket
  {
    'q06secuf': {
      'en': 'Delete the ticket',
      'zh_Hant': '刪除票證',
    },
    'o27q4i5x': {
      'en': 'Are you sure you want to delete this ticket from checkout?',
      'zh_Hant': '您確定要從結帳中刪除此票嗎？',
    },
    '7w9zmhsy': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'x783k4do': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
  },
  // MyTicketsCard
  {
    'ky6am6mf': {
      'en': 'Show QR code',
      'zh_Hant': '顯示二維碼',
    },
  },
  // MyTicketsCard2
  {
    'rlhxvow1': {
      'en': 'Completed',
      'zh_Hant': '已完成',
    },
    '3jr2pj4w': {
      'en': '3 tickets',
      'zh_Hant': '3張票',
    },
    'i2aylvwu': {
      'en': 'Leave a Review',
      'zh_Hant': '留下評論',
    },
  },
  // MyTicketsSort
  {
    'yif4zcw4': {
      'en': 'Sort',
      'zh_Hant': '種類',
    },
    '1qysc7uc': {
      'en': 'Apply',
      'zh_Hant': '申請',
    },
  },
  // RescheduleDialog
  {
    'd8zkjfm3': {
      'en': 'Reschedule my ticket',
      'zh_Hant': '重新安排我的機票',
    },
    'ugfoxvqw': {
      'en':
          'Are you sure you want to reschedule tickets? You can only change the date once for free.',
      'zh_Hant': '您確定要重新預訂門票嗎？您只能免費更改一次日期。',
    },
    '1hbzazyx': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'kol2u322': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
  },
  // ShowQR
  {
    'oixhrev9': {
      'en': 'QR Code',
      'zh_Hant': 'QR 圖碼',
    },
    '66l3kja2': {
      'en': 'Gate',
      'zh_Hant': '門',
    },
    'qjn5no6q': {
      'en': '02',
      'zh_Hant': '02',
    },
    'hv75pygf': {
      'en': 'Row',
      'zh_Hant': '排',
    },
    'v87cbjbr': {
      'en': '01',
      'zh_Hant': '01',
    },
    '85gjjzg3': {
      'en': 'Seat',
      'zh_Hant': '座位',
    },
    'sbrcb9bo': {
      'en': '15',
      'zh_Hant': '15',
    },
    '79e1wgvz': {
      'en': 'Close',
      'zh_Hant': '關閉',
    },
  },
  // MyTicketsCard2Options
  {
    'rqtgicnp': {
      'en': 'Download in pdf format',
      'zh_Hant': '以pdf格式下載',
    },
    'laoi1ujz': {
      'en': 'Lost Items',
      'zh_Hant': '遺失物品',
    },
    'p5cixegv': {
      'en': 'Check availability',
      'zh_Hant': '查看空房狀況',
    },
    '9ej2hp8n': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // LostItemsSuccess
  {
    'k8rfbe2s': {
      'en': 'Your Request Has Been Submitted',
      'zh_Hant': '您的請求已提交',
    },
    'fi72k1j1': {
      'en':
          'We’ve received your report and our team will contact you as soon as possible to assist with your lost item. Stay tuned!',
      'zh_Hant': '我們已收到您的報告，我們的團隊將盡快與您聯繫，協助您處理遺失的物品。敬請期待！',
    },
    '7eylqt7d': {
      'en': 'Close',
      'zh_Hant': '關閉',
    },
  },
  // MyTicketsSingleOptions
  {
    'xsd8tdnr': {
      'en': 'Download in pdf format',
      'zh_Hant': '以pdf格式下載',
    },
    'qzd7byde': {
      'en': 'Lost Items',
      'zh_Hant': '遺失物品',
    },
    'xlno7yu9': {
      'en': 'Check availability',
      'zh_Hant': '查看仍可購買',
    },
    'cnvqgnlj': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
  },
  // FilterByDate2
  {
    'l1gey2ii': {
      'en': 'Date',
      'zh_Hant': '日期',
    },
    'fhfcw9p3': {
      'en': 'Apply',
      'zh_Hant': '申請',
    },
  },
  // HomeFilterAll
  {
    'nv2nkjgs': {
      'en': 'Date',
      'zh_Hant': '日期',
    },
    'd3ew0oa3': {
      'en': 'Category',
      'zh_Hant': '類別',
    },
    'hol65ge1': {
      'en': 'Show results',
      'zh_Hant': '顯示結果',
    },
  },
  // AllowNotification
  {
    'ciov8991': {
      'en': 'Stay Updated with EVENTY',
      'zh_Hant': '關注 EVENTY 的最新動態',
    },
    '1130p79s': {
      'en':
          'Enable notifications to get instant updates about your favorite events, tickets, and exclusive offers.',
      'zh_Hant': '啟用通知以獲取有關您最喜歡的活動、門票和獨家優惠的即時更新。',
    },
    '68orouk8': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'rh1w1wka': {
      'en': 'Allow',
      'zh_Hant': '允許',
    },
  },
  // Home1
  {
    'w2ups6lf': {
      'en':
          'Here, you can find different categories of events. Tap on a category to explore more!',
      'zh_Hant': '這裡您可以找到不同類別的活動。點擊類別即可了解更多！',
    },
  },
  // Home2
  {
    'g3w2ca31': {
      'en':
          'Want to explore events near you? Tap here to choose your preferred location!',
      'zh_Hant': '想探索附近的活動嗎？點擊此處選擇您喜歡的地點！',
    },
  },
  // ClearChat
  {
    'r7lbzl2s': {
      'en': 'Clear History',
      'zh_Hant': '清除歷史記錄',
    },
    'jfe3l9sd': {
      'en': 'Are you sure you want to clear the history of chat?',
      'zh_Hant': '您確定要清除聊天記錄嗎？',
    },
    'udfo63wu': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    'ltqq72fp': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
  },
  // DeleteChat
  {
    '8zu00ka9': {
      'en': 'Delete User',
      'zh_Hant': '刪除用戶',
    },
    'q1vyyuyx': {
      'en': 'Are you sure you want to delete this user?',
      'zh_Hant': '您確定要刪除該使用者嗎？',
    },
    'zdyvad5e': {
      'en': 'Cancel',
      'zh_Hant': '取消',
    },
    '2wo9kn61': {
      'en': 'Confirm',
      'zh_Hant': '確認',
    },
  },
  // Ticket1
  {
    '9b6o1nj8': {
      'en': 'You can change or cancel your booking.',
      'zh_Hant': '您可以更改或取消您的預訂。',
    },
  },
  // Miscellaneous
  {
    'd58xb75r': {
      'en':
          'To help you easily find and invite friends, or share content with them, please allow access to your contacts. We\'ll never contact anyone without your permission.',
      'zh_Hant': '',
    },
    'bpbpc6go': {
      'en':
          'This app needs Bluetooth access to connect with your accessories (e.g., headphones, smartwatches) for data syncing and control.',
      'zh_Hant': '此應用程式需要藍牙存取才能連接您的配件（例如耳機、智慧手錶）進行資料同步和控制。',
    },
    '02m8646j': {
      'en':
          'Enable Face ID / Touch ID for a faster and more secure way to log in and verify your identity.',
      'zh_Hant': '啟用 Face ID / Touch ID 以便更快、更安全地登入和驗證您的身分。',
    },
    '1rlvu3kz': {
      'en':
          'To add important events, appointments, or reminders directly to your calendar, this app needs permission to access it.',
      'zh_Hant': '要將重要事件、約會或提醒直接添加到您的日曆中，此應用程式需要存取它的權限。',
    },
    'vf49mjlv': {
      'en':
          'We need access to your camera so you can take photos, record videos, scan QR codes, or use video call features.',
      'zh_Hant': '我們需要存取您的相機，以便您可以拍照、錄製影片、掃描二維碼或使用視訊通話功能。',
    },
    'yixitk7z': {
      'en':
          'To help you easily find and invite friends, or share content with them, please allow access to your contacts. We\'ll never contact anyone without your permission.',
      'zh_Hant': '為了方便您輕鬆尋找和邀請好友，或與他們分享內容，請允許存取您的通訊錄。未經您的許可，我們絕不會聯絡任何人。',
    },
    'pszbnqn8': {
      'en':
          'We use your location to provide personalized services, such as showing nearby places, offering map navigation, or tagging your posts.',
      'zh_Hant': '我們使用您的位置來提供個人化服務，例如顯示附近的地點、提供地圖導航或標記您的貼文。',
    },
    'xxeudsjm': {
      'en':
          'This app requires microphone access to enable features like recording voice messages, making voice/video calls, or using voice commands.',
      'zh_Hant': '此應用程式需要存取麥克風才能啟用錄製語音訊息、進行語音/視訊通話或使用語音命令等功能。',
    },
    'zq9l212h': {
      'en':
          'Allow notifications so you don\'t miss out on important alerts, new messages, and personalized updates.',
      'zh_Hant': '允許通知，這樣您就不會錯過重要的警報、新訊息和個人化更新。',
    },
    'vj6souqi': {
      'en':
          'To allow you to upload photos and videos—like setting your profile picture or sharing a post—this app needs access to your photo library.',
      'zh_Hant': '為了允許您上傳照片和影片（例如設定您的個人資料圖片或分享貼文），此應用程式需要存取您的照片庫。',
    },
    'qmhud72z': {
      'en': '',
      'zh_Hant': '',
    },
    'utluzk5p': {
      'en': '',
      'zh_Hant': '',
    },
    '93v6xkaf': {
      'en': '',
      'zh_Hant': '',
    },
    'pce5zb9f': {
      'en': '',
      'zh_Hant': '',
    },
    'xhbv694s': {
      'en': '',
      'zh_Hant': '',
    },
    'iub3tep8': {
      'en': '',
      'zh_Hant': '',
    },
    '01uht9uo': {
      'en': '',
      'zh_Hant': '',
    },
    '5q6plxvo': {
      'en': '',
      'zh_Hant': '',
    },
    'agh5dv5a': {
      'en': '',
      'zh_Hant': '',
    },
    'iroraxa4': {
      'en': '',
      'zh_Hant': '',
    },
    'fowubnwv': {
      'en': '',
      'zh_Hant': '',
    },
    'zbjqu4k7': {
      'en': '',
      'zh_Hant': '',
    },
    'kf0zgqzr': {
      'en': '',
      'zh_Hant': '',
    },
    'f5zkmpj3': {
      'en': '',
      'zh_Hant': '',
    },
    'x1di0qju': {
      'en': '',
      'zh_Hant': '',
    },
    'bdc84t7l': {
      'en': '',
      'zh_Hant': '',
    },
    'zyli5nia': {
      'en': '',
      'zh_Hant': '',
    },
    'jqc4qi3c': {
      'en': '',
      'zh_Hant': '',
    },
    '4k3py58f': {
      'en': '',
      'zh_Hant': '',
    },
    'qt55u4bu': {
      'en': '',
      'zh_Hant': '',
    },
    '38ssbgz9': {
      'en': '',
      'zh_Hant': '',
    },
    'kvdlvhhu': {
      'en': '',
      'zh_Hant': '',
    },
    'iy8o23fg': {
      'en': '',
      'zh_Hant': '',
    },
    'nk6e6js5': {
      'en': '',
      'zh_Hant': '',
    },
    'teau8wve': {
      'en': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
