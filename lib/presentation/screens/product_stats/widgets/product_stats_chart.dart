// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delalty/core/resources/text/styles_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class ProductStatsChart extends StatelessWidget {
  const ProductStatsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.statistics,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 18.sp,
        ),
        SizedBox(
          height: 130.h,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.black,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map(
                      (LineBarSpot touchedSpot) {
                        final textStyle = getMediumStyle(
                          color: AppColors.chartToolTipColor,
                          fontSize: 12.sp,
                        );
                        return LineTooltipItem(
                          touchedSpot.y.toString(),
                          textStyle,
                        );
                      },
                    ).toList();
                  },
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              titlesData: getTitleData(),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 5.0,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: AppColors.chartHorizontalBar,
                    strokeWidth: 1,
                  );
                },
              ),
              minX: 0,
              maxX: 8,
              minY: 0,
              maxY: 25,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(1, 5),
                    const FlSpot(2, 8),
                    const FlSpot(3, 10),
                    const FlSpot(4, 6),
                    const FlSpot(5, 15),
                    const FlSpot(6, 7),
                    const FlSpot(7, 4),
                  ],
                  color: AppColors.chartCurveColor,
                  isCurved: true,
                  dotData: const FlDotData(show: false),
                  barWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getTitleData() {
    const notShowingTitles = AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    );
    return FlTitlesData(
      show: true,
      leftTitles: notShowingTitles,
      rightTitles: notShowingTitles,
      topTitles: notShowingTitles,
      bottomTitles: AxisTitles(
          sideTitles: SideTitles(
        interval: 1,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          if (value == meta.max || value == meta.min) {
            return const SizedBox.shrink();
          }
          String title = '';
          switch (value.toInt()) {
            case 1:
              title = 'Su';
              break;
            case 2:
              title = 'Mo';
              break;

            case 3:
              title = 'Tu';
              break;

            case 4:
              title = 'We';
              break;

            case 5:
              title = 'Th';
              break;

            case 6:
              title = 'Fr';
              break;

            case 7:
              title = 'Sa';
              break;
          }
          return SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 12.sp,
            textAlign: TextAlign.center,
          );
        },
      )),
    );
  }
}
