import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Floorsheet extends StatefulWidget {
  Floorsheet({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  FloorsheetState createState() => FloorsheetState();
}

class FloorsheetState extends State<Floorsheet> {
  late List<Scrip> _scrips;
  late ScripDataSource _scripDataSource;

  @override
  void initState() {
    super.initState();
    _scrips = [];
    _scripDataSource = ScripDataSource(_scrips);
    _fetchScripData();
  }

  Future<void> _fetchScripData() async {
    final apiKey = 'YOUR_ALPHA_VANTAGE_API_KEY';
    final List<String> symbols = [
      'AAPL',
      'MSFT',
      'AMZN',
      'GOOGL',
      'FB',
      'TSLA',
      'NVDA',
      'JPM',
      'JNJ',
      'V',
      'PG',
      'DIS',
      'BAC',
      'HD',
      'VZ',
      'CSCO',
      'WMT',
      'UNH',
      'XOM',
      'PFE'
    ];

    for (var symbol in symbols) {
      final url =
          'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey';

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          final quoteData = jsonData['Global Quote'];
          final double price = double.parse(quoteData['05. price']);
          final int volume = int.parse(quoteData['06. volume']);

          setState(() {
            _scrips.add(Scrip(
                symbol: symbol,
                price: price,
                volume: volume,
                date: DateTime.now())); // Add the current date
            _scripDataSource = ScripDataSource(_scrips);
          });
        } else {
          print(
              'Failed to fetch data for $symbol. Status Code: ${response.statusCode}');
        }
      } catch (error) {
        print('Failed to fetch data for $symbol: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 134, 234, 194),
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  ' Date: ${DateTime.now().toString()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SfDataGrid(
                  source: _scripDataSource,
                  columnWidthMode: ColumnWidthMode.fill,
                  headerGridLinesVisibility: GridLinesVisibility.none,
                  rowHeight: 50,
                  columns: [
                    GridTextColumn(
                      columnName: 'Symbol',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Symbol',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridTextColumn(
                      columnName: 'Price',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Price',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GridTextColumn(
                      columnName: 'Volume',
                      label: Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Volume',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Scrip {
  Scrip({
    required this.symbol,
    required this.price,
    required this.volume,
    required this.date,
  });

  final String symbol;
  final double price;
  final int volume;
  final DateTime date;
}

class ScripDataSource extends DataGridSource {
  ScripDataSource(List<Scrip> scrips) {
    _scrips = scrips
        .map<DataGridRow>((scrip) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Symbol', value: scrip.symbol),
              DataGridCell<double>(columnName: 'Price', value: scrip.price),
              DataGridCell<int>(columnName: 'Volume', value: scrip.volume),
            ]))
        .toList();
  }

  late List<DataGridRow> _scrips;

  @override
  List<DataGridRow> get rows => _scrips;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: (e.columnName == 'Symbol')
              ? Alignment.centerLeft
              : Alignment.centerRight,
          padding: EdgeInsets.all(8.0),
          child: Text(
            e.value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        );
      }).toList(),
    );
  }
}
