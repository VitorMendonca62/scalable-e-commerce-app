import 'package:go_router/go_router.dart';

import 'auth_routes.dart';
import 'route_names.dart';

final class AppRouter {
  static final router = GoRouter(
    initialLocation: RouteNames.login,

    routes: [...authRoutes],
  );
}
