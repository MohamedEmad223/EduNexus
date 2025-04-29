import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/networking/dio_handler.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/widgets/bottom_navigaton_bar.dart';
import 'package:edunexus/feature/auth/login/cubit/cubit/login_cubit.dart';
import 'package:edunexus/feature/auth/login/data/repo/login_repository.dart';
import 'package:edunexus/feature/auth/login/views/screens/login_screen.dart';
import 'package:edunexus/feature/auth/register/cubit/cubit/signup_cubit.dart';
import 'package:edunexus/feature/auth/register/data/repo/sign_up_repository.dart';
import 'package:edunexus/feature/auth/register/presentation/screens/register_screen.dart';
import 'package:edunexus/feature/cart/presentation/screens/cart_screen.dart';
import 'package:edunexus/feature/chat/presentaion/screens/chat_screen.dart';
import 'package:edunexus/feature/course_playing/presentation/screens/course_playing_screen.dart';
import 'package:edunexus/feature/courses/views/screens/course_details.dart';
import 'package:edunexus/feature/courses/views/screens/courses_screen.dart';
import 'package:edunexus/feature/edit_profile/cubit/cubit/updateuser_cubit.dart';
import 'package:edunexus/feature/edit_profile/data/repos/update_user_repository.dart';
import 'package:edunexus/feature/edit_profile/presentation/screens/edit_peofile_screen.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:edunexus/feature/home/data/repos/all_courses_repo.dart';
import 'package:edunexus/feature/home/view/screens/home_screen.dart';
import 'package:edunexus/feature/leaderboard/presentation/screens/leader_board_screen.dart';
import 'package:edunexus/feature/notification/presentation/screens/notificatios_screen.dart';
import 'package:edunexus/feature/on_boarding/view/on_boarding.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:edunexus/feature/questions/presentation/screens/questions_screen.dart';
import 'package:edunexus/feature/result/presentation/screens/result_screen.dart';
import 'package:edunexus/feature/settings/views/screens/settings_screen.dart';
import 'package:edunexus/feature/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);
}

class AppRoutes {
  Route? generateRoute(RouteSettings routeSettings) {
    DioHandler dioHandler = DioHandler();
    // ignore: unused_local_variable
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.login:
        return CustomPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(LoginRepository(dioHandler)),
                child: const LoginScreen(),
              ),
        );
      case Routes.register:
        return CustomPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => SignupCubit(SignUpRepository(dioHandler)),
                child: const RegisterScreen(),
              ),
        );
      case Routes.home:
        return CustomPageRoute(builder: (context) => const HomeScreen());
      case Routes.settings:
        return CustomPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        UpdateuserCubit(UpdateUserRepository(dioHandler)),
                child: const SettingsScreen(),
              ),
        );
      case Routes.cart:
        return CustomPageRoute(builder: (context) => const CartScreen());
      case Routes.botNavBar:
        return CustomPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            HomeCubit(AllCoursesRepo(dioHandler))
                              ..getAllCourses(AppConstants.getAllCourses),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            UpdateuserCubit(UpdateUserRepository(dioHandler)),
                  ),
                ],
                child: const BottomNavBar(),
              ),
        );
      case Routes.course:
        return CustomPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => HomeCubit(AllCoursesRepo(dioHandler)),
                child: const CoursesScreen(),
              ),
        );
      case Routes.courseDetails:
        final course = routeSettings.arguments as AllCoursesModel;
        return CustomPageRoute(
          builder:
              (context) => BlocProvider.value(
                value: BlocProvider.of<HomeCubit>(context),
                child: CourseDetails(allCoursesModel: course),
              ),
        );

      case Routes.leaderBoard:
        return CustomPageRoute(builder: (context) => const LeaderBoardScreen());
      case Routes.resultScreen:
        return CustomPageRoute(builder: (context) => const ResultScreen());
      case Routes.notificationScreen:
        return CustomPageRoute(
          builder: (context) => const NotificatiosScreen(),
        );
      case Routes.editProfileScreen:
        return CustomPageRoute(
          builder:
              (context) => BlocProvider(
                create:
                    (context) =>
                        UpdateuserCubit(UpdateUserRepository(dioHandler)),
                child: const EditProfileScreen(),
              ),
        );

      case Routes.questoinScreen:
        return CustomPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => QuizCubit(),
                child: const QuestionsScreen(),
              ),
        );
      case Routes.chatScreen:
        return CustomPageRoute(builder: (context) => const ChatScreen());
      case Routes.coursePlaying:
        return CustomPageRoute(builder: (context) => CoursePlayingScreen());
    }
    return null;
  }
}
