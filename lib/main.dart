import 'package:firebase_core/firebase_core.dart';
import 'package:firstcry/res/theme/theme.dart';
import 'package:firstcry/utils/routes/route.dart';
import 'package:firstcry/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'First Cry',
      theme: KTheme().theme,
      initialRoute: KRoutesName.splash,
      onGenerateRoute: KRoute.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
