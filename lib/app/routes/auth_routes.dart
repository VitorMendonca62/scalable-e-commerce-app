import 'package:go_router/go_router.dart';
import 'package:scalable_e_commerce_app/app/routes/route_names.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/pages/login_page.dart';

final List<RouteBase> authRoutes = [
  GoRoute(
    path: RouteNames.login,
    name: 'login',
    builder: (context, state) => LoginPage(),
  ),
];
