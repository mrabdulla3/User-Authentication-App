import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'signin_page.dart';
import 'signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login/Signup UI',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: isLogin ? SignInPage() : SignUpPage(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: Text(
            isLogin
                ? "Don't have an account? Sign Up"
                : "Already have an account? Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
