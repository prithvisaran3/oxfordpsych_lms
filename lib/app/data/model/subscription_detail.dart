class SubscriptionDetail {
  dynamic status;
  Data? data;

  SubscriptionDetail({
    this.status,
    this.data,
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetail(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  dynamic indexId;
  dynamic studentId;
  dynamic packageId;
  dynamic packageName;
  dynamic txnId;
  dynamic amount;
  dynamic currencyCode;
  dynamic paymentStatus;
  dynamic paidOn;
  dynamic validTill;

  Data({
    this.indexId,
    this.studentId,
    this.packageId,
    this.packageName,
    this.txnId,
    this.amount,
    this.currencyCode,
    this.paymentStatus,
    this.paidOn,
    this.validTill,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        indexId: json["index_id"],
        studentId: json["student_id"],
        packageId: json["package_id"],
        packageName: json["package_name"],
        txnId: json["txn_id"],
        amount: json["amount"],
        currencyCode: json["currency_code"],
        paymentStatus: json["payment_status"],
        paidOn: DateTime.parse(json["paid_on"]),
        validTill: DateTime.parse(json["valid_till"]),
      );

  Map<String, dynamic> toJson() => {
        "index_id": indexId,
        "student_id": studentId,
        "package_id": packageId,
        "package_name": packageName,
        "txn_id": txnId,
        "amount": amount,
        "currency_code": currencyCode,
        "payment_status": paymentStatus,
        "paid_on": paidOn,
        "valid_till": validTill
      };
}
