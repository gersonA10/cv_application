import 'package:cv_application/pages/certificaciones_page.dart';
import 'package:cv_application/pages/detail_page.dart';
import 'package:cv_application/pages/estudios_page.dart';
import 'package:cv_application/pages/skills_programming.dart';
import 'package:cv_application/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {

    runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerson CV',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          'detail_home': (context) => const DetailHomePage(),
          'detail': (context) => const DetailPage(),
          'certificaciones': (context) => const CertificacionesPage(),
          'estudios': (context) => const EstudiosPage(),
          'intereses': (context) => const DetailPage(),
          'idiomas': (context) => const DetailPage(),
          'skills_general': (context) => const DetailPage(),
          'skills_programming': (context) => const DetailHomePage(),
          'personalidad': (context) => const DetailPage(),
        },
        theme: ThemeData(
          // useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
            elevation: 0,
          ),
        )
        //theme: ThemeData(primarySwatch: Colors.white),
        );
  }
}
