import 'package:flutter/material.dart';

class Stock {
  String name;
  double price;
  double change;

  Stock({required this.name, required this.price, required this.change});
}

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  List<Stock> watchlist = [
    Stock(name: 'AAPL', price: 148.48, change: -1.34),
    Stock(name: 'GOOG', price: 2588.43, change: 2.78),
    Stock(name: 'TSLA', price: 734.09, change: -0.89),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 134, 234, 194),
        centerTitle: true,
        title: Text('Watchlist'),
      ),
      body: ListView.builder(
        itemCount: watchlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${watchlist[index].price.toStringAsFixed(2)}',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: watchlist[index].change < 0
                          ? Colors.red
                          : Colors.green,
                    ),
                    child: Text(
                      '${watchlist[index].change.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
              title: Text(
                watchlist[index].name,
                style: TextStyle(fontSize: 18.0),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    watchlist.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController nameController = TextEditingController();
              TextEditingController priceController = TextEditingController();
              TextEditingController percentagechange = TextEditingController();

              return AlertDialog(
                title: Text('Add Stock'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'Stock Name'),
                    ),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(hintText: 'Stock Price'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: percentagechange,
                      decoration:
                          InputDecoration(hintText: 'Percentage Change'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      setState(() {
                        watchlist.add(
                          Stock(
                            name: nameController.text,
                            price: double.parse(priceController.text),
                            change: double.parse(percentagechange.text),
                          ),
                        );
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
