import 'package:deli_sol_task/view/sign_in_view.dart';
import 'package:deli_sol_task/view/sign_up_view.dart';
import 'package:deli_sol_task/view/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

// whenever your initialization is completed, remove the splash screen:
// FlutterNativeSplash.remove();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),

      routes: {
        SignInView.routeName: (context) => SignInView(),
        SignUpView.routeName: (context) => SignUpView(),
        TaskView.routeName : (context) => TaskView()
      },
      home: SignInView(),
    );
  }
}

