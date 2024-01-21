import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utility/price_format_service.dart';
import '../../domain/entity/ledger_overview_entity.dart';
import 'section_title_widget.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTotalDueBalance(context),
            // Expanded(
            //     child: Container(
            //   color: Colors.blue,
            // )),
          ],
        ),
      ),
    );
  }

  Column _buildTotalDueBalance(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: Strings.totalDue),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            overviewBalance.getTotalDue.toFormatOfPrice,
            style: TextStyle(
              fontSize: MediaQuery.of(context).textScaler.scale(24),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.95,
          child: LinearProgressIndicator(
            value: overviewBalance.expenseWithPercent,
            color: Colors.red.shade600,
            minHeight: 4,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
