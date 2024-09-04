import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsHelper {
  static Future<bool> requestStoragePermission() async {
    return await Permission.storage.request().isGranted;
  }
}