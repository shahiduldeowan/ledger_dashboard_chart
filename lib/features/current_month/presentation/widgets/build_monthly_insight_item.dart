import 'package:flutter/material.dart';

import '../../../../configs/themes/app_colors.dart' show creditFontColor, debitFontColor;
import '../../../../core/utility/price_format_service.dart';
import '../../domain/entity/current_month_entity.dart';

class BuildMonthlyInsightItem extends StatelessWidget {
  const BuildMonthlyInsightItem({super.key, required this.item});

  final LedgerCurrentMonthEntity item;

  Color get fontColor => item.isCredit ? creditFontColor : debitFontColor;
  Color get backgroundColor => fontColor.withOpacity(0.1);

  TextStyle get chipTextStyle => TextStyle(
        color: fontColor,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.departmentName ?? 'N/A'),
      trailing: Chip(
        label: Text((item.bill ?? 0.0).toFormatOfPrice),
        avatar: Text(item.getCreditDebitFlag),
        backgroundColor: backgroundColor,
        side: BorderSide(color: backgroundColor),
        labelStyle: chipTextStyle,
      ),
    );
  }
}
