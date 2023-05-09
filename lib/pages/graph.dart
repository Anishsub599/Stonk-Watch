import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:endproject/main.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CandleStick extends StatefulWidget {
  const CandleStick({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CandleStickState createState() => _CandleStickState();
}

class _CandleStickState extends State<CandleStick> {
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;
  String _chartType = 'Candles';
  List<String> _stocks = ['AAPL', 'TSLA', 'IBM', 'MSFT', 'AMZN'];
  int _selectedStockIndex = 0;

  @override
  void initState() {
    _chartData = [];
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    _fetchChartData();
    super.initState();
  }

  Future<void> _fetchChartData() async {
    final apiKey = 'UP0DLOD0OWKTUT8D';
    final symbol = _stocks[_selectedStockIndex];
    final apiUrl =
        'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=$symbol&apikey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = jsonDecode(response.body);
      final weeklyData = jsonData['Weekly Time Series'];

      List<ChartSampleData> data = [];

      weeklyData.forEach((key, value) {
        final date = DateFormat('yyyy-MM-dd').parse(key);
        final open = double.parse(value['1. open']);
        final high = double.parse(value['2. high']);
        final low = double.parse(value['3. low']);
        final close = double.parse(value['4. close']);

        final chartData = ChartSampleData(
          x: date,
          open: open,
          high: high,
          low: low,
          close: close,
        );

        data.add(chartData);
      });

      setState(() {
        _chartData = data;
      });
    } catch (e) {
      print('Error fetching chart data: $e');
    }
  }

  void _changeStock(int index) {
    setState(() {
      _selectedStockIndex = index;
    });
    _fetchChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Stock Chart"),
        ),
        body: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _chartType = 'Line';
                    });
                  },
                  icon: Icon(Icons.show_chart),
                  label: Text('Line'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey[200]!),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _chartType = 'Candles';
                    });
                  },
                  icon: Icon(Icons.analytics),
                  label: Text('Candles'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey[200]!),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _stocks.map((stock) {
                int index = _stocks.indexOf(stock);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(stock),
                    selected: _selectedStockIndex == index,
                    onSelected: (selected) {
                      _changeStock(index);
                    },
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SfCartesianChart(
                trackballBehavior: _trackballBehavior,
                series: _getChartSeries(),
                primaryXAxis: DateTimeAxis(),
                primaryYAxis: NumericAxis(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ChartSeries<ChartSampleData, DateTime>> _getChartSeries() {
    if (_chartType == 'Line') {
      return <ChartSeries<ChartSampleData, DateTime>>[
        LineSeries<ChartSampleData, DateTime>(
          dataSource: _chartData,
          xValueMapper: (ChartSampleData data, _) => data.x,
          yValueMapper: (ChartSampleData data, _) => data.close,
        ),
      ];
    } else {
      return <ChartSeries<ChartSampleData, DateTime>>[
        CandleSeries<ChartSampleData, DateTime>(
          dataSource: _chartData,
          xValueMapper: (ChartSampleData data, _) => data.x,
          lowValueMapper: (ChartSampleData data, _) => data.low,
          highValueMapper: (ChartSampleData data, _) => data.high,
          openValueMapper: (ChartSampleData data, _) => data.open,
          closeValueMapper: (ChartSampleData data, _) => data.close,
        ),
      ];
    }
  }
}

class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;
}
