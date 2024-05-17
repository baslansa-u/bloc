import 'package:flutter/material.dart';
import 'package:flutter101/src/bloc/brand/brand_bloc.dart';
import 'package:flutter101/src/bloc/login/login_bloc.dart';
import 'package:flutter101/src/pages/login/login_page.dart';
import 'package:flutter101/src/pages/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());

    return MultiBlocProvider(
      providers: [
        loginBloc,
        BlocProvider<BrandBloc>(create: (context) => BrandBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loading',
        routes: AppRoute.all,
        navigatorKey: navigatorState,
        home: const LoginPage(),
      ),
    );
  }
}
