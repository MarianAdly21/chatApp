import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6cbed9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Image.asset(
              'assets/images/login2.webp',
              height: 170,
            ),
            Text(
              "OhSnap",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'pacifico',
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CustomTextWidget(
              hintText: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextWidget(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "REGISTER",
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  ' Login',
                  style: TextStyle(
                    color: Color(0xff4c608e),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
