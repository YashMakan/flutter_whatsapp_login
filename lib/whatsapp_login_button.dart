import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WhatsAppLoginButton extends StatelessWidget {
  final Function() onTap;

  const WhatsAppLoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Ink(
        width: 280,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.whatsapp,
              size: 30,
              color: Colors.white,
            ),
            // SvgPicture.asset(
            //   'assets/whatsapp_logo.svg',
            //   color: Colors.white,
            //   width: 30,
            //   height: 30,
            // ),
            SizedBox(width: 10),
            Text(
              'Login with WhatsApp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
