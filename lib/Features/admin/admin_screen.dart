import 'package:flutter/material.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';
import 'package:storeapp/core/routes/app_routes.dart';
import 'package:storeapp/core/services/shared_pref.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.mainColor,
        title: TextApp(
            text: 'admin',
            theme: context.textStyle.copyWith(
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Container(
          child: IconButton(
              onPressed: () async {
                SharedPref().clearSharedPref();
                context.pushName(AppRoutes.login);
              },
              icon: Icon(Icons.logout_outlined))),
    );
  }
}
