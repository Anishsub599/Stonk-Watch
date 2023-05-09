import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllScrips extends StatelessWidget {
  final List<String> scrips = ['AAPL', 'TSLA', 'IBM', 'MSFT', 'AMZN'];
  final Map<String, String> scripNames = {
    'AAPL': 'Apple Inc.',
    'TSLA': 'Tesla Inc.',
    'IBM': 'IBM',
    'MSFT': 'Microsoft Corporation',
    'AMZN': 'Amazon.com Inc.',
  };

  Future<Map<String, dynamic>> fetchStockInfo(String symbol) async {
    final apiKey = 'UP0DLOD0OWKTUT8D';
    final url =
        'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['Global Quote'];
    } else {
      throw Exception('Failed to fetch stock information');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Scrips'),
      ),
      body: ListView.builder(
        itemCount: scrips.length,
        itemBuilder: (BuildContext context, int index) {
          final scrip = scrips[index];
          final fullName = scripNames[scrip];

          return ListTile(
            title: Text(
              scrip,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              fullName ?? '',
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              try {
                final stockInfo = await fetchStockInfo(scrip);
                if (stockInfo != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(scrip),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Open: ${stockInfo['02. open']}'),
                            Text(
                                'Previous Close: ${stockInfo['08. previous close']}'),
                            Text('High: ${stockInfo['03. high']}'),
                            Text('Low: ${stockInfo['04. low']}'),
                            Text('Volume: ${stockInfo['06. volume']}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                }
              } catch (e) {
                print('Error fetching stock information: $e');
              }
            },
          );
        },
      ),
    );
  }
}
