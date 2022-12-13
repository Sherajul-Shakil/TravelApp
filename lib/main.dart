import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travel_app_master/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.openBox("user");
  Hive.init(dir.path);
  // await di.init();
  // runApp(MultiProvider(providers: [
  //   ChangeNotifierProvider(create: ((context) => Hotelprovider())),
  //   ChangeNotifierProvider(create: ((context) => Locationprovider())),
  //   ChangeNotifierProvider(create: ((context) => PagecontrollProvider())),
  // ], child: MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel App',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
      // box.get('token') == null ? SplashScreen() : NavigationScreen(),
    );
  }
}
