# demo_to_do_list

### 1. How to generate code

- Generate the code then terminate (don't watch the changes real time).

```
flutter packages pub run build_runner build
```

- Generate the code and stay watching the changes real time, when there is a change, re-generate new
  code.

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

### 2. Localization

- You have to install the
  plugin: [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl )
- Declare texts under `lib/l10n/intl_en.arb`. Every time you change the texts under this file and
  save, above plugin will run automatically to generate new code.
- How to use localized texts:

```
// yourKey is the key you defined in intl_en.arb
Text(S.of(context).yourKey);
```

- If you want to add new language, just create new .arb file under lib/l10n/ folder. The file name
  is `intl_{countrycode}.arb`.

### 3. Troubleshooting

3.1 - Can not generate .g.dart (stores)

- If in the store, there is an import for graphql: `package:graphql/client.dart`, we must hide Store
  in graphql

```
import 'package:graphql/client.dart' hide Store;
```

3.2 - Can not generate localization files

- Make sure you installed flutter-intl plugin in your IDE

VSCode: https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl

Android Studio/IntelliJ: https://plugins.jetbrains.com/plugin/13666-flutter-intl

- Run below command to generate code:

```
flutter pub global run intl_utils:generate
```

/// We are using auto code generation to generate code for MobX store. /// If we see any error with
.g.dart file, try to run below command. /// The 3rd command is recommended. /// /// 1. Build (
generate .g.dart):
/// flutter packages pub run build_runner build /// 2. Build and Watch (update .g.dart
automatically):and the /// flutter packages pub run build_runner watch /// 3. Clean before updating:
/// flutter packages pub run build_runner watch --delete-conflicting-outputs

### 4. Step to run Todo App:

4.1 - Download the Todo source code on GitHub (develop branch).

4.2 - Open the source in IDE (Android studio or VS code)

4.3 - Open the terminal and type:

a. To get all packages:

```
flutter packages get
```

b. To generate the code:

```
flutter packages pub run build_runner build
```

4.4 - Run app:

```
flutter run
```