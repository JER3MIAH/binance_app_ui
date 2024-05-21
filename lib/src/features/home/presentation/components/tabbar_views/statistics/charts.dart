import 'package:binance_app_ui/src/features/home/data/models/chart.dart';
import 'package:binance_app_ui/src/features/home/logic/providers/chart_provider.dart';
import 'package:binance_app_ui/src/features/home/presentation/widgets/widgets.dart';
import 'package:binance_app_ui/src/features/theme/data/theme.dart';
import 'package:binance_app_ui/src/features/theme/logic/theme_provider.dart';
import 'package:binance_app_ui/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsView extends ConsumerWidget {
  const ChartsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final isDarkMode = ref.watch(themeProvider).isDarkMode;
    final tStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: theme.secondary,
    );

    Widget cont({String? text, TextStyle? style, Color? color}) {
      return Container(
        height: 28,
        padding: EdgeInsets.symmetric(horizontal: 10.dx),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            '$text',
            style: style ?? tStyle,
          ),
        ),
      );
    }

    return Column(
      children: [
        const ChartsTopRow(),
        YBox(10.dy),
        Container(
          height: 70.dy,
          padding: EdgeInsets.only(left: 20.dx),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: isDarkMode ? appColors.dtBorder : appColors.ltBorder,
              ),
            ),
          ),
          child: Center(
            child: Row(
              children: [
                cont(
                  text: 'Trading view',
                  color: isDarkMode
                      ? const Color(0xFF555C63)
                      : const Color(0xFFCFD3D8),
                  style: tStyle.copyWith(color: theme.outline),
                ),
                XBox(20.dx),
                cont(
                  text: 'Depth',
                ),
                XBox(20.dx),
                SvgAsset(assetName: expandIcon),
              ],
            ),
          ),
        ),
        SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
            zoomMode: ZoomMode.x,
          ),
          trackballBehavior: TrackballBehavior(
            enable: true,
            activationMode: ActivationMode.singleTap,
            tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
            markerSettings: const TrackballMarkerSettings(
              markerVisibility: TrackballVisibilityMode.visible,
            ),
            // lineType: TrackballLineType.,
          ),
          series: <CandleSeries>[
            CandleSeries<ChartModel, int>(
              enableSolidCandles: true,
              enableTooltip: true,
              bullColor: appColors.green,
              bearColor: appColors.red,
              animationDuration: 50,
              dataSource: ref.watch(chartProvider).chartData,
              xValueMapper: (ChartModel sales, _) => sales.time,
              lowValueMapper: (ChartModel sales, _) => sales.low,
              highValueMapper: (ChartModel sales, _) => sales.high,
              openValueMapper: (ChartModel sales, _) => sales.open,
              closeValueMapper: (ChartModel sales, _) => sales.close,
            ),
          ],
        ),
      ],
    );
  }
}
