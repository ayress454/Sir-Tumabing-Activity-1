<<<<<<< HEAD

Pet Grooming Services App
A Flutter mobile application offering pet grooming services.
Project Structure
lib/
├── main.dart                    # App entry point
├── models/                      # Data models
│   └── service.dart            # Service data structure
├── views/                       # Screen widgets  
│   ├── home_screen.dart        # Welcome screen
│   ├── services_screen.dart    # Service catalog
│   ├── hello_world_stateless.dart  # StatelessWidget demo
│   └── hello_world_stateful.dart   # StatefulWidget demo
├── widgets/                     # Reusable components
│   ├── custom_button.dart      # Custom button widget
│   └── service_card.dart       # Service card widget
└── services/                    # Business logic
    └── service_data.dart       # Service data provider
    
Why This Structure?
models/ - Data Layer

Purpose: Defines data structure (Service class)
Benefits: Type safety, single source of truth

views/ - Presentation Layer

Purpose: Complete screens that users see
Benefits: Clear separation between screens and components

widgets/ - Component Layer

Purpose: Reusable UI components used across screens
Benefits: Code reusability, easier maintenance

services/ - Business Logic Layer

Purpose: Data operations and business logic
Benefits: Separates business logic from UI

Widget Tree Diagram
App Widget Hierarchy
MyApp (MaterialApp)
└── MainScreen (StatefulWidget)
    └── Scaffold
        ├── AppBar
        │   └── Text ("Pet Grooming App")
        ├── Drawer
        │   └── ListView
        │       ├── DrawerHeader
        │       └── ListTile (Home & Services)
        ├── Body (2 screens)
        │   ├── HomeScreen
        │   │   └── Column
        │   │       ├── Text (title)
        │   │       ├── Text (description)
        │   │       ├── CustomButton (Stateless Demo)
        │   │       ├── CustomButton (Stateful Demo)
        │   │       └── Text (emoji)
        │   └── ServicesScreen
        │       └── TabBar + TabBarView
        │           ├── Material Design Tab
        │           │   └── MasonryGridView
        │           │       └── ServiceCard (x6)
        │           └── Cupertino Design Tab
        │               └── ListView
        │                   └── CupertinoListTile (x6)
        └── BottomNavigationBar
            ├── Home Tab
            └── Services Tab
Parent-Child Relationships
Container Widgets (Parents)

Scaffold: Main page structure
Column/Row: Arrange children vertically/horizontally
Card: Material design container
ListView: Scrollable list

Content Widgets (Children)

Text: Display text (no children)
Icon: Display icons (no children)
ElevatedButton: Interactive button

Widget Hierarchy Explanation

MyApp: Root widget with Material theme
MainScreen: Manages navigation state
Scaffold: Provides basic layout structure
HomeScreen/ServicesScreen: Content screens
CustomButton/ServiceCard: Reusable components


Before: Long Widget Tree (Bad)
dart// DON'T DO THIS - Too long and hard to maintain
class BadServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Our Services',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(service.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(service.description),
                          SizedBox(height: 12),
                          Text(service.price, style: TextStyle(color: Colors.green)),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => bookService(),
                            child: Text('Book Now'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
After: Refactored (Good)
dart// GOOD - Broken into smaller components
class GoodServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ServicesHeader(),
          Expanded(child: ServicesGrid()),
        ],
      ),
    );
  }
}

class ServicesHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Our Services',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ServicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return ServiceCard(service: services[index]);
      },
    );
  }
}

// ServiceCard is already extracted in your widgets folder!
Benefits of Refactoring
Before (Problems):

Long, hard-to-read code
Cannot reuse components
Difficult to test
Hard to maintain

After (Benefits):

Small, focused widgets
Reusable components
Easy to test individual parts
Easy to maintain and update
=======
# Sir-Tumabing-Activity-1
Activity 1
>>>>>>> 60aaca4d2c039bbbdc68a79963c2b6577000b26e
