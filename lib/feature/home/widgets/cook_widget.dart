import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/widgets/custom_raised_button.dart';

class CookWidget extends StatefulWidget {
  const CookWidget({super.key});

  @override
  State<CookWidget> createState() => _CookWidgetState();
}

class _CookWidgetState extends State<CookWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get yours today!',
                  style: TextStyle(
                      fontFamily: 'PetitFormalScript',
                      fontSize: 19,
                      fontWeight: FontWeight.w300),
                ),
                const Gap(12),
                SizedBox(
                  width: size.width * 0.4,
                  child: const Text(
                    'Freshly baked and can be deliver at you door with love and joy, anytime, anywhere. With love.',
                    style: TextStyle(fontFamily: 'petrona'),
                  ),
                ),
                const Gap(12),
                const CustomRaisedButton(
                    isButton: false, label: 'See whats new!'),
              ],
            ),
            Image.asset(
              'assets/images/cookie.png',
              fit: BoxFit.contain,
              scale: 7,
            ),
          ],
        ),
      ),
    );
  }
}
