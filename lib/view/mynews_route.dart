import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proje/constants/parameters.dart';
import 'package:proje/controllers/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proje/generated/l10n.dart';


class Mynews_Route extends StatefulWidget {
  const Mynews_Route({super.key});

  @override
  State<Mynews_Route> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Mynews_Route> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme:themeIsLight? ThemeData.light() : ThemeData.dark(),
       localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
     routerConfig: mynews_router,
    );
  }
}