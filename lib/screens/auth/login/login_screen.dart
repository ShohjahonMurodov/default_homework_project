import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/auth/auth_bloc.dart';
import 'package:homework/bloc/auth/auth_state.dart';
import 'package:homework/screens/auth/register/register_screen.dart';
import 'package:homework/screens/auth/widgets/ok_button.dart';
import 'package:homework/screens/auth/widgets/text_input.dart';
import 'package:homework/screens/contacts/contact_screen.dart';
import 'package:homework/utils/size_utils.dart';

import '../../../bloc/auth/auth_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state is AuthInitialState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  50.getH(),
                  Image.asset("assets/images/img.png", width: 240.w),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextInputMyWidget(
                    hitText: 'Enter email',
                    textEditingController: emailController,
                  ),
                  TextInputMyWidget(
                    hitText: 'Enter password',
                    textEditingController: passwordController,
                  ),
                  30.getH(),
                  OkButton(
                    title: 'LOGIN',
                    onTab: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<AuthBloc>().add(
                              AuthLoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      } else {
                        _showSnackBar();
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (BuildContext context, AuthState state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  _showSnackBar({String title = "Empty input"}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
      ),
    );
  }
}
