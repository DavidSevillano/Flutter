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
            SizedBox(
              height: 100,
              child: Image.asset('images/path_logo.png'),
            ),
            const Text(
              "Beautiful, Private Sharing",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 140),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFE62F16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Already have a Path account?",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 55),
                  backgroundColor: const Color(0xFFE62F16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: const BorderSide(
                    color: Colors.white60,
                    width: 1,
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "By using Path, you agree to Path's\n",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "Terms of Use",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: " and ",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
