import 'package:flutter/material.dart';

extension MediaqueryExtensions on BuildContext {
  get mediawidth => MediaQuery.of(this).size.width;

  get mediaheight => MediaQuery.of(this).size.height;
}
