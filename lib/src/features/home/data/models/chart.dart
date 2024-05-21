
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

  factory ChartModel.fromJson(List l) {
    return ChartModel(
      time: l[0],
      open: l[1],
      high: l[2],
      low: l[3],
      close: l[4],
    );
  }

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
