###### Flutter/Frontend Environment Setup:

1. Install the flutter SDK on your machine (MacOS version here: https://flutter.dev/docs/get-started/install/macos)
2. Unzip the flutter SDK to where you want, and add it to your tool path, use your own location though!: (export PATH="$PATH:`pwd`/flutter/bin")
3. Run flutter doctor in your command line (flutter doctor)
    a. install any missing dependencies
4. Install IntelliJ flutter plugin (Intellij IDEA -> Preferences... -> Plugins -> Marketplace -> search for flutter)
5. Check 'Format code on save' in flutter plugin
6. Install IntelliJ Dart plugin
7. You can start a flutter debug session in chrome by using this command: `flutter run -d chrome`
    a. Alternatively, you can start flutter up through IntelliJ by selecting 'Chrome (web)' in the device dropdown at the top and selecting the main.dart configuration
    b. If you do not see a main.dart configuration, go to 'Edit Configurations' and create one with the dart entrypoint to your main.dart file (/Users/rtoombs/workspace/shields-flutter-poc/frontend/lib/main.dart)

Tips:
- Flutter web supports hot reloading, saving your project should cause changes to be picked up automatically
- Since you cannot debug flutter through the Chrome tools, they've supplied a very robust debugging framework: https://flutter.dev/docs/testing/debugging

###### Quarkus/Backend Environment Setup (Optional unless you want to run the full application):

1. The backend uses the Quarkus framework (an alternative to Spring Boot), so you'll need to install the Quarkus IntelliJ plugin
2. You'll need to install the Kotlin plugin as well if your '.kt' files are not being recognized
3. Additionally, if your backend project is not being correctly recognized, you will need to import the Gradle project (right click the 'backend' directory, and you should see an option along the lines of 'Import Gradle Project')

Tips:
- Quarkus boots up MUCH faster than Spring Boot and supports code hot swapping. You can make backend changes, save your project, and your changes will be picked up automatically.

###### Database

1. I've supplied a simple Postgres 13.2 alpine Dockerfile, follow the Instructions.md in the database directory to get started

