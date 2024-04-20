import 'package:flutter/material.dart';
import 'package:storeapp/common/animations/animate_do.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFadeInDown(
      duration: 400,
      child: CircleAvatar(
        radius: 45,
        backgroundImage: AssetImage('assets/images/customer/user.png'),
      ),
    );
  }
}
