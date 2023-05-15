import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/provider/google_sign_in.dart';
import 'package:loginapp/constant.dart';


class LoggedInWidget extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  LoggedInWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBG,
        title: const Text('Tài khoản', style: TextStyle(color: Colors.black),),
        
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
            },
            child: const Text(
              'Đăng xuất',
               style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(255, 86, 99, 106),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Thông tin cá nhân',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoURL! ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Name: ${user.displayName!}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Email: ${user.email!}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ]),
      ),
    );
  }
}
