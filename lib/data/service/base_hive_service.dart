import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class BaseHiveService {
  Future<void> init() async {
    final suppDir = await getApplicationSupportDirectory();
    Hive.init(suppDir.path);
    registerAdapter();
    await openBox();
  }

  void registerAdapter() {

  }

  Future<void> openBox() async {

  }

}
