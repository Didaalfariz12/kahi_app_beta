import 'package:ekahi/Providers/AuthProvider/auth_provider.dart';
import 'package:ekahi/Screens/Authentication/register.dart';
import 'package:ekahi/Utils/routes.dart';
import 'package:ekahi/Utils/snack_messages.dart';
import 'package:ekahi/Widgets/button.dart';
import 'package:ekahi/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kahi',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextField(
                      title: 'email*',
                      controller: _email,
                      hint: 'Type your email'),
                  CustomTextField(
                      title: 'password*',
                      controller: _password,
                      hint: 'Type your password'),
                  SizedBox(
                    height: 320,
                  ),
                  Consumer<AuthProvider>(builder: (context, auth, child) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      if (auth.resMessage != '') {
                        showMessage(message: auth.resMessage, context: context);
                        auth.clear();
                      }
                    });
                    return CustomButton(
                      text: 'Login',
                      tap: () {
                        if (_email.text.isEmpty || _password.text.isEmpty) {
                          showMessage(
                            message: 'Fields must be filled',
                            context: context,
                          );
                        } else {
                          auth.loginUser(
                              email: _email.text.trim(),
                              password: _password.text.trim());
                          showMessage(
                            message: 'berhasil login',
                            context: context,
                          );
                        }
                      },
                      status: auth.isLoading,
                      context: context,
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(context: context)
                          .nextPage(page: RegisterPage());
                    },
                    child: Container(
                      height: 48,
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.blueGrey)),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Register Instead',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
