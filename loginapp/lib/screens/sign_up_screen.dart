import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/provider/email_sign_in.dart';
import 'package:loginapp/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 250,
                    child: Image.asset(
                      'assets/images/sign_up.gif',
                    ),
                  ),
                ),
                Text(
                  'Đăng ký',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: kDarkBlue,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email ID',
                  prefixIcon: Icon(Icons.alternate_email, color: kGreyBlue),
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person, color: kGreyBlue),
                  obscureText: false,
                  keyboardType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password, color: kGreyBlue),
                  obscureText: false,
                  keyboardType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Bằng cách đăng ký, bạn đồng ý với',
                    style: TextStyle(color: kDarkBlue),
                    children: [
                      TextSpan(
                        text: ' Điều khoản & Điều kiện',
                        style: TextStyle(color: kBlue),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: ' và',
                        style: TextStyle(color: kDarkBlue),
                      ),
                      TextSpan(
                        text: ' Chính sách bảo mật',
                        style: TextStyle(
                          color: kBlue,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: ' của chúng tôi',
                        style: TextStyle(color: kDarkBlue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: signUpUser,
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll<double>(0),
                          backgroundColor: MaterialStatePropertyAll(kBlue),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Tiếp tục',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Tham gia ngay bây giờ? ',
                        style: TextStyle(
                          color: kDarkBlue,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Đăng nhập',
                            style: TextStyle(
                              color: kBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
