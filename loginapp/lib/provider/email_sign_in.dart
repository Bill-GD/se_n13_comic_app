import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  // Email sign up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
    required String photoUrl,
    required BuildContext context,
  }) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.updatePhotoURL(photoUrl);
        // ignore: use_build_context_synchronously
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, 'Email hoặc Username đã tồn tại');
    }
  }

  //Đăng nhập bằng email
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
      showSnackBar(context, 'Đăng nhập thành công');
    } on FirebaseException catch (e) {
      showSnackBar(context, 'Tài khoản hoặc mật khẩu đã tồn tại');
    }
  }

  // xác thực email
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Gửi email xác thực!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      // Đăng xuất tài khoản Google
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      // Đăng xuất tài khoản Firebase Authentication
      await _auth.signOut();
      
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, 'Có lỗi xảy ra khi đăng xuất');
    }
  }
  // // Đăng xuất email
  // Future<void> signOut(BuildContext context) async {
  //   try {
  //     await _auth.signOut();
  //     // TODO: Điều hướng đến trang đăng nhập hoặc trang khác tùy ý
  //   } on FirebaseAuthException catch (e) {
  //     showSnackBar(context, 'Có lỗi xảy ra khi đăng xuất');
  //   }
  // }
}
