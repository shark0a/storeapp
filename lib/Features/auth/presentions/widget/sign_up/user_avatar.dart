import 'package:flutter/material.dart';
import 'package:storeapp/common/animations/animate_do.dart';
import 'package:storeapp/core/util/image_picker.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PickImageUtiles().pickImage();
      },
      child: const CustomFadeInDown(
        duration: 400,
        child: CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage('assets/images/customer/user.png'),
        ),
      ),
    );
  }
}
