import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri githubUrl =
        Uri.parse('https://github.com/oluwakolade/HNG12-INTERNSHIP');
    final Uri hngUrl = Uri.parse(
        'https://www.notion.so/Stage-0-Blog-Post-with-Strategic-Backlinks-for-HNG-Hire-Delve-and-Telex-80a6ed3d3c3d49489769d78b6a23ecda?pvs=21');

    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HNG12 First App')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click the buttons bellow to viist the respective sites',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButton(
                        label: 'Github',
                        onTap: () => _launchUrl(githubUrl),
                        icon: FontAwesomeIcons.github,
                        color: Colors.black),
                  ),
                  Expanded(
                    child: AppButton(
                        label: 'HNG Hire Page',
                        onTap: () => _launchUrl(hngUrl),
                        icon: FontAwesomeIcons.flutter,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
