import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LedgerPage extends HookWidget {
  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(CupertinoIcons.arrow_3_trianglepath),
      ),
    );
  }
}
