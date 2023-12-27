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
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kahi',
          style: TextStyle(fontFamily: 'Inter', fontWeight :FontWeight.w700),
        ),
        actions: [IconButton(onPressed: (){ }, icon: Icon(Icons.help))],
        toolbarHeight: 50,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: Column(
                children: [
                  Container(
                      // login7zV (1:340)
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1d1d1d),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        // enteryourregisteredphonenumber (1:341)
                        'Enter your registered phone number to log in',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff484848),
                        ),
                      ),
                    ),
                  CustomTextField(
                      title: 'email',
                      controller: _email,
                      hint: 'Type your email'),
                  CustomTextField(
                      title: 'password',
                      controller: _password,
                      hint: 'Type your password'),
                  SizedBox(
                    height: 390,
                  ),
                  Consumer<AuthProvider>(builder: (context, auth, child) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      if (auth.resMessage != '') {
                        showMessage(message: auth.resMessage, context: context);
                        auth.clear();
                      }
                    });
                    return CustomButton(
                      text: 'Continue',
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
