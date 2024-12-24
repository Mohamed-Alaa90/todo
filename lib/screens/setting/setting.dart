import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/my_colors.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: MyColor.primerColor,
          height: mediaQuery.height * 0.22,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Text(
            'Setting',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text("Sign out"),
        )
      ],
    );
  }
}
