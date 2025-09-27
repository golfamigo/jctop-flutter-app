# Event Hub FlutterFlow App Knowledge Base

## Project Overview
**Project Name:** Event Hub - Create and Join Events  
**Platform:** FlutterFlow  
**Backend:** Supabase  
**Architecture:** Event Management Platform

## Quick Reference

### Core Statistics
- **Total Pages:** 29
- **Reusable Components:** 30+
- **Database Tables:** 17 (including views)
- **Main User Flows:** 5

## User Flows & Navigation

### 1. User Registration Flow
```
Splash → Onboarding(1-3) → SignUp → Verification → SlctInterest → HomePageAskLocation → HomePageMain
```

### 2. Event Discovery & Participation Flow
```
HomePageMain → SearchResult → EventDetail → BuyTicket → Payment → PaymentConfirm → TicketDisplay
```

### 3. Event Creation Flow
```
HomePageMain (FAB) → CreateEvent → CreateEventFinal → MyEventDetail
```

### 4. Profile Management Flow
```
HomePageMain (Drawer) → MyProfile → EditProfile
```

### 5. Community Interaction Flow
```
EventDetail → EventMembersLis → OrgnizerProfile → EventGroupGallery
```

## Database Schema

### Core Tables
| Table | Purpose | Key Fields |
|-------|---------|------------|
| events | Main event data | id, title, description, start_date, end_date, status |
| users | User accounts | id, email, name, profile_image |
| registrations | Event registrations | id, event_id, user_id, status |
| ticket_types | Ticket variations | id, event_id, name, price, quantity |
| payments | Payment records | id, registration_id, amount, status |
| categories | Event categories | id, name, icon, color |
| notifications | User notifications | id, user_id, type, message, read |

### Critical Views
| View | Purpose | Usage |
|------|---------|-------|
| v_events_list | Complete event info with venue, organizer, category | Main event listings |
| v_my_events | User's created/joined events | Profile pages |
| v_event_stats | Event analytics | Dashboard widgets |
| v_notifications | Formatted notifications | Notification center |

## Component Library

### Event Display Components
- **UpcomingEventCardWidget**
  - Props: eventId, title, date, image, attendeeCount, maxAttendees
  - Used in: HomePageMain, MyEvents, SearchResult

- **EventdetailsVenueWidget**
  - Props: venueName, address, latitude, longitude
  - Used in: EventDetail, MyEventDetail

- **EventdetailsTimeWidget**
  - Props: startDate, endDate, timezone
  - Used in: EventDetail, MyEventDetail

### User Interface Components
- **SearchInputWidget**
  - Props: placeholder, onSearch, filters
  - Used in: HomePageMain, SearchResult

- **NotificationListCardWidget**
  - Props: notification object
  - Used in: NotificationList

### Payment Components
- **PaymentCardWidget**
  - Props: cardNumber, expiryDate, cvv
  - Used in: Payment

- **TicketTypeCardUnslctWidget**
  - Props: ticketType, price, available
  - Used in: BuyTicket

## Required Actions & Triggers

### Page Load Actions
```dart
// HomePageMain
onPageLoad:
  - getUserLocation()
  - loadFeaturedEvents()
  - checkNotificationCount()

// EventDetail
onPageLoad:
  - loadEventDetails(eventId)
  - checkUserRegistration()
  - loadRelatedEvents()
```

### User Interaction Actions
```dart
// Event Card Tap
onTap:
  - navigateToEventDetail(eventId)

// Buy Ticket Button
onTap:
  - checkAuthStatus()
  - navigateToTicketSelection()
  
// Share Button
onTap:
  - showShareBottomSheet()
  - generateShareLink()
```

## Custom Functions Recommendations

### Utility Functions (Use Custom Functions)
```dart
// Date Formatting
String formatEventDateTime(DateTime start, DateTime end)

// Price Display
String formatPriceRange(double min, double max)

// Availability Check
int calculateRemainingSeats(int max, int current)

// Status Determination
String getEventStatus(DateTime start, DateTime end, int seats)
```

### Complex Operations (Use Custom Actions)
```dart
// Batch Image Upload
Future<List<String>> uploadEventGallery(List<File> images)

// QR Code Generation
Future<String> generateTicketQR(String registrationId)

// Email Notifications
Future<void> sendEventReminder(String userId, String eventId)
```

## Database Operations Strategy

### Use Supabase Views/Functions For:
1. **Event Recommendations** - SQL view based on user interests
2. **Search & Filtering** - Full-text search with filters
3. **Analytics** - Aggregated statistics views
4. **Permissions** - Row Level Security (RLS)
5. **Notifications** - Database triggers

### Use FlutterFlow Actions For:
1. **Simple CRUD** - Basic create, read, update, delete
2. **Navigation** - Page routing with parameters
3. **UI State** - Loading, error, success states
4. **Form Validation** - Input validation before submission

## Performance Optimization Checklist

### Data Loading
- [ ] Implement pagination for event lists
- [ ] Use FutureBuilder for async data
- [ ] Cache frequently accessed data
- [ ] Lazy load images

### State Management
- [ ] Use Provider for global state
- [ ] FFAppState for temporary UI state
- [ ] Minimize unnecessary rebuilds

### User Experience
- [ ] Add skeleton loaders
- [ ] Implement pull-to-refresh
- [ ] Show empty states
- [ ] Provide offline support

## Security Considerations

### Authentication
- Supabase Auth with email verification
- Social login options (Google, Apple)
- Password reset flow

### Data Protection
- Row Level Security (RLS) policies
- Secure payment processing
- Personal data encryption

### User Permissions
- Event creator privileges
- Attendee restrictions
- Admin capabilities

## Testing Scenarios

### Critical User Paths
1. Complete registration flow
2. Search and filter events
3. Purchase ticket successfully
4. Create and publish event
5. Receive and read notifications

### Edge Cases
- Network connectivity issues
- Payment failures
- Sold out events
- Concurrent bookings
- Large image uploads

## Development Guidelines

### Naming Conventions
- Pages: `[Feature][Action]Widget` (e.g., EventDetailWidget)
- Components: `[Type][Purpose]Widget` (e.g., UpcomingEventCardWidget)
- Variables: camelCase (e.g., eventId, startDate)

### Code Organization
```
lib/
├── pages/          # Main app pages
├── components/     # Reusable widgets
├── backend/        # Supabase integration
├── flutter_flow/   # FF generated code
└── custom_code/    # Custom actions/functions
```

### Git Workflow
1. Feature branches from main
2. Test in FlutterFlow preview
3. Export and test locally
4. Deploy to staging
5. Production release

## Troubleshooting Guide

### Common Issues
| Issue | Solution |
|-------|----------|
| Slow event loading | Check pagination, add indexes |
| Payment failures | Verify payment provider config |
| Image upload errors | Check file size limits |
| Navigation bugs | Verify route parameters |

## Future Enhancements

### Phase 2 Features
- [ ] Live event streaming
- [ ] Chat functionality
- [ ] Advanced analytics dashboard
- [ ] Multi-language support
- [ ] Recurring events

### Technical Debt
- [ ] Refactor large widgets
- [ ] Optimize database queries
- [ ] Improve error handling
- [ ] Add comprehensive logging

## Resources & References

### Documentation
- [FlutterFlow Docs](https://docs.flutterflow.io)
- [Supabase Docs](https://supabase.com/docs)
- [Material Design Guidelines](https://material.io/design)

### Support Channels
- FlutterFlow Community
- Supabase Discord
- Project Repository

---
*Last Updated: 2025-08-31*
*Version: 1.0*