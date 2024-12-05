import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE62F16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign up'),
            ),
            Text("Already have a Path account"),
            Container(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text('Log in'),
            )),
            Text(
                "By using Path, you agree to Path's Terms of Use and Privacy Policy")
          ],
        ),
      ),
    );
  }
}
