import 'package:flutter/material.dart';
import 'package:flutter101/src/bloc/login/login_bloc.dart';
import 'package:flutter101/src/models/user.dart';
import 'package:flutter101/src/pages/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override //method
  void initState() {
    super.initState();
    _usernameController.text;
    _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: BlocBuilder<LoginBloc, LoginState>(
        //   builder: (context, state) {
        //     return Text('Login : ${state.count}');
        //   },
        // ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        //padding ปรับขนาด columnwidget
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.tealAccent, Colors.teal],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            padding: const EdgeInsets.all(30.0),
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ..._buildTextField(),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Text(
                      'Result :${state.isAutthencation ? "successs " : "error"}',
                      style: TextStyle(
                          color: state.isAutthencation
                              ? Colors.green
                              : Colors.red),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ..._builtButton(),
                Row(
                    // children: [
                    //   // BlocBuilder<LoginBloc, LoginState>(
                    //   //   builder: (context, state) {
                    //   //     return Text('Debud :${state.count}');
                    //   //   },
                    //   // ),
                    //   // IconButton(
                    //   //   onPressed: () =>
                    //   //       context.read<LoginBloc>().add(LoginEventAdd()),
                    //   //   icon: Icon(Icons.add),
                    //   // ),
                    //   // IconButton(
                    //   //   onPressed: () =>
                    //   //       context.read<LoginBloc>().add(LoginEventRemove()),
                    //   //   icon: Icon(Icons.remove),
                    //   // ),
                    // ],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    //logic in bloc
    //get data when eventclick => bloc =>state =>ui
    final user = User(
        username: _usernameController.text, password: _passwordController.text);
    context.read<LoginBloc>().add(LoginEventLogin(user));
  }

  void _handleClickReset() {
    //clear text in textField
    _passwordController.clear();
    _usernameController.clear();
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  _builtButton() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: const Text('Login'),
      ),
      ElevatedButton(
        onPressed: _handleClickReset,
        child: const Text('Reset'),
      ),
      // ElevatedButton(
      //   onPressed: _handleClickRegister,
      //   child: const Text('Registor'),
      // ),
    ];
  }

  _buildTextField() {
    return [
      TextField(
        controller: _usernameController,
        decoration: const InputDecoration(labelText: 'Username'),
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(labelText: 'Password'),
      ),
    ];
  }
}
