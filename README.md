# SharedPrefsService - Flutter Shared Preferences Handler

This Flutter project provides a reusable service class, `SharedPrefsService`, to handle shared preferences operations. This class simplifies the process of storing and retrieving data using the `shared_preferences` package.

## Features

- **Data Storage**: Supports saving different data types, including strings, integers, doubles, and booleans.
- **Dynamic Data Handling**: Allows storing and retrieving maps and lists of maps as JSON strings.
- **Date Management**: Provides methods to save and retrieve the last updated time in a formatted string.
- **Data Deletion**: Supports deleting specific keys or clearing all stored data.

## Getting Started

### Prerequisites

Ensure you have Flutter installed and set up on your machine. You will also need to include the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.3.2
```
## Installation
Clone the repository or copy the SharedPrefsService class into your Flutter project.
Initialize shared preferences in your main application file:
```
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.sharedPrefInit();
  runApp(MyApp());
}
```

## Notice 
The `SharedPrefsService` class includes detailed comments for each method to make it easy to understand and use. You can also modify the class as needed to suit your specific requirements.

## Contact

For any questions or feedback, please reach out via email: [gcfjxvkj@gmail.com](gcfjxvkj@gmail.com)
