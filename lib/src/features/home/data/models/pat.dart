class PATmodel {
  double price;
  double amount;
  double total;
  double gWidth;

  PATmodel({
    this.price = 36920.12,
    this.amount = 0.798965,
    this.total = 28021,
    this.gWidth = 1,
  });

  PATmodel copyWith({
    double? price,
    double? amount,
    double? total,
    double? gWidth,
  }) {
    return PATmodel(
      price: price ?? this.price,
      amount: amount ?? this.amount,
      total: total ?? this.total,
      gWidth: gWidth ?? this.gWidth,
    );
  }
}
