import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:notas_alunos_windows/theme/text_theme.dart';

class PieChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Percentual de meninas",
                    style: CustomTextStyle.fontGraficoPizza,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.pinkAccent,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Percentual de meninos",
                    style: CustomTextStyle.fontGraficoPizza,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.blue,
                    ),
                  )
                ],
              )
            ],
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: PieChart(
            PieChartData(
              sections: _buildPieChartSections(),
              centerSpaceRadius: 20,
              sectionsSpace: 2,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 60,
        title: '60%',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.pinkAccent,
        value: 40,
        title: '40%',
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}
