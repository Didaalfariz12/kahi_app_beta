import 'package:ekahi/Screens/Authentication/login.dart';
import 'package:ekahi/Utils/routes.dart';
import 'package:ekahi/Widgets/button.dart';
import 'package:ekahi/Widgets/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm_password = TextEditingController();

  @override
  void dispose() {
    _name.clear();
    _email.clear();
    _password.clear();
    _confirm_password.clear();
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
                      title: 'name*',
                      controller: _name,
                      hint: 'Type your name'),
                  CustomTextField(
                      title: 'email*',
                      controller: _email,
                      hint: 'Type your email'),
                  CustomTextField(
                      title: 'password*',
                      controller: _password,
                      hint: 'Type your password'),
                  CustomTextField(
                      title: 're-password*',
                      controller: _confirm_password,
                      hint: 'Re-type your password'),
                  SizedBox(
                    height: 125,
                  ),
                  CustomButton(
                    text: 'Register',
                    tap: () {},
                    status: false,
                    context: context,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(context: context)
                          .nextPage(page: LoginPage());
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
                        'Login Instead',
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
