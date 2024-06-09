import 'dart:async';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:proje/constants/parameters.dart';
import 'package:proje/controllers/routes.dart';
import 'package:proje/services/news_api.dart';
import 'package:proje/view/bottom_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proje/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  getNews();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration.zero, (timer) {
      setState(() {
        themeIsLight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Proje",
      locale: Locale("tr"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var boarding;

  @override
  void initState() {
    // TODO: implement initState

    Timer.periodic(Duration.zero, (timer) {
      setState(() {
        themeIsLight;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeIsLight ? ThemeData.light() : ThemeData.dark(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: EasySplashScreen(
        logo: Image.network(
            'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
        title: Text(
          "",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade400,
        showLoader: true,
        navigator: boarding == true ? Bottom_Navigate() : Container(),
        durationInSeconds: 3,
      ),
    );
  }
}
