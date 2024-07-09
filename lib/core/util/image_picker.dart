import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storeapp/core/di/injections_container.dart';

class PickImageUtiles {
  factory PickImageUtiles() {
    return _instance;
  }
  const PickImageUtiles._();
  static const PickImageUtiles _instance = PickImageUtiles._();

  Future<XFile?> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return XFile(image.path);
    }
    return null;
  }
}

Future<void> _showAlertPermissionsDialog() {
  return showCupertinoDialog(
    context: sl<GlobalKey<NavigatorState>>().currentState!.context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Permissions Denied'),
        content: const Text('Allow access to gallery and photos'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          const CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: openAppSettings,
            child: Text('Settings'),
          ),
        ],
      );
    },
  );
}
