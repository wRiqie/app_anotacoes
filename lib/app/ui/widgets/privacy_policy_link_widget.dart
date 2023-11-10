import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyLinkWidget extends StatelessWidget {
  const PrivacyPolicyLinkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(
        Uri.parse('https:google.com.br'),
        mode: LaunchMode.externalApplication,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Política de Privacidade',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
