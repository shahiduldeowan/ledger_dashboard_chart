import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/utility/price_format_service.dart';
import '../../domain/entity/ledger_overview_entity.dart';

class BuildRemainChartIndicator extends StatelessWidget {
  const BuildRemainChartIndicator({super.key, required this.overviewBalance});

  final LedgerOverviewEntity overviewBalance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildCircularIndicator(),
            _buildTextPositioned(context),
          ],
        ),
      ),
    );
  }

  Positioned _buildTextPositioned(BuildContext context) {
    return Positioned(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRemainBalanceText(context),
            _buildRemainBalanceTitleText(),
          ],
        ),
      ),
    );
  }

  FittedBox _buildRemainBalanceTitleText() {
    return const FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        Strings.remain,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white60,
        ),
      ),
    );
  }

  FittedBox _buildRemainBalanceText(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        overviewBalance.getAvailableBalance.toFormatOfPrice,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(context).textScaler.scale(18),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  FractionallySizedBox _buildCircularIndicator() {
    return FractionallySizedBox(
      heightFactor: 0.65,
      widthFactor: 1,
      child: CircularProgressIndicator(
        value: overviewBalance.getRemainWithPercent,
        strokeCap: StrokeCap.round,
        strokeWidth: 8,
        backgroundColor: Colors.white12,
        color: overviewBalance.isRemainBalanceWarning ? Colors.red.shade600 : null,
      ),
    );
  }
}
