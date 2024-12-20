import 'package:get_it/get_it.dart';

import 'core/constants/api_endpoint.dart';

enum Flavor {
  production,
  staging,
  development,
}

/// App configuration for different app flavors.
class AppConfig {
  final String appTitle;
  final String apiBaseUrl;
  final Flavor flavor;

  const AppConfig({
    required this.appTitle,
    required this.apiBaseUrl,
    required this.flavor,
  });
}

class AppConfigProduction extends AppConfig {
  const AppConfigProduction()
      : super(
          appTitle: "Clean Architecture App",
          apiBaseUrl: ApiEndpoint.baseProduction,
          flavor: Flavor.production,
        );
}

class AppConfigStaging extends AppConfig {
  const AppConfigStaging()
      : super(
          appTitle: "Clean Architecture App Staging",
          apiBaseUrl: ApiEndpoint.baseStaging,
          flavor: Flavor.staging,
        );
}

class AppConfigDevelopment extends AppConfig {
  const AppConfigDevelopment()
      : super(
          appTitle: "Clean Architecture App Development",
          apiBaseUrl: ApiEndpoint.baseDevelopment,
          flavor: Flavor.development,
        );
}

/// A util class for accessing [AppConfig]
class AppConfigUtil {
  AppConfigUtil._();

  /// Returns the registered instance of [AppConfig] which is always the same.
  static AppConfig get I => GetIt.I<AppConfig>();
}
