import 'package:get/get.dart';

import '../../middleware.dart';
import '../modules/departments/department/bindings/department_binding.dart';
import '../modules/departments/department/views/department_view.dart';
import '../modules/departments/department_add/bindings/department_add_binding.dart';
import '../modules/departments/department_add/views/department_add_view.dart';
import '../modules/excuses/excuse/bindings/excuse_binding.dart';
import '../modules/excuses/excuse/views/excuse_view.dart';
import '../modules/excuses/excuses_add/bindings/excuses_add_binding.dart';
import '../modules/excuses/excuses_add/views/excuses_add_view.dart';
import '../modules/excuses/excuses_show/bindings/excuses_show_binding.dart';
import '../modules/excuses/excuses_show/views/excuses_show_view.dart';
import '../modules/excuses/excuses_update/bindings/excuses_update_binding.dart';
import '../modules/excuses/excuses_update/views/excuses_update_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jobTitles/jobTitle/bindings/job_title_binding.dart';
import '../modules/jobTitles/jobTitle/views/job_title_view.dart';
import '../modules/jobTitles/jobTitle_add/bindings/job_title_add_binding.dart';
import '../modules/jobTitles/jobTitle_add/views/job_title_add_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/users/users/bindings/users_list_binding.dart';
import '../modules/users/users/views/users_list_view.dart';
import '../modules/users/users_add/bindings/users_add_binding.dart';
import '../modules/users/users_add/views/users_add_view.dart';
import '../modules/users/users_show/bindings/users_show_binding.dart';
import '../modules/users/users_show/views/users_show_view.dart';
import '../modules/users/users_update/bindings/users_update_binding.dart';
import '../modules/users/users_update/views/users_update_view.dart';
import '../modules/vacations/vacation/bindings/vacation_binding.dart';
import '../modules/vacations/vacation/views/vacation_view.dart';
import '../modules/vacations/vacation_add/bindings/vacation_add_binding.dart';
import '../modules/vacations/vacation_add/views/vacation_add_view.dart';
import '../modules/vacations/vacation_show/bindings/vacation_show_binding.dart';
import '../modules/vacations/vacation_show/views/vacation_show_view.dart';
import '../modules/vacations/vacation_update/bindings/vacation_update_binding.dart';
import '../modules/vacations/vacation_update/views/vacation_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
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
        ),
        GetPage(
          name: "/show",
          page: () => UsersShowView(),
          binding: UsersShowBinding(),
        ),
        GetPage(
          name: "/update",
          page: () => UsersUpdateView(),
          binding: UsersUpdateBinding(),
        ),
      ],
    ),
    GetPage(
      name: '/departments',
      page: () => const DepartmentView(),
      binding: DepartmentBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
      children: [
        GetPage(
          name: '/add',
          page: () => const DepartmentAddView(),
          binding: DepartmentAddBinding(),
        ),
      ],
    ),
    GetPage(
      name: '/jobTitles',
      page: () => const JobTitleView(),
      binding: JobTitleBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
      children: [
        GetPage(
          name: '/add',
          page: () => const JobTitleAddView(),
          binding: JobTitleAddBinding(),
        ),
      ],
    ),
    GetPage(
      name: "/vacation",
      page: () => const VacationView(),
      binding: VacationBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
      children: [
        GetPage(
          name: "/add",
          page: () => const VacationAddView(),
          binding: VacationAddBinding(),
        ),
        GetPage(
          name: "/update",
          page: () => const VacationUpdateView(),
          binding: VacationUpdateBinding(),
        ),
        GetPage(
          name: "/show",
          page: () => const VacationShowView(),
          binding: VacationShowBinding(),
        ),
      ],
    ),
    GetPage(
      name: "/excuses",
      page: () => const ExcuseView(),
      binding: ExcuseBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
      children: [
        GetPage(
          name: "/update",
          page: () => const ExcusesUpdateView(),
          binding: ExcusesUpdateBinding(),
        ),
        GetPage(
          name: "/show",
          page: () => const ExcusesShowView(),
          binding: ExcusesShowBinding(),
        ),
        GetPage(
          name: "/add",
          page: () => const ExcusesAddView(),
          binding: ExcusesAddBinding(),
        ),
      ],
    ),
  ];
}
