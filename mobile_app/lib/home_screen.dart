import 'package:flutter/material.dart';
import 'package:mobile_app/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String githubUrl = 'https://github.com/oluwakolade/HNG12-INTERNSHIP';
    String hngUrl = 'http://hng.tech/hire/flutter-developers';

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
                'Click the buttons below to viist the respective sites',
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
                        onTap: () async {
                          await UrlLauncher.openUrl(githubUrl);
                        },
                        color: Colors.black),
                  ),
                  Expanded(
                    child: AppButton(
                        label: 'HNG Hire Page',
                        onTap: () async {
                          await UrlLauncher.openUrl(hngUrl);
                        },
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
  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
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
        Icons.open_in_browser,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
