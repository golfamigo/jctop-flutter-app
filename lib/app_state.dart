import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
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
    _safeInit(() {
      _selectedCountry =
          prefs.getString('ff_selectedCountry') ?? _selectedCountry;
    });
    _safeInit(() {
      _selectedAppointmentDate = prefs.getInt('ff_selectedAppointmentDate') ??
          _selectedAppointmentDate;
    });
    _safeInit(() {
      _selectedGender = prefs.getString('ff_selectedGender') ?? _selectedGender;
    });
    _safeInit(() {
      _eventsFavorites = prefs
              .getStringList('ff_eventsFavorites')
              ?.map((x) {
                try {
                  return EventsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _eventsFavorites;
    });
    _safeInit(() {
      _selectedInterests =
          prefs.getStringList('ff_selectedInterests') ?? _selectedInterests;
    });
    _safeInit(() {
      _selectedLookingFor =
          prefs.getStringList('ff_selectedLookingFor') ?? _selectedLookingFor;
    });
    _safeInit(() {
      _selectedOrganizators = prefs
              .getStringList('ff_selectedOrganizators')
              ?.map((x) {
                try {
                  return OrganizatorsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _selectedOrganizators;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_selectedData')) {
        try {
          final serializedData = prefs.getString('ff_selectedData') ?? '{}';
          _selectedData =
              EventsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selectedCity = prefs.getString('ff_selectedCity') ?? _selectedCity;
    });
    _safeInit(() {
      _popularSearches =
          prefs.getStringList('ff_popularSearches') ?? _popularSearches;
    });
    _safeInit(() {
      _categoriesMultiLang =
          prefs.getStringList('ff_categoriesMultiLang') ?? _categoriesMultiLang;
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

  String _selectedCountry = 'Paris';
  String get selectedCountry => _selectedCountry;
  set selectedCountry(String value) {
    _selectedCountry = value;
    prefs.setString('ff_selectedCountry', value);
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

  String _selectedReschedule = 'I\'m having a schedule clash';
  String get selectedReschedule => _selectedReschedule;
  set selectedReschedule(String value) {
    _selectedReschedule = value;
  }

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1731232320000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  int _selectedAppointmentDate = 0;
  int get selectedAppointmentDate => _selectedAppointmentDate;
  set selectedAppointmentDate(int value) {
    _selectedAppointmentDate = value;
    prefs.setInt('ff_selectedAppointmentDate', value);
  }

  String _selectedReasonCancel = 'I just want to cancel';
  String get selectedReasonCancel => _selectedReasonCancel;
  set selectedReasonCancel(String value) {
    _selectedReasonCancel = value;
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

  int _selectedPackage = 0;
  int get selectedPackage => _selectedPackage;
  set selectedPackage(int value) {
    _selectedPackage = value;
  }

  String _selectedGender = '';
  String get selectedGender => _selectedGender;
  set selectedGender(String value) {
    _selectedGender = value;
    prefs.setString('ff_selectedGender', value);
  }

  int _selectedCard = 0;
  int get selectedCard => _selectedCard;
  set selectedCard(int value) {
    _selectedCard = value;
  }

  String _selectedAvailabilityFilter = 'In the next 3 days';
  String get selectedAvailabilityFilter => _selectedAvailabilityFilter;
  set selectedAvailabilityFilter(String value) {
    _selectedAvailabilityFilter = value;
  }

  bool _selectedFilter3 = false;
  bool get selectedFilter3 => _selectedFilter3;
  set selectedFilter3(bool value) {
    _selectedFilter3 = value;
  }

  String _selectedSortBy = 'Popularity';
  String get selectedSortBy => _selectedSortBy;
  set selectedSortBy(String value) {
    _selectedSortBy = value;
  }

  List<TrandingEventsStruct> _trandingEvents = [
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
  List<TrandingEventsStruct> get trandingEvents => _trandingEvents;
  set trandingEvents(List<TrandingEventsStruct> value) {
    _trandingEvents = value;
  }

  void addToTrandingEvents(TrandingEventsStruct value) {
    trandingEvents.add(value);
  }

  void removeFromTrandingEvents(TrandingEventsStruct value) {
    trandingEvents.remove(value);
  }

  void removeAtIndexFromTrandingEvents(int index) {
    trandingEvents.removeAt(index);
  }

  void updateTrandingEventsAtIndex(
    int index,
    TrandingEventsStruct Function(TrandingEventsStruct) updateFn,
  ) {
    trandingEvents[index] = updateFn(_trandingEvents[index]);
  }

  void insertAtIndexInTrandingEvents(int index, TrandingEventsStruct value) {
    trandingEvents.insert(index, value);
  }

  List<EventsStruct> _events = [
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
  List<EventsStruct> get events => _events;
  set events(List<EventsStruct> value) {
    _events = value;
  }

  void addToEvents(EventsStruct value) {
    events.add(value);
  }

  void removeFromEvents(EventsStruct value) {
    events.remove(value);
  }

  void removeAtIndexFromEvents(int index) {
    events.removeAt(index);
  }

  void updateEventsAtIndex(
    int index,
    EventsStruct Function(EventsStruct) updateFn,
  ) {
    events[index] = updateFn(_events[index]);
  }

  void insertAtIndexInEvents(int index, EventsStruct value) {
    events.insert(index, value);
  }

  List<EventsStruct> _eventsFavorites = [];
  List<EventsStruct> get eventsFavorites => _eventsFavorites;
  set eventsFavorites(List<EventsStruct> value) {
    _eventsFavorites = value;
    prefs.setStringList(
        'ff_eventsFavorites', value.map((x) => x.serialize()).toList());
  }

  void addToEventsFavorites(EventsStruct value) {
    eventsFavorites.add(value);
    prefs.setStringList('ff_eventsFavorites',
        _eventsFavorites.map((x) => x.serialize()).toList());
  }

  void removeFromEventsFavorites(EventsStruct value) {
    eventsFavorites.remove(value);
    prefs.setStringList('ff_eventsFavorites',
        _eventsFavorites.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromEventsFavorites(int index) {
    eventsFavorites.removeAt(index);
    prefs.setStringList('ff_eventsFavorites',
        _eventsFavorites.map((x) => x.serialize()).toList());
  }

  void updateEventsFavoritesAtIndex(
    int index,
    EventsStruct Function(EventsStruct) updateFn,
  ) {
    eventsFavorites[index] = updateFn(_eventsFavorites[index]);
    prefs.setStringList('ff_eventsFavorites',
        _eventsFavorites.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInEventsFavorites(int index, EventsStruct value) {
    eventsFavorites.insert(index, value);
    prefs.setStringList('ff_eventsFavorites',
        _eventsFavorites.map((x) => x.serialize()).toList());
  }

  DateTime? _selectedFilterDate =
      DateTime.fromMillisecondsSinceEpoch(1757745180000);
  DateTime? get selectedFilterDate => _selectedFilterDate;
  set selectedFilterDate(DateTime? value) {
    _selectedFilterDate = value;
  }

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  int _myTicketsTAB = 0;
  int get myTicketsTAB => _myTicketsTAB;
  set myTicketsTAB(int value) {
    _myTicketsTAB = value;
  }

  int _organizatorTAB = 0;
  int get organizatorTAB => _organizatorTAB;
  set organizatorTAB(int value) {
    _organizatorTAB = value;
  }

  int _favoritesTAB = 0;
  int get favoritesTAB => _favoritesTAB;
  set favoritesTAB(int value) {
    _favoritesTAB = value;
  }

  List<CommentsStruct> _commentsList = [
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
  List<CommentsStruct> get commentsList => _commentsList;
  set commentsList(List<CommentsStruct> value) {
    _commentsList = value;
  }

  void addToCommentsList(CommentsStruct value) {
    commentsList.add(value);
  }

  void removeFromCommentsList(CommentsStruct value) {
    commentsList.remove(value);
  }

  void removeAtIndexFromCommentsList(int index) {
    commentsList.removeAt(index);
  }

  void updateCommentsListAtIndex(
    int index,
    CommentsStruct Function(CommentsStruct) updateFn,
  ) {
    commentsList[index] = updateFn(_commentsList[index]);
  }

  void insertAtIndexInCommentsList(int index, CommentsStruct value) {
    commentsList.insert(index, value);
  }

  String _selectedEventReport = '';
  String get selectedEventReport => _selectedEventReport;
  set selectedEventReport(String value) {
    _selectedEventReport = value;
  }

  String _selectedTimeline = '';
  String get selectedTimeline => _selectedTimeline;
  set selectedTimeline(String value) {
    _selectedTimeline = value;
  }

  List<TicketStruct> _tickets = [
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"General Admission (+18)\",\"price\":\"\$250\",\"description\":\"Enjoy full access to the festival grounds and experience all the main stage performances, food vendors, and immersive art installations. Perfect for those who want to soak in the atmosphere and dance the night away.\",\"quantity\":\"0\"}')),
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"VIP Pass, Premium viewing (+18)\",\"price\":\"\$500\",\"description\":\"Gain exclusive entry to VIP areas with premium viewing platforms, dedicated bars, and private restroom facilities. Ideal for attendees seeking a more comfortable and luxurious festival experience.\",\"quantity\":\"0\"}')),
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Ultra Premium Package (+18)\",\"price\":\"\$1,200\",\"description\":\"Get the ultimate festival experience with front-row access to performances, exclusive backstage tours, meet-and-greet opportunities with select artists, and complimentary drinks in VIP lounges.\",\"quantity\":\"0\"}')),
    TicketStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"One-Day Pass (+18)\",\"price\":\"\$150\",\"description\":\"Perfect for those who can only attend one day of the festival. Includes general admission access to all stages and activities for a single day.\",\"quantity\":\"0\"}'))
  ];
  List<TicketStruct> get tickets => _tickets;
  set tickets(List<TicketStruct> value) {
    _tickets = value;
  }

  void addToTickets(TicketStruct value) {
    tickets.add(value);
  }

  void removeFromTickets(TicketStruct value) {
    tickets.remove(value);
  }

  void removeAtIndexFromTickets(int index) {
    tickets.removeAt(index);
  }

  void updateTicketsAtIndex(
    int index,
    TicketStruct Function(TicketStruct) updateFn,
  ) {
    tickets[index] = updateFn(_tickets[index]);
  }

  void insertAtIndexInTickets(int index, TicketStruct value) {
    tickets.insert(index, value);
  }

  List<TicketStruct> _selectedTickets = [];
  List<TicketStruct> get selectedTickets => _selectedTickets;
  set selectedTickets(List<TicketStruct> value) {
    _selectedTickets = value;
  }

  void addToSelectedTickets(TicketStruct value) {
    selectedTickets.add(value);
  }

  void removeFromSelectedTickets(TicketStruct value) {
    selectedTickets.remove(value);
  }

  void removeAtIndexFromSelectedTickets(int index) {
    selectedTickets.removeAt(index);
  }

  void updateSelectedTicketsAtIndex(
    int index,
    TicketStruct Function(TicketStruct) updateFn,
  ) {
    selectedTickets[index] = updateFn(_selectedTickets[index]);
  }

  void insertAtIndexInSelectedTickets(int index, TicketStruct value) {
    selectedTickets.insert(index, value);
  }

  List<CollectionsStruct> _collectionsList = [
    CollectionsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Best Events in January 2025\",\"descr\":\"0 upcoming events\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8a77l5u4lny5/34frefeggbb_gbd.png\"}')),
    CollectionsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"New Year 2025\",\"descr\":\"12 upcoming events\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/t6hjbtbtm5mu/qefrtbfhngn.png\"}')),
    CollectionsStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Upcoming Events in March 2025\",\"descr\":\"4 upcoming events\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eventy-118kat/assets/8cdz2l8rwhoy/qwefrgthntgjmhgnb.png\"}'))
  ];
  List<CollectionsStruct> get collectionsList => _collectionsList;
  set collectionsList(List<CollectionsStruct> value) {
    _collectionsList = value;
  }

  void addToCollectionsList(CollectionsStruct value) {
    collectionsList.add(value);
  }

  void removeFromCollectionsList(CollectionsStruct value) {
    collectionsList.remove(value);
  }

  void removeAtIndexFromCollectionsList(int index) {
    collectionsList.removeAt(index);
  }

  void updateCollectionsListAtIndex(
    int index,
    CollectionsStruct Function(CollectionsStruct) updateFn,
  ) {
    collectionsList[index] = updateFn(_collectionsList[index]);
  }

  void insertAtIndexInCollectionsList(int index, CollectionsStruct value) {
    collectionsList.insert(index, value);
  }

  String _selectedLeftitems = '';
  String get selectedLeftitems => _selectedLeftitems;
  set selectedLeftitems(String value) {
    _selectedLeftitems = value;
  }

  List<String> _selectedInterests = [];
  List<String> get selectedInterests => _selectedInterests;
  set selectedInterests(List<String> value) {
    _selectedInterests = value;
    prefs.setStringList('ff_selectedInterests', value);
  }

  void addToSelectedInterests(String value) {
    selectedInterests.add(value);
    prefs.setStringList('ff_selectedInterests', _selectedInterests);
  }

  void removeFromSelectedInterests(String value) {
    selectedInterests.remove(value);
    prefs.setStringList('ff_selectedInterests', _selectedInterests);
  }

  void removeAtIndexFromSelectedInterests(int index) {
    selectedInterests.removeAt(index);
    prefs.setStringList('ff_selectedInterests', _selectedInterests);
  }

  void updateSelectedInterestsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedInterests[index] = updateFn(_selectedInterests[index]);
    prefs.setStringList('ff_selectedInterests', _selectedInterests);
  }

  void insertAtIndexInSelectedInterests(int index, String value) {
    selectedInterests.insert(index, value);
    prefs.setStringList('ff_selectedInterests', _selectedInterests);
  }

  List<String> _selectedLookingFor = [];
  List<String> get selectedLookingFor => _selectedLookingFor;
  set selectedLookingFor(List<String> value) {
    _selectedLookingFor = value;
    prefs.setStringList('ff_selectedLookingFor', value);
  }

  void addToSelectedLookingFor(String value) {
    selectedLookingFor.add(value);
    prefs.setStringList('ff_selectedLookingFor', _selectedLookingFor);
  }

  void removeFromSelectedLookingFor(String value) {
    selectedLookingFor.remove(value);
    prefs.setStringList('ff_selectedLookingFor', _selectedLookingFor);
  }

  void removeAtIndexFromSelectedLookingFor(int index) {
    selectedLookingFor.removeAt(index);
    prefs.setStringList('ff_selectedLookingFor', _selectedLookingFor);
  }

  void updateSelectedLookingForAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedLookingFor[index] = updateFn(_selectedLookingFor[index]);
    prefs.setStringList('ff_selectedLookingFor', _selectedLookingFor);
  }

  void insertAtIndexInSelectedLookingFor(int index, String value) {
    selectedLookingFor.insert(index, value);
    prefs.setStringList('ff_selectedLookingFor', _selectedLookingFor);
  }

  List<OrganizatorsStruct> _organizators = [
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
  List<OrganizatorsStruct> get organizators => _organizators;
  set organizators(List<OrganizatorsStruct> value) {
    _organizators = value;
  }

  void addToOrganizators(OrganizatorsStruct value) {
    organizators.add(value);
  }

  void removeFromOrganizators(OrganizatorsStruct value) {
    organizators.remove(value);
  }

  void removeAtIndexFromOrganizators(int index) {
    organizators.removeAt(index);
  }

  void updateOrganizatorsAtIndex(
    int index,
    OrganizatorsStruct Function(OrganizatorsStruct) updateFn,
  ) {
    organizators[index] = updateFn(_organizators[index]);
  }

  void insertAtIndexInOrganizators(int index, OrganizatorsStruct value) {
    organizators.insert(index, value);
  }

  List<OrganizatorsStruct> _selectedOrganizators = [];
  List<OrganizatorsStruct> get selectedOrganizators => _selectedOrganizators;
  set selectedOrganizators(List<OrganizatorsStruct> value) {
    _selectedOrganizators = value;
    prefs.setStringList(
        'ff_selectedOrganizators', value.map((x) => x.serialize()).toList());
  }

  void addToSelectedOrganizators(OrganizatorsStruct value) {
    selectedOrganizators.add(value);
    prefs.setStringList('ff_selectedOrganizators',
        _selectedOrganizators.map((x) => x.serialize()).toList());
  }

  void removeFromSelectedOrganizators(OrganizatorsStruct value) {
    selectedOrganizators.remove(value);
    prefs.setStringList('ff_selectedOrganizators',
        _selectedOrganizators.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSelectedOrganizators(int index) {
    selectedOrganizators.removeAt(index);
    prefs.setStringList('ff_selectedOrganizators',
        _selectedOrganizators.map((x) => x.serialize()).toList());
  }

  void updateSelectedOrganizatorsAtIndex(
    int index,
    OrganizatorsStruct Function(OrganizatorsStruct) updateFn,
  ) {
    selectedOrganizators[index] = updateFn(_selectedOrganizators[index]);
    prefs.setStringList('ff_selectedOrganizators',
        _selectedOrganizators.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSelectedOrganizators(
      int index, OrganizatorsStruct value) {
    selectedOrganizators.insert(index, value);
    prefs.setStringList('ff_selectedOrganizators',
        _selectedOrganizators.map((x) => x.serialize()).toList());
  }

  List<TrandingEventsStruct> _trandingEventsFavorites = [];
  List<TrandingEventsStruct> get trandingEventsFavorites =>
      _trandingEventsFavorites;
  set trandingEventsFavorites(List<TrandingEventsStruct> value) {
    _trandingEventsFavorites = value;
  }

  void addToTrandingEventsFavorites(TrandingEventsStruct value) {
    trandingEventsFavorites.add(value);
  }

  void removeFromTrandingEventsFavorites(TrandingEventsStruct value) {
    trandingEventsFavorites.remove(value);
  }

  void removeAtIndexFromTrandingEventsFavorites(int index) {
    trandingEventsFavorites.removeAt(index);
  }

  void updateTrandingEventsFavoritesAtIndex(
    int index,
    TrandingEventsStruct Function(TrandingEventsStruct) updateFn,
  ) {
    trandingEventsFavorites[index] = updateFn(_trandingEventsFavorites[index]);
  }

  void insertAtIndexInTrandingEventsFavorites(
      int index, TrandingEventsStruct value) {
    trandingEventsFavorites.insert(index, value);
  }

  EventsStruct _selectedData = EventsStruct();
  EventsStruct get selectedData => _selectedData;
  set selectedData(EventsStruct value) {
    _selectedData = value;
    prefs.setString('ff_selectedData', value.serialize());
  }

  void updateSelectedDataStruct(Function(EventsStruct) updateFn) {
    updateFn(_selectedData);
    prefs.setString('ff_selectedData', _selectedData.serialize());
  }

  bool _fromRegister = true;
  bool get fromRegister => _fromRegister;
  set fromRegister(bool value) {
    _fromRegister = value;
  }

  LatLng? _userLocation = LatLng(25.0329636, 121.5654268);
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    _userLocation = value;
  }

  bool _ifSetLocationOnRegister = false;
  bool get ifSetLocationOnRegister => _ifSetLocationOnRegister;
  set ifSetLocationOnRegister(bool value) {
    _ifSetLocationOnRegister = value;
  }

  List<OrganizatorsStruct> _test = [];
  List<OrganizatorsStruct> get test => _test;
  set test(List<OrganizatorsStruct> value) {
    _test = value;
  }

  void addToTest(OrganizatorsStruct value) {
    test.add(value);
  }

  void removeFromTest(OrganizatorsStruct value) {
    test.remove(value);
  }

  void removeAtIndexFromTest(int index) {
    test.removeAt(index);
  }

  void updateTestAtIndex(
    int index,
    OrganizatorsStruct Function(OrganizatorsStruct) updateFn,
  ) {
    test[index] = updateFn(_test[index]);
  }

  void insertAtIndexInTest(int index, OrganizatorsStruct value) {
    test.insert(index, value);
  }

  String _selectedCity = '巴黎';
  String get selectedCity => _selectedCity;
  set selectedCity(String value) {
    _selectedCity = value;
    prefs.setString('ff_selectedCity', value);
  }

  List<NewShowStruct> _newShow = [];
  List<NewShowStruct> get newShow => _newShow;
  set newShow(List<NewShowStruct> value) {
    _newShow = value;
  }

  void addToNewShow(NewShowStruct value) {
    newShow.add(value);
  }

  void removeFromNewShow(NewShowStruct value) {
    newShow.remove(value);
  }

  void removeAtIndexFromNewShow(int index) {
    newShow.removeAt(index);
  }

  void updateNewShowAtIndex(
    int index,
    NewShowStruct Function(NewShowStruct) updateFn,
  ) {
    newShow[index] = updateFn(_newShow[index]);
  }

  void insertAtIndexInNewShow(int index, NewShowStruct value) {
    newShow.insert(index, value);
  }

  TicketTypeDetailStruct _selectedTicketType = TicketTypeDetailStruct();
  TicketTypeDetailStruct get selectedTicketType => _selectedTicketType;
  set selectedTicketType(TicketTypeDetailStruct value) {
    _selectedTicketType = value;
  }

  void updateSelectedTicketTypeStruct(
      Function(TicketTypeDetailStruct) updateFn) {
    updateFn(_selectedTicketType);
  }

  /// RegistrationDetailStruct _currentRegistration =
  /// RegistrationDetailStruct();
  RegistrationDetailStruct _currentRegistration = RegistrationDetailStruct();
  RegistrationDetailStruct get currentRegistration => _currentRegistration;
  set currentRegistration(RegistrationDetailStruct value) {
    _currentRegistration = value;
  }

  void updateCurrentRegistrationStruct(
      Function(RegistrationDetailStruct) updateFn) {
    updateFn(_currentRegistration);
  }

  ///   // 活動票務統計
  ///   EventTicketingSummaryStruct _currentEventSummary =
  /// EventTicketingSummaryStruct();
  EventTicketingSummaryStruct _currentEventSummary =
      EventTicketingSummaryStruct();
  EventTicketingSummaryStruct get currentEventSummary => _currentEventSummary;
  set currentEventSummary(EventTicketingSummaryStruct value) {
    _currentEventSummary = value;
  }

  void updateCurrentEventSummaryStruct(
      Function(EventTicketingSummaryStruct) updateFn) {
    updateFn(_currentEventSummary);
  }

  ///   // 購物車票券列表
  ///   List<CartItemStruct> _cartTickets = [];
  List<CartItemStruct> _cartTickets = [];
  List<CartItemStruct> get cartTickets => _cartTickets;
  set cartTickets(List<CartItemStruct> value) {
    _cartTickets = value;
  }

  void addToCartTickets(CartItemStruct value) {
    cartTickets.add(value);
  }

  void removeFromCartTickets(CartItemStruct value) {
    cartTickets.remove(value);
  }

  void removeAtIndexFromCartTickets(int index) {
    cartTickets.removeAt(index);
  }

  void updateCartTicketsAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    cartTickets[index] = updateFn(_cartTickets[index]);
  }

  void insertAtIndexInCartTickets(int index, CartItemStruct value) {
    cartTickets.insert(index, value);
  }

  ///   // 選中的座位列表
  ///   List<SeatAvailabilityStruct> _selectedSeats = [];
  List<SeatAvailabilityStruct> _selectedSeats = [];
  List<SeatAvailabilityStruct> get selectedSeats => _selectedSeats;
  set selectedSeats(List<SeatAvailabilityStruct> value) {
    _selectedSeats = value;
  }

  void addToSelectedSeats(SeatAvailabilityStruct value) {
    selectedSeats.add(value);
  }

  void removeFromSelectedSeats(SeatAvailabilityStruct value) {
    selectedSeats.remove(value);
  }

  void removeAtIndexFromSelectedSeats(int index) {
    selectedSeats.removeAt(index);
  }

  void updateSelectedSeatsAtIndex(
    int index,
    SeatAvailabilityStruct Function(SeatAvailabilityStruct) updateFn,
  ) {
    selectedSeats[index] = updateFn(_selectedSeats[index]);
  }

  void insertAtIndexInSelectedSeats(int index, SeatAvailabilityStruct value) {
    selectedSeats.insert(index, value);
  }

  ///   // 用戶報名歷史列表
  ///   List<RegistrationDetailStruct> _userRegistrations = [];
  List<RegistrationDetailStruct> _userRegistrations = [];
  List<RegistrationDetailStruct> get userRegistrations => _userRegistrations;
  set userRegistrations(List<RegistrationDetailStruct> value) {
    _userRegistrations = value;
  }

  void addToUserRegistrations(RegistrationDetailStruct value) {
    userRegistrations.add(value);
  }

  void removeFromUserRegistrations(RegistrationDetailStruct value) {
    userRegistrations.remove(value);
  }

  void removeAtIndexFromUserRegistrations(int index) {
    userRegistrations.removeAt(index);
  }

  void updateUserRegistrationsAtIndex(
    int index,
    RegistrationDetailStruct Function(RegistrationDetailStruct) updateFn,
  ) {
    userRegistrations[index] = updateFn(_userRegistrations[index]);
  }

  void insertAtIndexInUserRegistrations(
      int index, RegistrationDetailStruct value) {
    userRegistrations.insert(index, value);
  }

  ///   // 可用票種列表
  ///   List<TicketTypeDetailStruct> _availableTicketTypes = [];
  List<TicketTypeDetailStruct> _availableTicketTypes = [];
  List<TicketTypeDetailStruct> get availableTicketTypes =>
      _availableTicketTypes;
  set availableTicketTypes(List<TicketTypeDetailStruct> value) {
    _availableTicketTypes = value;
  }

  void addToAvailableTicketTypes(TicketTypeDetailStruct value) {
    availableTicketTypes.add(value);
  }

  void removeFromAvailableTicketTypes(TicketTypeDetailStruct value) {
    availableTicketTypes.remove(value);
  }

  void removeAtIndexFromAvailableTicketTypes(int index) {
    availableTicketTypes.removeAt(index);
  }

  void updateAvailableTicketTypesAtIndex(
    int index,
    TicketTypeDetailStruct Function(TicketTypeDetailStruct) updateFn,
  ) {
    availableTicketTypes[index] = updateFn(_availableTicketTypes[index]);
  }

  void insertAtIndexInAvailableTicketTypes(
      int index, TicketTypeDetailStruct value) {
    availableTicketTypes.insert(index, value);
  }

  String _selectedSeatingZoneId = '';
  String get selectedSeatingZoneId => _selectedSeatingZoneId;
  set selectedSeatingZoneId(String value) {
    _selectedSeatingZoneId = value;
  }

  String _selectedPriceRange = '';
  String get selectedPriceRange => _selectedPriceRange;
  set selectedPriceRange(String value) {
    _selectedPriceRange = value;
  }

  String _seatSelectionMode = '';
  String get seatSelectionMode => _seatSelectionMode;
  set seatSelectionMode(String value) {
    _seatSelectionMode = value;
  }

  int _registrationStep = 0;
  int get registrationStep => _registrationStep;
  set registrationStep(int value) {
    _registrationStep = value;
  }

  double _minPrice = 0.0;
  double get minPrice => _minPrice;
  set minPrice(double value) {
    _minPrice = value;
  }

  double _maxPrice = 0.0;
  double get maxPrice => _maxPrice;
  set maxPrice(double value) {
    _maxPrice = value;
  }

  bool _showAvailableOnly = false;
  bool get showAvailableOnly => _showAvailableOnly;
  set showAvailableOnly(bool value) {
    _showAvailableOnly = value;
  }

  bool _requiresSeatSelection = false;
  bool get requiresSeatSelection => _requiresSeatSelection;
  set requiresSeatSelection(bool value) {
    _requiresSeatSelection = value;
  }

  bool _isLoadingTickets = false;
  bool get isLoadingTickets => _isLoadingTickets;
  set isLoadingTickets(bool value) {
    _isLoadingTickets = value;
  }

  bool _isLoadingSeats = false;
  bool get isLoadingSeats => _isLoadingSeats;
  set isLoadingSeats(bool value) {
    _isLoadingSeats = value;
  }

  String _ticketingError = '';
  String get ticketingError => _ticketingError;
  set ticketingError(String value) {
    _ticketingError = value;
  }

  List<EventsStruct> _eventList = [];
  List<EventsStruct> get eventList => _eventList;
  set eventList(List<EventsStruct> value) {
    _eventList = value;
  }

  void addToEventList(EventsStruct value) {
    eventList.add(value);
  }

  void removeFromEventList(EventsStruct value) {
    eventList.remove(value);
  }

  void removeAtIndexFromEventList(int index) {
    eventList.removeAt(index);
  }

  void updateEventListAtIndex(
    int index,
    EventsStruct Function(EventsStruct) updateFn,
  ) {
    eventList[index] = updateFn(_eventList[index]);
  }

  void insertAtIndexInEventList(int index, EventsStruct value) {
    eventList.insert(index, value);
  }

  bool _refreshHomeRequest = false;
  bool get refreshHomeRequest => _refreshHomeRequest;
  set refreshHomeRequest(bool value) {
    _refreshHomeRequest = value;
  }

  List<String> _popularSearches = [];
  List<String> get popularSearches => _popularSearches;
  set popularSearches(List<String> value) {
    _popularSearches = value;
    prefs.setStringList('ff_popularSearches', value);
  }

  void addToPopularSearches(String value) {
    popularSearches.add(value);
    prefs.setStringList('ff_popularSearches', _popularSearches);
  }

  void removeFromPopularSearches(String value) {
    popularSearches.remove(value);
    prefs.setStringList('ff_popularSearches', _popularSearches);
  }

  void removeAtIndexFromPopularSearches(int index) {
    popularSearches.removeAt(index);
    prefs.setStringList('ff_popularSearches', _popularSearches);
  }

  void updatePopularSearchesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    popularSearches[index] = updateFn(_popularSearches[index]);
    prefs.setStringList('ff_popularSearches', _popularSearches);
  }

  void insertAtIndexInPopularSearches(int index, String value) {
    popularSearches.insert(index, value);
    prefs.setStringList('ff_popularSearches', _popularSearches);
  }

  List<String> _categoriesMultiLang = [];
  List<String> get categoriesMultiLang => _categoriesMultiLang;
  set categoriesMultiLang(List<String> value) {
    _categoriesMultiLang = value;
    prefs.setStringList('ff_categoriesMultiLang', value);
  }

  void addToCategoriesMultiLang(String value) {
    categoriesMultiLang.add(value);
    prefs.setStringList('ff_categoriesMultiLang', _categoriesMultiLang);
  }

  void removeFromCategoriesMultiLang(String value) {
    categoriesMultiLang.remove(value);
    prefs.setStringList('ff_categoriesMultiLang', _categoriesMultiLang);
  }

  void removeAtIndexFromCategoriesMultiLang(int index) {
    categoriesMultiLang.removeAt(index);
    prefs.setStringList('ff_categoriesMultiLang', _categoriesMultiLang);
  }

  void updateCategoriesMultiLangAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoriesMultiLang[index] = updateFn(_categoriesMultiLang[index]);
    prefs.setStringList('ff_categoriesMultiLang', _categoriesMultiLang);
  }

  void insertAtIndexInCategoriesMultiLang(int index, String value) {
    categoriesMultiLang.insert(index, value);
    prefs.setStringList('ff_categoriesMultiLang', _categoriesMultiLang);
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
