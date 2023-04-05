import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';
import 'package:loginapp/provider/email_sign_in.dart';
import 'package:loginapp/provider/google_sign_in.dart';
import 'package:loginapp/screens/forgot_password_screen.dart';
import 'package:loginapp/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 250,
                    child: Image.asset(
                      'assets/images/login.gif',
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: kDarkBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.alternate_email, color: kGreyBlue),
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password, color: kGreyBlue),
                      obscureText: obscureText,
                      suffixIcon: InkWell(
                        child: Icon(
                          obscureText == true ? Icons.visibility : Icons.visibility_off,
                          color: kGreyBlue,
                        ),
                        onTap: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(fontSize: 16, color: kBlue),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: loginUser,
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
                          'Đăng nhập',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'hoặc',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                      ],
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final provider =
                              Provider.of<GoogleSignInProvider>(context, listen: false);
                          provider.googleLogin();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const HomePage()),
                          // );
                        },
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll<double>(0),
                          backgroundColor: MaterialStatePropertyAll(kGreyLight),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        icon: Image.asset(
                          'assets/images/google_icon.png',
                          scale: 2,
                        ),
                        label: Center(
                          child: Text(
                            'Đăng nhập bằng google',
                            style: TextStyle(
                              fontSize: 16,
                              color: kDarkBlue,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: kDarkBlue,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Tạo một tài khoản mới? ',
                        ),
                        TextSpan(
                          text: 'Đăng ký',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kBlue,
                          ),
                        ),
                      ],
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
