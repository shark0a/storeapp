import 'package:flutter/material.dart';
import 'package:storeapp/common/widget/text_app.dart';
import 'package:storeapp/core/extensions/context_extensions.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.mainColor,
        title: TextApp(
            text: 'Customer page',
            theme: context.textStyle.copyWith(
              color: Colors.white,
            )),
        centerTitle: true,
      ),
    );
  }
}
