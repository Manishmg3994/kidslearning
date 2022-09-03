import 'package:get/get.dart';


import '../../../app/features/explore/view/explorevideos_view.dart';
import '../../../app/features/home/view/home_screen.dart';
import '../../../app/features/selectegrade/view/selectgrade_view.dart';
import '../../../app/features/videoplay/view/yt_video.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.selectGrade; //
  static final routes = [
    GetPage(
      name: _Path.selectGrade,
      page: () => const SelectGrade(),
    ),
    GetPage(
      name: _Path.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: _Path.exploreVideos,
      page: () => ExploreVideos(),
    ),
    GetPage(
      name: _Path.videoView,
      page: () => const VideoYT(),
    ), //we will import that letter after creating (will be back here soon)
    // GetPage(
    //   name: _Path.login,
    //   page: () => const LoginScreen(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //     name: _Path.register,
    //     page: () => const RegistrationScreen(),
    //     binding: RegistrationBinding()),
    //        GetPage(
    //     name: _Path.authentication,
    //     page: () => const AuthenticationScreen(),
    //     binding: AuthenticationBinding()),
    //       GetPage(
    //     name: _Path.home,
    //     page: () => const Home(),

    //     ),
  ];
}
