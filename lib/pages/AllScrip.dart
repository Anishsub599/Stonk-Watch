import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AllScrip extends StatefulWidget {
  AllScrip({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AllScripState createState() => _AllScripState();
}

class _AllScripState extends State<AllScrip> {
  late List<Scrips> _Scrips;
  late ScripDataSource _ScripDataSource;

  @override
  void initState() {
    super.initState();
    _Scrips = getScripData();
    _ScripDataSource = ScripDataSource(_Scrips);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 134, 234, 194),
          centerTitle: true,
          title: const Text("All Scrips"),
        ),
        body: SfDataGrid(
          allowSorting: true,
          selectionMode: SelectionMode.multiple,
          source: _ScripDataSource,
          headerGridLinesVisibility: GridLinesVisibility.none,
          columnWidthMode: ColumnWidthMode.fill,
          columns: [
            GridTextColumn(
                columnName: 'Symbol',
                label: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Symbol',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
            GridTextColumn(
                columnName: 'fullform',
                label: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fullform',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
            GridTextColumn(
                columnName: 'price',
                label: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Price',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
          ],
        ),
      ),
    );
  }
}

class Scrips {
  Scrips({required this.symbol, required this.fullForm, required this.price});

  final String symbol;
  final String fullForm;
  final double price;
}

List<Scrips> getScripData() {
  return [
    Scrips(symbol: 'AAPL', fullForm: 'Apple Inc.', price: 127.35),
    Scrips(symbol: 'MSFT', fullForm: 'Microsoft Corporation', price: 249.68),
    Scrips(symbol: 'AMZN', fullForm: 'Amazon.com, Inc.', price: 3263.50),
    Scrips(symbol: 'GOOGL', fullForm: 'Alphabet Inc. (Google)', price: 2345.98),
    Scrips(
        symbol: 'FB',
        fullForm: 'Meta Platforms, Inc. (Facebook)',
        price: 315.94),
    Scrips(symbol: 'TSLA', fullForm: 'Tesla, Inc.', price: 672.37),
    Scrips(symbol: 'NVDA', fullForm: 'NVIDIA Corporation', price: 592.23),
    Scrips(symbol: 'JPM', fullForm: 'JPMorgan Chase & Co.', price: 161.49),
    Scrips(symbol: 'JNJ', fullForm: 'Johnson & Johnson', price: 166.90),
    Scrips(symbol: 'V', fullForm: 'Visa Inc.', price: 227.28),
    Scrips(symbol: 'PG', fullForm: 'Procter & Gamble Company', price: 136.68),
    Scrips(symbol: 'DIS', fullForm: 'The Walt Disney Company', price: 172.52),
    Scrips(
        symbol: 'BAC', fullForm: 'Bank of America Corporation', price: 42.38),
    Scrips(symbol: 'HD', fullForm: 'The Home Depot, Inc.', price: 325.32),
    Scrips(symbol: 'VZ', fullForm: 'Verizon Communications Inc.', price: 57.48),
    Scrips(symbol: 'CSCO', fullForm: 'Cisco Systems, Inc.', price: 51.90),
    Scrips(symbol: 'WMT', fullForm: 'Walmart Inc.', price: 139.47),
    Scrips(
        symbol: 'UNH',
        fullForm: 'UnitedHealth Group Incorporated',
        price: 401.22),
    Scrips(symbol: 'XOM', fullForm: 'Exxon Mobil Corporation', price: 59.80),
    Scrips(symbol: 'PFE', fullForm: 'Pfizer Inc.', price: 38.45)
  ];
}

class ScripDataSource extends DataGridSource {
  ScripDataSource(List<Scrips> scrips) {
    _scrips = scrips
        .map<DataGridRow>((scrip) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'symbol', value: scrip.symbol),
              DataGridCell<String>(
                  columnName: 'fullForm', value: scrip.fullForm),
              DataGridCell<double>(columnName: 'price', value: scrip.price),
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
          alignment: (e.columnName == 'symbol' || e.columnName == 'fullForm')
              ? Alignment.centerLeft
              : Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
