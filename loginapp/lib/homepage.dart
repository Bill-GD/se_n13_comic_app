import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/main_screen/home.dart';
import 'screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const Home();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              return const LoginScreen();
            }
          },
        ),
      );
}
