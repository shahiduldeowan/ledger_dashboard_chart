import 'package:flutter/material.dart';

Center buildProgressIndicatorWidget([double? progress]) => Center(
      child: CircularProgressIndicator.adaptive(value: progress),
    );
