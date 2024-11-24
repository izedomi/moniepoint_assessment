import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/core/constants/font_family.dart';
import 'package:moniepoint/core/routes/router.dart';
import 'package:moniepoint/core/routes/routes.dart';
import 'package:moniepoint/core/utils/app_init_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 845.33),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Real Estate',
          theme: ThemeData(
              useMaterial3: false,
              primarySwatch: Colors.amber,
              fontFamily: FontFamily.euclid),
          home: child,
          initialRoute: AppRoute.splash,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
