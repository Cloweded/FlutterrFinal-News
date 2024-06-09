

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proje/constants/parameters.dart';
import 'package:proje/view/bottom_navigate.dart';

import 'package:proje/view/home_routes/news.dart';
import 'package:proje/view/home_routes/news_detail.dart';
import 'package:proje/view/mynews_routes/mynews.dart';
import 'package:proje/view/mynews_routes/mynews_create.dart';

/// The route configuration.
final GoRouter home_router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return News_Screen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return  news_Details(news: cachedData);
          },
        ),
      ],
    ), 
  ],
);



/// The route configuration.
final GoRouter mynews_router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyNews_Screen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'create',
          builder: (BuildContext context, GoRouterState state) {
            return  MyNews_Create_Screen();
          },
        ),
      ],
    ), 
  ],
);