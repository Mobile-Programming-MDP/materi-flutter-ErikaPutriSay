import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cepu_app/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (route) => false, //hapus semua route sebelumnya
    );
  }
}

String? _idToken;
String? _uid;
String? _email;
Future<void> getFirebaseAuthUser() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    // _idToken = await user.getIdToken();
    _uid = user.uid;
    _email = user.email;
    await user
        .getIdToken(true)
        .then(
          (v) => {
            setState(() {
              _idToken = v;
            }),
          },
        );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Home Screen"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        IconButton(
          onPressed: () {
            signOut(context);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
    body: Center(
      child: Column(
        children: [
          Text("You have been signed in with Token id: $_idToken"),
          Text("Current User: $_uid"),
          Text("Your email: $_email"),
        ],
      ),
    ),
  );
}
