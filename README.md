# demo_to_do_list

### 1. Project structure

1.1 - App:
- lib/app: The entry point of the app where we initialize the required data and services (.env, 3rd party services…)
- lib/assets: The folder contains the app's resources (images, icons, fonts,...)
- lib/l10n: This directory will have the “arb” files for the locales supported in your app (intl_en.arb,...)
- lib/repository: A repository directory is a place that decouples the data access logic from the business logic.
Here are a few use cases where the repository is most appropriate: Talking to REST APIs, talking to local or remote databases (e.g. Sqflite, Firestore, etc.), talking to device-specific APIs (e.g. permissions, camera, location, etc.)
- lib/pages: Represents only the UI of the page. The View builds the page's UI, styles it, and depends on the Store (Mobx) to handle its events.
- lib/router: To define the routing for the app, navigation between different screens.
- lib/store: This directory contains the Store files (Mobx) to manage the states of the app. Connecting to the UI 
- lib/theme: To share colors and font styles throughout an app, and define the dimensions (width, height, padding, margin,...)
- lib/utils: This is a place where can place small snippets can use throughout the application.
- lib/widgets: To place the custom widgets that are common or reused in the app.

1.2 - Test
- demo_to_do_list/integration_test: contains the integration test files.
- demo_to_do_list/test: contains the unit test files.

### 2. Prerequisites

- Flutter version: Channel stable - 3.7.1

- Install the plugin: [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl)

- Generate the code

```
flutter packages pub run build_runner build
```

or

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

### 3. Steps to run app

3.1 - Install Flutter SDK: If you haven't already, download and install the Flutter SDK from the official website https://flutter.dev/docs/get-started/install. Follow the instructions to set up the Flutter SDK on your machine.

3.2 - Install an IDE: You can use any IDE you choose to develop Flutter apps, such as Android Studio, Visual Studio Code, or IntelliJ IDEA. Install the IDE on your machine and follow the instructions to set it up for Flutter development.

3.3 - Open the existing project: Open the IDE and navigate to "File" > "Open," and select the directory that contains your Flutter project.

3.4 - Install dependencies: To run your project, you may need to install its dependencies. To do so, navigate to the project's root directory in your terminal or command prompt and run the command flutter pub get.

3.5 - Configure your device: Connect your device to your machine or set up an emulator or simulator. Make sure that the IDE recognizes your device.

3.6 - Run the app: Once your device is connected, you can run your Flutter app by clicking the "Run" button in your IDE. The app should be compiled and deployed to your device.

### 4. Steps to run test

4.1 - Run unit test: To run unit tests, open a terminal or command prompt and navigate to Todo project's root directory. Then, run the command flutter test to run all of the tests in the "test/directory".

```
flutter test
```

4.2 - Run integration test: To test on a real iOS/Android device, first connect the device and run the following command from the root of the project:

```
flutter test integration_test/app_test.dart
```

### 5. Demo

5.1 - Demo Todo App
[![Demo Todo App](https://i.ytimg.com/vi/cby823Nt3ZQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=cby823Nt3ZQ "Demo Todo App")

5.2 - Demo Run App and Test
[![Demo Run App and Test](https://i.ytimg.com/vi/QlLwSf-YjHk/maxresdefault.jpg)](https://www.youtube.com/watch?v=QlLwSf-YjHk "Demo Run App and Test")
