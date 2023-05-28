import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class STOCKHistory extends StatefulWidget {
  @override
  STOCKHistoryState createState() => STOCKHistoryState();
}

class STOCKHistoryState extends State<STOCKHistory> {
  Map<String, dynamic>? stockData;
  String selectedStock = 'AAPL'; // Default selected stock

  final List<String> stockList = [
    'AAPL',
    'TSLA',
    'IBM',
    'MSFT',
    'AMZN',
    'NVDA',
    'GOOGL',
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
    'PFE',
  ];

  @override
  void initState() {
    super.initState();
    fetchStockData(selectedStock).then((data) {
      setState(() {
        stockData = data;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error fetching stock data: $error');
      }
    });
  }

  Future<Map<String, dynamic>> fetchStockData(String symbol) async {
    final String apiKey = "UP0DLOD0OWKTUT8D";

    final url = Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=$symbol&apikey=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Print the response data
      return data['Time Series (Daily)'];
    } else {
      print(
          'Error: ${response.statusCode} - ${response.reasonPhrase}'); // Print the error
      throw Exception('Failed to fetch stock data');
    }
  }

  void onStockSelected(String? symbol) {
    if (symbol != null) {
      setState(() {
        selectedStock = symbol;
        stockData = null; // Reset stockData when a new stock is selected
      });

      fetchStockData(selectedStock).then((data) {
        setState(() {
          stockData = data;
        });
      }).catchError((error) {
        print('Error fetching stock data: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 134, 234, 194),
        title: Text('STOCK History'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedStock,
              onChanged: onStockSelected,
              items: stockList.map((String symbol) {
                return DropdownMenuItem<String>(
                  value: symbol,
                  child: Text(
                    symbol,
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: stockData == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: stockData!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final date = stockData!.keys.elementAt(index);
                      final stockInfo = stockData![date];

                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date: $date',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Open: ${stockInfo['1. open']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'High: ${stockInfo['2. high']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Low: ${stockInfo['3. low']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Close: ${stockInfo['4. close']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Volume: ${stockInfo['5. volume']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
