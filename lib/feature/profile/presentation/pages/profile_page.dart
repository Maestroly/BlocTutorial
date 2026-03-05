import 'package:flutter/material.dart';
import 'package:my_app_name/core/widgets/buttons/primary_buttons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Profile'), SizedBox(height: 12), PrimaryButton()]),
    );
  }
}
