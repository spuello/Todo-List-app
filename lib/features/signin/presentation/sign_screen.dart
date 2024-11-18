import 'package:flutter/material.dart';
import 'package:todo/features/todo/todo_list_screen.dart';

import '../../../theme/app_colors.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = 'sign_screen';

  const SignInScreen();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final FocusNode _passwordNode;
  late final TextEditingController _emailController;
  late final TextEditingController __passwordController;
  bool _isPasswordObscured = true;

  @override
  void initState() {
    _passwordNode = FocusNode();
    _emailController = TextEditingController();
    __passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: MediaQuery.of(context).size.height / 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.task_alt_outlined,
                  size: 80.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(letterSpacing: 2.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome Back 👋\n',
                        ),
                        TextSpan(
                          text: 'to ',
                        ),
                        TextSpan(
                          text: 'Quick Task',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: 2.0,
                                  height: 0.60),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Hello there, login to continue",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.grayACAFB5,
                        fontSize: 20.0),
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: "Email"),
                          onEditingComplete: () {
                            _passwordNode.requestFocus();
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 34),
                        child: TextFormField(
                          focusNode: _passwordNode,
                          controller: __passwordController,
                          obscureText: _isPasswordObscured,
                          decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.gray292D32,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordObscured = !_isPasswordObscured;
                                  });
                                },
                              )),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            print(_emailController.text);
                            print(__passwordController.text);

                            Navigator.pushNamed(
                                context, TodoListScreen.routeName);

                            // //TODO: UNCOMMENT THIS
                            // Navigator.pushNamedAndRemoveUntil(context,
                            //     TodoListScreen.routeName, (_) => false);
                          },
                          child: Text("Sign In"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    _emailController.dispose();
    __passwordController.dispose();
    super.dispose();
  }
}
