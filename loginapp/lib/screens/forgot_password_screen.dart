import 'package:flutter/material.dart';
import 'package:loginapp/constant.dart';
import '../widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/images/forgot_password.gif',
                  ),
                ),
                Text(
                  'Lấy lại',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: kDarkBlue,
                  ),
                ),
                Text(
                  'Mật khẩu?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: kDarkBlue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Đừng lo lắng! Có lỗi xảy ra. Vui lòng nhập địa chỉ được liên kết với tài khoản của bạn.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: kGreyBlue,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  hintText: 'Email ID / Mobile number',
                  prefixIcon: Icon(Icons.alternate_email, color: kGreyBlue),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
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
                      'Gửi',
                      style: TextStyle(fontSize: 16),
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
