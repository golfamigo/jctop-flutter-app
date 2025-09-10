import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SelectedLang = prefs.getString('ff_SelectedLang') ?? _SelectedLang;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<FaqStruct> _faqList = [
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What is Eventy?\",\"answer\":\"Eventy is an app designed to help you discover, book, and attend events in your city or anywhere in the world. From concerts and festivals to workshops and meetups, Eventy connects you to experiences you’ll love.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do I book an event?\",\"answer\":\"Booking is simple! Browse the event listings, choose an event that interests you, select your preferred ticket type, and complete the payment process directly in the app.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Can I cancel my booking?\",\"answer\":\"Yes, you can cancel your booking within the cancellation window specified by the event organizer. For eligible cancellations, you’ll receive a refund according to the organizer’s refund policy.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do I find events near me?\",\"answer\":\"Use the location filter on the home page to find events happening in your area. You can also enable location access for personalized event recommendations.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Can I host my own events on Eventy?\",\"answer\":\"Absolutely! Eventy allows organizers to create, promote, and manage events directly through the app. Sign up as an organizer and start sharing your events with a broader audience.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Are there any fees for using Eventy?\",\"answer\":\"Eventy is free to download and explore. A small service fee may apply when purchasing tickets, depending on the event organizer’s settings.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do I contact customer support?\",\"answer\":\"You can reach our support team by navigating to the \\\"Support\\\" section in the app. We’re here to assist you with any questions or issues you may have.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Does Eventy send notifications?\",\"answer\":\"Yes! Eventy can notify you about upcoming events, ticket availability, exclusive discounts, and updates for events you’ve booked. Make sure to enable notifications for the best experience.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What if an event gets rescheduled or canceled?\",\"answer\":\"If an event is rescheduled or canceled, you’ll receive a notification with updated details. In case of cancellations, refunds will be processed according to the organizer’s policy.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Can I share events with friends?\",\"answer\":\"Of course! Eventy allows you to share event details with friends through social media, email, or messaging apps. Enjoy experiences together!\"}'))
  ];
  List<FaqStruct> get faqList => _faqList;
  set faqList(List<FaqStruct> value) {
    _faqList = value;
  }

  void addToFaqList(FaqStruct value) {
    faqList.add(value);
  }

  void removeFromFaqList(FaqStruct value) {
    faqList.remove(value);
  }

  void removeAtIndexFromFaqList(int index) {
    faqList.removeAt(index);
  }

  void updateFaqListAtIndex(
    int index,
    FaqStruct Function(FaqStruct) updateFn,
  ) {
    faqList[index] = updateFn(_faqList[index]);
  }

  void insertAtIndexInFaqList(int index, FaqStruct value) {
    faqList.insert(index, value);
  }

  List<LanguagesStruct> _languages = [
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"English\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/hdg5brj08oaz/25.png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Mandarin\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/p717acacqrie/4_(2).png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Hindi\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/91n33jpiv9o3/9_(1).png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Korean\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/044847p3rur1/20_(2).png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Arabic\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/h1h1dlx9m22l/24.png\"}')),
    LanguagesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Russian\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/medix-ayvfdr/assets/1o8cxj1azfim/17.png\"}'))
  ];
  List<LanguagesStruct> get languages => _languages;
  set languages(List<LanguagesStruct> value) {
    _languages = value;
  }

  void addToLanguages(LanguagesStruct value) {
    languages.add(value);
  }

  void removeFromLanguages(LanguagesStruct value) {
    languages.remove(value);
  }

  void removeAtIndexFromLanguages(int index) {
    languages.removeAt(index);
  }

  void updateLanguagesAtIndex(
    int index,
    LanguagesStruct Function(LanguagesStruct) updateFn,
  ) {
    languages[index] = updateFn(_languages[index]);
  }

  void insertAtIndexInLanguages(int index, LanguagesStruct value) {
    languages.insert(index, value);
  }

  String _SelectedLang = 'English';
  String get SelectedLang => _SelectedLang;
  set SelectedLang(String value) {
    _SelectedLang = value;
    prefs.setString('ff_SelectedLang', value);
  }

  String _SelectedCountry = 'New York City';
  String get SelectedCountry => _SelectedCountry;
  set SelectedCountry(String value) {
    _SelectedCountry = value;
  }

  bool _updater = false;
  bool get updater => _updater;
  set updater(bool value) {
    _updater = value;
  }

  int _messagesTab = 0;
  int get messagesTab => _messagesTab;
  set messagesTab(int value) {
    _messagesTab = value;
  }

  String _SelectedReschedule = 'I\'m having a schedule clash';
  String get SelectedReschedule => _SelectedReschedule;
  set SelectedReschedule(String value) {
    _SelectedReschedule = value;
  }

  DateTime? _SelectedDate = DateTime.fromMillisecondsSinceEpoch(1731232320000);
  DateTime? get SelectedDate => _SelectedDate;
  set SelectedDate(DateTime? value) {
    _SelectedDate = value;
  }

  int _SelectedAppointmentDate = 0;
  int get SelectedAppointmentDate => _SelectedAppointmentDate;
  set SelectedAppointmentDate(int value) {
    _SelectedAppointmentDate = value;
  }

  String _SelectedReasonCancel = 'I just want to cancel';
  String get SelectedReasonCancel => _SelectedReasonCancel;
  set SelectedReasonCancel(String value) {
    _SelectedReasonCancel = value;
  }

  List<CategoriesStruct> _categories = [
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Tourism\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/pliyosnmg1vo/e5rgthhr.png\",\"descr\":\"Explore guided tours, city walks, and sightseeing trips.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Live Shows\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/f3l6ls6ybqad/24fr3geggeegeg.png\",\"descr\":\"Concerts, theater performances, stand-up comedy, and more.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Activities\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/oi7cqs5zbh51/35rgrtbrveeve.png\",\"descr\":\"Adventure sports, yoga classes, and hands-on workshops.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Cinema\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/yt1xamhydyd6/24gtyuj6h4gg.png\",\"descr\":\"Movie screenings, film festivals, and special premieres.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Meetups\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/xy3bu6y2p9di/24fretbgfbnhmu7i7.png\",\"descr\":\"Networking events, hobby groups, and casual gatherings.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Festivals\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/64320p8v6ynt/24feretgbgnbtt6u.png\",\"descr\":\"Cultural celebrations, music festivals, and food fairs.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Seminars\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/ux8cwvbbavcg/2f4retbg5hyth.png\",\"descr\":\"Educational talks, business summits, and guest lectures.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Exhibitions\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/a6kworzpfgfa/24f3rtgytjuju.png\",\"descr\":\"Art galleries, trade shows, and product expos.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Nightlife\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/iup4cccx4iwk/2efrtgryhji7k7k.png\",\"descr\":\"Club parties, DJ nights.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Sports\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/0quv4e6tdeen/23ewregtyjhjuj67.png\",\"descr\":\"Live games, fitness challenges, and esports tournaments.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Technology\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/5awyj6vp2dg5/de23e2r4f33rrrrrr.png\",\"descr\":\"Hackathons, tech expos, and innovation conferences.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Food & Drink\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/zxln5wlcocbl/23r4rf4t54tt.png\",\"descr\":\"Cooking classes, and restaurant pop-ups.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Education\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/6272jzmqj2ca/13r3yhjujjjmmm.png\",\"descr\":\"Language courses, academic fairs, and certification programs.\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Fashion & Lifestyle\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/g6fuflwdnlwf/wedw34ffrrebbbbb.png\",\"descr\":\"Runway shows, styling workshops, and pop-up stores.\"}'))
  ];
  List<CategoriesStruct> get categories => _categories;
  set categories(List<CategoriesStruct> value) {
    _categories = value;
  }

  void addToCategories(CategoriesStruct value) {
    categories.add(value);
  }

  void removeFromCategories(CategoriesStruct value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, CategoriesStruct value) {
    categories.insert(index, value);
  }

  int _SelectedPackage = 0;
  int get SelectedPackage => _SelectedPackage;
  set SelectedPackage(int value) {
    _SelectedPackage = value;
  }

  String _SelectedGender = '';
  String get SelectedGender => _SelectedGender;
  set SelectedGender(String value) {
    _SelectedGender = value;
  }

  int _SelectedCard = 0;
  int get SelectedCard => _SelectedCard;
  set SelectedCard(int value) {
    _SelectedCard = value;
  }

  String _SelectedAvailabilityFilter = 'In the next 3 days';
  String get SelectedAvailabilityFilter => _SelectedAvailabilityFilter;
  set SelectedAvailabilityFilter(String value) {
    _SelectedAvailabilityFilter = value;
  }

  bool _SelectedFilter3 = false;
  bool get SelectedFilter3 => _SelectedFilter3;
  set SelectedFilter3(bool value) {
    _SelectedFilter3 = value;
  }

  String _SelectedSortBy = 'Popularity';
  String get SelectedSortBy => _SelectedSortBy;
  set SelectedSortBy(String value) {
    _SelectedSortBy = value;
  }

  List<TrandingEventsStruct> _TrandingEvents = [
    TrandingEventsStruct.fromSerializableMap(jsonDecode(
        '{\"Price\":\"\$150\",\"Category\":\"Music Festival\",\"Title\":\"Ultra Miami 2025\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/3vplhc5fk69r/34gegtrgffewdedevvvv_(1).png\"}')),
    TrandingEventsStruct.fromSerializableMap(jsonDecode(
        '{\"Price\":\"\$100\",\"Category\":\"Art Exhibition\",\"Title\":\"Van Gogh Experience\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/mgrbb99sr9zd/qw3q3dfffeeeeeeeeeee_(1).png\"}')),
    TrandingEventsStruct.fromSerializableMap(jsonDecode(
        '{\"Price\":\"\$200\",\"Category\":\"Food Festival\",\"Title\":\"Taste of Chicago\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/xovh7pw0zr9a/qwfdfvteee4444_(1).png\"}')),
    TrandingEventsStruct.fromSerializableMap(jsonDecode(
        '{\"Price\":\"\$120\",\"Category\":\"Film Festival\",\"Title\":\"Sundance Film Festival\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/xx52higoziu8/2eqefvbbbbbbbb_(1).png\"}')),
    TrandingEventsStruct.fromSerializableMap(jsonDecode(
        '{\"Price\":\"\$300\",\"Category\":\"Adventure Tourism\",\"Title\":\"Skydiving over the Grand Canyon\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/3bd1pmslhk4i/60.jpg\"}'))
  ];
  List<TrandingEventsStruct> get TrandingEvents => _TrandingEvents;
  set TrandingEvents(List<TrandingEventsStruct> value) {
    _TrandingEvents = value;
  }

  void addToTrandingEvents(TrandingEventsStruct value) {
    TrandingEvents.add(value);
  }

  void removeFromTrandingEvents(TrandingEventsStruct value) {
    TrandingEvents.remove(value);
  }

  void removeAtIndexFromTrandingEvents(int index) {
    TrandingEvents.removeAt(index);
  }

  void updateTrandingEventsAtIndex(
    int index,
    TrandingEventsStruct Function(TrandingEventsStruct) updateFn,
  ) {
    TrandingEvents[index] = updateFn(_TrandingEvents[index]);
  }

  void insertAtIndexInTrandingEvents(int index, TrandingEventsStruct value) {
    TrandingEvents.insert(index, value);
  }

  List<EventsStruct> _EVENTS = [
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Bayfront Park, Miami, FL\",\"Title\":\"David Guetta Ultra Miami 2025 Music Festival\",\"Date\":\"Nov 25, 2025, 02:00 PM\",\"Price\":\"From \$45\",\"Rating\":\"4.8\",\"Tag\":\"Bestseller\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/4eoij23on5c5/2rf4regebrm%2Cykk%2Cy.png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Madison Square Garden, New York, NY\",\"Title\":\"Ed Sheeran Live Concert\",\"Date\":\"Feb 10, 2025, 08:00 PM\",\"Price\":\"From \$80\",\"Rating\":\"4.9\",\"Tag\":\"Bestseller\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/l9zbuqhuzyhn/e235234tregegbb_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Louvre Museum, Paris, France\",\"Title\":\"Van Gogh Immersive Experience\",\"Date\":\"Mar 15, 2025, 10:00 AM\",\"Price\":\"From \$25\",\"Rating\":\"4.7\",\"Tag\":\"New\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/m1h6k37gn30h/qwvfdgbytrtrt4534_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Coachella Valley, Indio, CA\",\"Title\":\"Coachella Music and Arts Festival\",\"Date\":\"Apr 12, 2025, All Day\",\"Price\":\"From \$150\",\"Rating\":\"4.9\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/om1ew6qeoaou/23r2fergebb_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Sydney Opera House, Sydney, Australia\",\"Title\":\"The Phantom of the Opera Live\",\"Date\":\"May 20, 2025, 07:00 PM\",\"Price\":\"From \$60\",\"Rating\":\"4.8\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/lksqwd29kurd/13erethrytu65_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Tokyo Big Sight, Tokyo, Japan\",\"Title\":\"Anime Expo Tokyo 2025\",\"Date\":\"Jun 5, 2025, 09:00 AM\",\"Price\":\"From \$35\",\"Rating\":\"4.7\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/mq1csaylvxc9/13r4rr7u6thytrg_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Wembley Stadium, London, UK\",\"Title\":\"Coldplay World Tour 2025\",\"Date\":\"Jul 18, 2025, 08:00 PM\",\"Price\":\"From \$100\",\"Rating\":\"4.9\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/of3g8pkycswr/23rrgtnytui8009876_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Berlin Film Theater, Berlin, Germany\",\"Title\":\"Berlin International Film Festival\",\"Date\":\"Aug 15, 2025, 10:00 AM\",\"Price\":\"From \$30\",\"Rating\":\"4.7\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/z66qe4nyi70o/32456787uytgrfeef_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Giza Pyramids, Cairo, Egypt\",\"Title\":\"Stars under the Pyramids Concert\",\"Date\":\"Sep 10, 2025, 06:00 PM\",\"Price\":\"From \$50\",\"Rating\":\"4.8\",\"Tag\":\"Unique\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/jk3xnjtdqd98/43t5t4etgrh67h_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Santorini Island, Greece\",\"Title\":\"Sunset Jazz Festival\",\"Date\":\"Oct 5, 2025, 05:00 PM\",\"Price\":\"From \$40\",\"Rating\":\"4.6\",\"Tag\":\"Hello World\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/z9agxwr1r2g4/34t5trhrhnrfh_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Grand Canyon National Park, AZ\",\"Title\":\"Stargazing Adventure\",\"Date\":\"Nov 20, 2025, 09:00 PM\",\"Price\":\"From \$20\",\"Rating\":\"4.8\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/y7038xxd4cwl/23r4ttghyu877i_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Dubai Expo City, UAE\",\"Title\":\"Dubai World Expo 2025\",\"Date\":\"Dec 1, 2025, All Day\",\"Price\":\"From \$60\",\"Rating\":\"4.9\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/pt13duzy9z8b/34r3wrtgyhthjik98_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Times Square, New York, NY\",\"Title\":\"New Year’s Eve Ball Drop Celebration\",\"Date\":\"Dec 31, 2025, 10:00 PM\",\"Price\":\"Free Entry\",\"Rating\":\"4.8\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/55miqcke2czy/43t35t6y7u6ujjtyhee_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}')),
    EventsStruct.fromSerializableMap(jsonDecode(
        '{\"Location\":\"Machu Picchu, Peru\",\"Title\":\"Sunrise Trek and Cultural Tour\",\"Date\":\"Jan 10, 2025, 05:00 AM\",\"Price\":\"From \$75\",\"Rating\":\"4.7\",\"Tag\":\"\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/5pjt9twszgfg/234rtgh56u7_(1).png\",\"descr\":\"Ultra Music Festival is a globally renowned electronic dance music event that takes place annually in the vibrant city of Miami, Florida. This iconic festival has become a bucket-list destination for music enthusiasts from around the world, drawing tens of thousands of attendees to experience its electrifying atmosphere. Known for its star-studded lineup of world-class DJs, live performances, and cutting-edge stage production, Ultra delivers an unparalleled fusion of music, technology, and entertainment. From its high-energy beats to its immersive visuals and breathtaking pyrotechnics, the festival creates a dynamic environment that celebrates the very best of electronic music culture.\"}'))
  ];
  List<EventsStruct> get EVENTS => _EVENTS;
  set EVENTS(List<EventsStruct> value) {
    _EVENTS = value;
  }

  void addToEVENTS(EventsStruct value) {
    EVENTS.add(value);
  }

  void removeFromEVENTS(EventsStruct value) {
    EVENTS.remove(value);
  }

  void removeAtIndexFromEVENTS(int index) {
    EVENTS.removeAt(index);
  }

  void updateEVENTSAtIndex(
    int index,
    EventsStruct Function(EventsStruct) updateFn,
  ) {
    EVENTS[index] = updateFn(_EVENTS[index]);
  }

  void insertAtIndexInEVENTS(int index, EventsStruct value) {
    EVENTS.insert(index, value);
  }

  List<EventsStruct> _EVENTSFAVORITES = [];
  List<EventsStruct> get EVENTSFAVORITES => _EVENTSFAVORITES;
  set EVENTSFAVORITES(List<EventsStruct> value) {
    _EVENTSFAVORITES = value;
  }

  void addToEVENTSFAVORITES(EventsStruct value) {
    EVENTSFAVORITES.add(value);
  }

  void removeFromEVENTSFAVORITES(EventsStruct value) {
    EVENTSFAVORITES.remove(value);
  }

  void removeAtIndexFromEVENTSFAVORITES(int index) {
    EVENTSFAVORITES.removeAt(index);
  }

  void updateEVENTSFAVORITESAtIndex(
    int index,
    EventsStruct Function(EventsStruct) updateFn,
  ) {
    EVENTSFAVORITES[index] = updateFn(_EVENTSFAVORITES[index]);
  }

  void insertAtIndexInEVENTSFAVORITES(int index, EventsStruct value) {
    EVENTSFAVORITES.insert(index, value);
  }

  DateTime? _SelectedFilterDate;
  DateTime? get SelectedFilterDate => _SelectedFilterDate;
  set SelectedFilterDate(DateTime? value) {
    _SelectedFilterDate = value;
  }

  String _SelectedCategory = '';
  String get SelectedCategory => _SelectedCategory;
  set SelectedCategory(String value) {
    _SelectedCategory = value;
  }

  int _MyTicketsTAB = 0;
  int get MyTicketsTAB => _MyTicketsTAB;
  set MyTicketsTAB(int value) {
    _MyTicketsTAB = value;
  }

  int _OrganizatorTAB = 0;
  int get OrganizatorTAB => _OrganizatorTAB;
  set OrganizatorTAB(int value) {
    _OrganizatorTAB = value;
  }

  int _FavoritesTAB = 0;
  int get FavoritesTAB => _FavoritesTAB;
  set FavoritesTAB(int value) {
    _FavoritesTAB = value;
  }

  List<CommentsStruct> _CommentsList = [
    CommentsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Emma D.\",\"date\":\"March 2024\",\"comment\":\"This event was truly outstanding! From the moment I arrived, everything was smooth and well-organized. The staff was incredibly helpful.\"}')),
    CommentsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"James C.\",\"date\":\"July 2023\",\"comment\":\"I had such a great time! The live performances were incredible, and the organizers really outdid themselves with the setup.\"}')),
    CommentsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Sophia B.\",\"date\":\"November 2023\",\"comment\":\"What an amazing experience! I attended with my friends, and we all agreed it was one of the best events we’ve been to in a long time.\"}')),
    CommentsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Liam W.\",\"date\":\"February 2024\",\"comment\":\"This event exceeded my expectations. The location was easy to find, and the parking was convenient.\"}')),
    CommentsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Olivia M.\",\"date\":\"June 2023\",\"comment\":\"I’m so glad I decided to attend this event. The atmosphere was warm and welcoming, with something for everyone.\"}')),
    CommentsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Ethan M.\",\"date\":\"April 2024\",\"comment\":\"Overall, a good event. The venue was spacious and clean, and the activities were enjoyable.\"}'))
  ];
  List<CommentsStruct> get CommentsList => _CommentsList;
  set CommentsList(List<CommentsStruct> value) {
    _CommentsList = value;
  }

  void addToCommentsList(CommentsStruct value) {
    CommentsList.add(value);
  }

  void removeFromCommentsList(CommentsStruct value) {
    CommentsList.remove(value);
  }

  void removeAtIndexFromCommentsList(int index) {
    CommentsList.removeAt(index);
  }

  void updateCommentsListAtIndex(
    int index,
    CommentsStruct Function(CommentsStruct) updateFn,
  ) {
    CommentsList[index] = updateFn(_CommentsList[index]);
  }

  void insertAtIndexInCommentsList(int index, CommentsStruct value) {
    CommentsList.insert(index, value);
  }

  String _SelectedEventReport = '';
  String get SelectedEventReport => _SelectedEventReport;
  set SelectedEventReport(String value) {
    _SelectedEventReport = value;
  }

  String _SelectedTimeline = '';
  String get SelectedTimeline => _SelectedTimeline;
  set SelectedTimeline(String value) {
    _SelectedTimeline = value;
  }

  List<TicketStruct> _Tickets = [
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"General Admission (+18)\",\"price\":\"\$250\",\"description\":\"Enjoy full access to the festival grounds and experience all the main stage performances, food vendors, and immersive art installations. Perfect for those who want to soak in the atmosphere and dance the night away.\",\"quantity\":\"0\"}')),
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"VIP Pass, Premium viewing (+18)\",\"price\":\"\$500\",\"description\":\"Gain exclusive entry to VIP areas with premium viewing platforms, dedicated bars, and private restroom facilities. Ideal for attendees seeking a more comfortable and luxurious festival experience.\",\"quantity\":\"0\"}')),
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Ultra Premium Package (+18)\",\"price\":\"\$1,200\",\"description\":\"Get the ultimate festival experience with front-row access to performances, exclusive backstage tours, meet-and-greet opportunities with select artists, and complimentary drinks in VIP lounges.\",\"quantity\":\"0\"}')),
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"One-Day Pass (+18)\",\"price\":\"\$150\",\"description\":\"Perfect for those who can only attend one day of the festival. Includes general admission access to all stages and activities for a single day.\",\"quantity\":\"0\"}'))
  ];
  List<TicketStruct> get Tickets => _Tickets;
  set Tickets(List<TicketStruct> value) {
    _Tickets = value;
  }

  void addToTickets(TicketStruct value) {
    Tickets.add(value);
  }

  void removeFromTickets(TicketStruct value) {
    Tickets.remove(value);
  }

  void removeAtIndexFromTickets(int index) {
    Tickets.removeAt(index);
  }

  void updateTicketsAtIndex(
    int index,
    TicketStruct Function(TicketStruct) updateFn,
  ) {
    Tickets[index] = updateFn(_Tickets[index]);
  }

  void insertAtIndexInTickets(int index, TicketStruct value) {
    Tickets.insert(index, value);
  }

  List<TicketStruct> _SelectedTickets = [];
  List<TicketStruct> get SelectedTickets => _SelectedTickets;
  set SelectedTickets(List<TicketStruct> value) {
    _SelectedTickets = value;
  }

  void addToSelectedTickets(TicketStruct value) {
    SelectedTickets.add(value);
  }

  void removeFromSelectedTickets(TicketStruct value) {
    SelectedTickets.remove(value);
  }

  void removeAtIndexFromSelectedTickets(int index) {
    SelectedTickets.removeAt(index);
  }

  void updateSelectedTicketsAtIndex(
    int index,
    TicketStruct Function(TicketStruct) updateFn,
  ) {
    SelectedTickets[index] = updateFn(_SelectedTickets[index]);
  }

  void insertAtIndexInSelectedTickets(int index, TicketStruct value) {
    SelectedTickets.insert(index, value);
  }

  List<CollectionsStruct> _CollectionsList = [
    CollectionsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Best Events in January 2025\",\"descr\":\"0 upcoming events\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8a77l5u4lny5/34frefeggbb_gbd.png\"}')),
    CollectionsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"New Year 2025\",\"descr\":\"12 upcoming events\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/t6hjbtbtm5mu/qefrtbfhngn.png\"}')),
    CollectionsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Upcoming Events in March 2025\",\"descr\":\"4 upcoming events\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8cdz2l8rwhoy/qwefrgthntgjmhgnb.png\"}'))
  ];
  List<CollectionsStruct> get CollectionsList => _CollectionsList;
  set CollectionsList(List<CollectionsStruct> value) {
    _CollectionsList = value;
  }

  void addToCollectionsList(CollectionsStruct value) {
    CollectionsList.add(value);
  }

  void removeFromCollectionsList(CollectionsStruct value) {
    CollectionsList.remove(value);
  }

  void removeAtIndexFromCollectionsList(int index) {
    CollectionsList.removeAt(index);
  }

  void updateCollectionsListAtIndex(
    int index,
    CollectionsStruct Function(CollectionsStruct) updateFn,
  ) {
    CollectionsList[index] = updateFn(_CollectionsList[index]);
  }

  void insertAtIndexInCollectionsList(int index, CollectionsStruct value) {
    CollectionsList.insert(index, value);
  }

  String _SelectedLeftitems = '';
  String get SelectedLeftitems => _SelectedLeftitems;
  set SelectedLeftitems(String value) {
    _SelectedLeftitems = value;
  }

  List<String> _SelectedInterests = [];
  List<String> get SelectedInterests => _SelectedInterests;
  set SelectedInterests(List<String> value) {
    _SelectedInterests = value;
  }

  void addToSelectedInterests(String value) {
    SelectedInterests.add(value);
  }

  void removeFromSelectedInterests(String value) {
    SelectedInterests.remove(value);
  }

  void removeAtIndexFromSelectedInterests(int index) {
    SelectedInterests.removeAt(index);
  }

  void updateSelectedInterestsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedInterests[index] = updateFn(_SelectedInterests[index]);
  }

  void insertAtIndexInSelectedInterests(int index, String value) {
    SelectedInterests.insert(index, value);
  }

  List<String> _SelectedLookingFor = [];
  List<String> get SelectedLookingFor => _SelectedLookingFor;
  set SelectedLookingFor(List<String> value) {
    _SelectedLookingFor = value;
  }

  void addToSelectedLookingFor(String value) {
    SelectedLookingFor.add(value);
  }

  void removeFromSelectedLookingFor(String value) {
    SelectedLookingFor.remove(value);
  }

  void removeAtIndexFromSelectedLookingFor(int index) {
    SelectedLookingFor.removeAt(index);
  }

  void updateSelectedLookingForAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedLookingFor[index] = updateFn(_SelectedLookingFor[index]);
  }

  void insertAtIndexInSelectedLookingFor(int index, String value) {
    SelectedLookingFor.insert(index, value);
  }

  List<OrganizatorsStruct> _Organizators = [
    OrganizatorsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Ultra music Festival\",\"followers\":\"22K Followers\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8aqmgo69o2nt/st%2Csmall%2C507x507-pad%2C600x600%2Cf8f8f8.u2.jpg\"}')),
    OrganizatorsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"NYC Foodies United\",\"followers\":\"2.4K Followers\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/smr0q5na6iyx/food-drive-county_English_IG.jpeg\"}')),
    OrganizatorsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"City Art\",\"followers\":\"590 Followers\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/khfi2epsru55/event_522746956.jpg\"}')),
    OrganizatorsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"BitDevs NYC\",\"followers\":\"1.2K Followers\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/kqq08etdis18/event_525583511.jpg\"}')),
    OrganizatorsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Prodo Marketing\",\"followers\":\"128 Followers\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/buy20q9sfbne/event_524002748.jpg\"}')),
    OrganizatorsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Asian Meetup\",\"followers\":\"2.3K Followers\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/7cvgqctgm31x/event_525270379.jpg\"}'))
  ];
  List<OrganizatorsStruct> get Organizators => _Organizators;
  set Organizators(List<OrganizatorsStruct> value) {
    _Organizators = value;
  }

  void addToOrganizators(OrganizatorsStruct value) {
    Organizators.add(value);
  }

  void removeFromOrganizators(OrganizatorsStruct value) {
    Organizators.remove(value);
  }

  void removeAtIndexFromOrganizators(int index) {
    Organizators.removeAt(index);
  }

  void updateOrganizatorsAtIndex(
    int index,
    OrganizatorsStruct Function(OrganizatorsStruct) updateFn,
  ) {
    Organizators[index] = updateFn(_Organizators[index]);
  }

  void insertAtIndexInOrganizators(int index, OrganizatorsStruct value) {
    Organizators.insert(index, value);
  }

  List<OrganizatorsStruct> _SelectedOrganizators = [];
  List<OrganizatorsStruct> get SelectedOrganizators => _SelectedOrganizators;
  set SelectedOrganizators(List<OrganizatorsStruct> value) {
    _SelectedOrganizators = value;
  }

  void addToSelectedOrganizators(OrganizatorsStruct value) {
    SelectedOrganizators.add(value);
  }

  void removeFromSelectedOrganizators(OrganizatorsStruct value) {
    SelectedOrganizators.remove(value);
  }

  void removeAtIndexFromSelectedOrganizators(int index) {
    SelectedOrganizators.removeAt(index);
  }

  void updateSelectedOrganizatorsAtIndex(
    int index,
    OrganizatorsStruct Function(OrganizatorsStruct) updateFn,
  ) {
    SelectedOrganizators[index] = updateFn(_SelectedOrganizators[index]);
  }

  void insertAtIndexInSelectedOrganizators(
      int index, OrganizatorsStruct value) {
    SelectedOrganizators.insert(index, value);
  }

  List<TrandingEventsStruct> _TrandingEventsFavorites = [];
  List<TrandingEventsStruct> get TrandingEventsFavorites =>
      _TrandingEventsFavorites;
  set TrandingEventsFavorites(List<TrandingEventsStruct> value) {
    _TrandingEventsFavorites = value;
  }

  void addToTrandingEventsFavorites(TrandingEventsStruct value) {
    TrandingEventsFavorites.add(value);
  }

  void removeFromTrandingEventsFavorites(TrandingEventsStruct value) {
    TrandingEventsFavorites.remove(value);
  }

  void removeAtIndexFromTrandingEventsFavorites(int index) {
    TrandingEventsFavorites.removeAt(index);
  }

  void updateTrandingEventsFavoritesAtIndex(
    int index,
    TrandingEventsStruct Function(TrandingEventsStruct) updateFn,
  ) {
    TrandingEventsFavorites[index] = updateFn(_TrandingEventsFavorites[index]);
  }

  void insertAtIndexInTrandingEventsFavorites(
      int index, TrandingEventsStruct value) {
    TrandingEventsFavorites.insert(index, value);
  }

  EventsStruct _selectedData = EventsStruct();
  EventsStruct get selectedData => _selectedData;
  set selectedData(EventsStruct value) {
    _selectedData = value;
  }

  void updateSelectedDataStruct(Function(EventsStruct) updateFn) {
    updateFn(_selectedData);
  }

  bool _FromRegister = true;
  bool get FromRegister => _FromRegister;
  set FromRegister(bool value) {
    _FromRegister = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
