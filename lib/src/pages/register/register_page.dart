import 'package:flutter/material.dart';
import 'package:flutter101/src/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Text('Center : ${state.count}');
            },
          ),
        ),
      ),
    );
  }
}
