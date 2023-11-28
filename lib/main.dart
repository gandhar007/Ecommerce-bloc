import 'package:ecommerce_project/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_project/config/app_router.dart';
import 'package:ecommerce_project/config/theme.dart';
import 'package:ecommerce_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
