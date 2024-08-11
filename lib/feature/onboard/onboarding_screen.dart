import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/auth/login_screen.dart';


import 'package:practice/widgets/custom_raised_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'assets/images/cupcake.png',
        ),
        const Gap(20),
        const Text(
          'START YOUR DAY WITH SOMETHING DELICIOUS!',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const Gap(20),
        GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(
                        // route: 'COOKIES',
                        ),
                  ));
            },
            child: const CustomRaisedButton(
                isButton: true, label: 'Explore more')),
      ]),
    );
  }
}
