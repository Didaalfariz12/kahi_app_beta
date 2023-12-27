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
        actions: [IconButton(onPressed: (){ }, icon: Icon(Icons.help))],
        toolbarHeight: 50,
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
                    height: 310,
                  ),
                  CustomButton(
                    text: 'Continue',
                    tap: () {},
                    status: false,
                    context: context,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
