import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarTransparent = SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ),
);
