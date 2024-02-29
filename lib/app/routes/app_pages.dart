import 'package:get/get.dart';

import '../../middleware.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifaction/bindings/notifaction_binding.dart';
import '../modules/notifaction/views/notifaction_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/userProfile/bindings/user_profile_binding.dart';
import '../modules/userProfile/views/user_profile_view.dart';
import '../modules/users/users_add/bindings/users_add_binding.dart';
import '../modules/users/users_add/views/users_add_view.dart';
import '../modules/users/users/bindings/users_list_binding.dart';
import '../modules/users/users/views/users_list_view.dart';
import '../modules/users/users_show/bindings/users_show_binding.dart';
import '../modules/users/users_show/views/users_show_view.dart';
import '../modules/users/users_update/bindings/users_update_binding.dart';
import '../modules/users/users_update/views/users_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      participatesInRootNavigator: true,
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [GlobalMiddleware()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [],
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      middlewares: [],
    ),
    GetPage(
      name: _Paths.NOTIFACTION,
      page: () => const NotifactionView(),
      binding: NotifactionBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: '/users',
      page: () => const UsersListView(),
      binding: UsersListBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
      children: [
        GetPage(
          name: '/add',
          page: () => UsersAddView(),
          binding: UsersAddBinding(),
          middlewares: [
            GlobalMiddleware(),
          ],
        ),
        GetPage(
          name: "/show",
          page: () => UsersShowView(),
          binding: UsersShowBinding(),
          middlewares: [
            GlobalMiddleware(),
          ],
        ),
        GetPage(
          name: "/update",
          page: () => UsersUpdateView(),
          binding: UsersUpdateBinding(),
          middlewares: [
            GlobalMiddleware(),
          ],
        ),
      ],
    ),
  ];
}
