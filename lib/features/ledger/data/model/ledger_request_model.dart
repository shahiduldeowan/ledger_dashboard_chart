import '../../domain/entity/ledger_request_entity.dart';

class LedgerRequestModel extends LedgerRequestEntity {
  const LedgerRequestModel({
    super.fromDate,
    super.toDate,
    super.departmentKey,
  });

  factory LedgerRequestModel.fromEntity(LedgerRequestEntity entity) {
    return LedgerRequestModel(
      fromDate: entity.fromDate,
      toDate: entity.toDate,
      departmentKey: entity.departmentKey,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = <String, dynamic>{};

    if (fromDate != null) {
      result.addAll({'fromDate': _dateToString(fromDate!)});
    }
    if (toDate != null) {
      result.addAll({'toDate': _dateToString(toDate!)});
    }
    if (departmentKey != null) {
      result.addAll({'departmentkey': departmentKey!});
    }

    return result;
  }

  String _dateToString(DateTime dateTime) {
    return '${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }
}
