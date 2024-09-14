import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../config/routes/routes.dart';
import '../../../config/routes/routes.gr.dart';

part 'navigation_data.dart';

class NavigationService {
  final AppRouter _appRouter = AppRouter();

  /// A delegate that configures a widget, typically a [Navigator]
  RouterDelegate<Object>? get routerDelegate => _appRouter.delegate();

  /// A delegate to parse the route information
  RouteInformationParser<Object>? get routeInformationParser =>
      _appRouter.defaultRouteParser();

  /// Get Navigator key from auto router
  GlobalKey<NavigatorState> get navigatorKey => _appRouter.navigatorKey;

  /// Removes the top most page from the stack
  Future popPage<T extends Object?>([T? result]) async =>
      await _appRouter.maybePopTop(result);

  /// Replace all previous routes the new route
  replaceRoute(String path, {dynamic argument}) async {
    try {
      PageRouteInfo<dynamic>? route = _getRoute(path, argument: argument);
      return await _appRouter.replaceAll([route!]);
    } catch (error) {
      if (kDebugMode) log(error.toString());
    }
  }

  /// Adds the corresponding page to the given route
  pushRoute(String path, {dynamic argument}) async {
    try {
      PageRouteInfo<dynamic>? route = _getRoute(path, argument: argument);
      return await _appRouter.push(route!);
    } catch (error) {
      if (kDebugMode) log(error.toString());
    }
  }

  PageRouteInfo<dynamic>? _getRoute(String path, {dynamic argument}) {
    switch (path) {
      case LOGIN_PATH:
        return const LoginRoute();

      case DASHBOARD_PATH:
        return const HomeRoute();

      case HOME_PATH:
        return const HomeRoute();

      case SETTING_PATH:
        return const SettingRoute();

      default:
        return null;
    }
  }
}

/// A util class for accessing [NavigationService]
class NavigationUtil {
  NavigationUtil._();

  /// Returns the registered instance of [NavigationService] which is always the same
  static NavigationService get I => GetIt.I<NavigationService>();
}