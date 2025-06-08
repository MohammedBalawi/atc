# Act-Hub-Mobile

ActHub Project is a reservation and course system.

## Getting Started

To get started with the ActHub mobile project, follow these steps:

1. Make sure you have Flutter installed on your machine.
2. Clone the repository: `git clone https://github.com/your-username/Act-Hub-Mobile.git`
3. Navigate to the project directory: `cd act_hub_mobile`
4. Fetch the project dependencies by running the following command:
   - If using Flutter SDK directly: `flutter pub get`
   - If using Flutter Version Manager (FVM): `fvm flutter pub get`
5. If you are using models with the `@JsonSerializable()` annotation, run the following command to generate the necessary serialization code:
   - If using Flutter SDK directly: `flutter pub run build_runner build --delete-conflicting-outputs`
   - If using Flutter Version Manager (FVM): `fvm flutter pub run build_runner build --delete-conflicting-outputs`
6. For create a new feature use this commands `fvm dart command_file_path -f feature_name -n dart_file_name.dart`
   // Ex: `fvm dart lib/core/commands/custom_command.dart -f visit -n visit.dart`
Please ensure that you have the Flutter SDK or FVM installed on your machine before proceeding with the above steps.

## Contributing

We welcome contributions to enhance the ActHub mobile project. To contribute, please follow these steps:

1. Fork the repository on GitHub.
2. Create a new branch with a descriptive name for your feature or bug fix.
3. Make the necessary changes and additions.
4. Commit and push your changes to your forked repository.
5. Submit a pull request, explaining the changes made and their purpose.

## License

The ActHub mobile project is released under the [MIT License](LICENSE).

## Contact

If you have any questions, suggestions, or feedback, please feel free to reach out to our team at [email protected]

Thank you for using ActHub! We hope it helps streamline your reservation and course management.
