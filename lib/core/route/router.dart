import 'package:auto_route/auto_route_annotations.dart';

import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/login/screens/login_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  LoginScreen loginScreen;
  DashboardScreen dashboardScreen;
}
