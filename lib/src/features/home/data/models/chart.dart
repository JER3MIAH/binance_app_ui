class ChartModel {
  int? time;
  double? open;
  double? high;
  double? low;
  double? close;

  ChartModel({
    this.time,
    this.open,
    this.high,
    this.low,
    this.close,
  });

  ChartModel copyWith({
    int? time,
    double? open,
    double? high,
    double? low,
    double? close,
  }) {
    return ChartModel(
      time: time ?? this.time,
      open: open ?? this.open,
      high: high ?? this.high,
      low: low ?? this.low,
      close: close ?? this.close,
    );
  }
}
