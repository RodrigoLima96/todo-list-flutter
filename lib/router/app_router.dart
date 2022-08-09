import 'package:flutter/material.dart';
import 'package:todo_list/pages/home/home_page.dart';
import 'package:todo_list/pages/recycle_bin/recycle_bin_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinPage.id:
        return MaterialPageRoute(builder: (_) => const RecycleBinPage());
      case HomePage.id:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
