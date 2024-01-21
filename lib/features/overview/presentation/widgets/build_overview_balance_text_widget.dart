import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../domain/entity/ledger_overview_entity.dart';

class BuildOverviewBalanceTextWidget extends StatelessWidget {
  const BuildOverviewBalanceTextWidget({super.key, required this.overviewBalance});

  final LedgerOverviewEntity overviewBalance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.only(right: AppSizes.cardContentPadding),
        decoration: BoxDecoration(border: Border.all()),
        child: Center(
          child: Icon(Icons.abc),
        ),
      ),
    );
  }
}
