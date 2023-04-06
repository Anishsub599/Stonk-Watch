import 'package:flutter/material.dart';


class StockCalculator extends StatefulWidget {
  const StockCalculator({super.key});

  @override
  State<StockCalculator> createState() => _StockCalculatorState();
}

class _StockCalculatorState extends State<StockCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('Buying')),
                Tab(icon: Text('Selling')),
                Tab(icon: Text('Right Share Adjustment')),
                Tab(icon: Text('Bonus Share Adjustment')),
              ],
            ),
            title: const Text('Stock Calculator'),
          ),
          body: TabBarView(
            children: [
              //tab1
              Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Initial Price',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'No of Shares',
                          ),
                        )
                      ])),
              //tab2
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Hello1'),
              ),
              //tab3
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Hello2'),
              ),
              //tab4
              Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Market Price (Before Book Closure)',
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Bonus Share Percentage',
                          ),
                        )
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
