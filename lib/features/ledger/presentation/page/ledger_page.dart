import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/constants/strings.dart';

class LedgerPage extends HookWidget {
  const LedgerPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.ledgerDashboardTitle),
      ),
      body: Center(
        child: Icon(CupertinoIcons.arrow_3_trianglepath),
      ),
    );
  }
}
