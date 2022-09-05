import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:kidslearning/core/config/routes/app_pages.dart';
import 'app/features/selectegrade/view/selectgrade_view.dart';
import 'core/config/theme/app_basic_theme.dart';
import 'core/config/theme/helper/themeviewmodel.dart';
import 'core/config/translation/helper/l10n.dart';
import 'core/config/translation/messages.dart';
import 'core/config/translation/provider/locale_provider.dart';
import 'core/service/servicelocator.dart';
import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  ServiceLocator
      .init(); // even you can prefer getxservices for singolton dependecy injection but in that case you have to call that after   WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static ThemeViewModel get themeService =>
      ServiceLocator.get<ThemeViewModel>();
  static LocaleProvider get localeService =>
      ServiceLocator.get<LocaleProvider>();
  // This widget is the root of your application. LocaleProvider
  @override
  void initState() {
    //advanced design for theme management and locale management
    super.initState();
    themeService.only_first_run_oninit();
    if (themeService.isAutomatic) {
      themeService.selectThemeAutomatic();
    }
    localeService.onlyFirstTime_oninit();
    if (localeService.isAutomatic) {
      localeService.selectLocaleAutomatic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //even Getx is not required but for simplification we used that
      title: 'Kids Learning', //Change if YOU like
      debugShowCheckedModeBanner: false,
      theme: AppBasicTheme.getThemeDataLight(),
      darkTheme: AppBasicTheme.getThemeDataDark(),
      themeMode: themeService.theme,
      translations: Messages(),
      locale: Locale(localeService.locale),
      supportedLocales: L10n.all,
      fallbackLocale: const Locale('en'),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      getPages: AppPages.routes,
      home: SelectGrade(),

      // localizationsDelegates: [ // TODO add yourselef if you can or leave it
      //  //   // AppLocalizations.delegate,
      //   // GlobalMaterialLocalizations.delegate,
      //   // GlobalCupertinoLocalizations.delegate,
      //   // GlobalWidgetsLocalizations.delegate,
      // ],
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
