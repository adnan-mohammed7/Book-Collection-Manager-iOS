# Book Collection Manager

A fully functional SwiftUI iOS app for managing personal book collections with Core Data persistence. Demonstrates complete CRUD operations, dynamic filtering, and modern navigation patterns built for a college iOS development assignment.

## Features

- **Core Data Integration**: Custom `Book` entity with title, author, publisher, status (To Read/In Progress/Completed), and favorite flag
- **Dynamic List Display**: Searchable book list with real-time filtering by title/author, color-coded status badges, and swipe-to-delete
- **Complete CRUD Operations**: Add new books via form, edit existing ones with validation, toggle favorites with star icons
- **Navigation & Detail**: NavigationStack with detail views, edit sheets, and intuitive + button for new entries

## Tech Stack
- SwiftUI with `@FetchRequest` for reactive Core Data queries
- `@Environment(\.managedObjectContext)` for persistence across views
- `BookStatus` enum with Picker integration and visual status colors
- Searchable modifier and `NavigationStack` for seamless UX

## Screenshots
<img width="402" height="820" alt="image" src="https://github.com/user-attachments/assets/f754ecb9-a771-411b-b337-ea12dbe94171" />
<img width="401" height="818" alt="image" src="https://github.com/user-attachments/assets/31953ffa-fb00-46b5-b438-1f1e01367fb9" />
<img width="378" height="808" alt="image" src="https://github.com/user-attachments/assets/4de2c2b8-49b8-445d-9194-7008b1a562ee" />
<img width="401" height="806" alt="image" src="https://github.com/user-attachments/assets/ad942252-8784-40fe-908f-9c3ca6a684d8" />



## Development Approach
Built modular views with clear separation of concerns—`BookListView` handles display/filtering, `BookEditView` manages forms. Used meaningful naming like `filteredBooks` and `canSave` validation. Handles edge cases like empty searches and Core Data saves with proper error handling per assignment standards.

Run in Xcode simulator—data persists across launches with no external dependencies.
