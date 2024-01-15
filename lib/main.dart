import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './app.dart';
import 'core/di/dependencies_setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    dependenciesInjection().then((_) {
      runApp(const App());
    });
  });
}
