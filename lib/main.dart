import 'package:aviatorpredict/bindings/bindings.dart';
import 'package:aviatorpredict/homePage/screens/homescreen.dart';
import 'package:aviatorpredict/routes/routes.dart';
import 'package:aviatorpredict/utils/size-config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: Pages.splashScreen,
        initialBinding: InitialBindings(),
        getPages: Pages.routes,
      );
    });
  }
}
