import 'package:flutter/material.dart';

class StockCalculator extends StatefulWidget {
  const StockCalculator({Key? key}) : super(key: key);

  @override
  State<StockCalculator> createState() => _StockCalculatorState();
}

class _StockCalculatorState extends State<StockCalculator> {
  TextEditingController buyPriceController = TextEditingController();
  TextEditingController buyQuantityController = TextEditingController();
  TextEditingController buyBrokerageController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController sellQuantityController = TextEditingController();
  TextEditingController sellBrokerageController = TextEditingController();
  TextEditingController marketPriceController = TextEditingController();
  TextEditingController bonusShareController = TextEditingController();
  TextEditingController rightShareController = TextEditingController();
  double rightadjustedPrice = 0.0;
  double bonusadjustedPrice = 0.0;

  double buyAmount = 0.0;
  double buyBrokerage = 0.0;
  double buyNetAmount = 0.0;
  double sellAmount = 0.0;
  double sellBrokerage = 0.0;
  double sellNetAmount = 0.0;

  void calculateBuy() {
    setState(() {
      double price = double.parse(buyPriceController.text);
      double quantity = double.parse(buyQuantityController.text);
      double brokerage = double.parse(buyBrokerageController.text);

      // Calculate Buy Amount
      buyAmount = price * quantity;

      // Calculate Buy Brokerage
      buyBrokerage = brokerage * buyAmount / 100;

      // Calculate Buy Net Amount
      buyNetAmount = buyAmount + buyBrokerage;
    });
  }

  void calculateSell() {
    setState(() {
      double price = double.parse(sellPriceController.text);
      double quantity = double.parse(sellQuantityController.text);
      double brokerage = double.parse(sellBrokerageController.text);

      // Calculate Sell Amount
      sellAmount = price * quantity;

      // Calculate Sell Brokerage
      sellBrokerage = brokerage * sellAmount / 100;

      // Calculate Sell Net Amount
      sellNetAmount = sellAmount - sellBrokerage;
    });
  }

  void _calculateBonusAdjustedPrice() {
    setState(() {
      double marketPrice = double.parse(marketPriceController.text);
      double bonusPercentage = double.parse(bonusShareController.text);

      double bonusFactor = (bonusPercentage / 100) + 1;

      bonusadjustedPrice = marketPrice / bonusFactor;
    });
  }

  void _calculateRightAdjustedPrice() {
    setState(() {
      double marketPrice = double.parse(marketPriceController.text);
      double rightRatio = double.parse(rightShareController.text);
      double rightFactor = (rightRatio / 100) + 1;
      rightadjustedPrice = marketPrice / rightFactor;
    });
  }

  @override
  void dispose() {
    buyPriceController.dispose();
    buyQuantityController.dispose();
    buyBrokerageController.dispose();
    sellPriceController.dispose();
    sellQuantityController.dispose();
    sellBrokerageController.dispose();
    marketPriceController.dispose();
    bonusShareController.dispose();
    rightShareController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      controller: buyPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                    ),
                    TextField(
                      controller: buyQuantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                    ),
                    TextField(
                      controller: buyBrokerageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Brokerage (%)',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: calculateBuy,
                      child: Text('Calculate'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Buy Amount: $buyAmount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Buy Brokerage: $buyBrokerage',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Buy Net Amount: $buyNetAmount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //tab2
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: sellPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                    ),
                    TextField(
                      controller: sellQuantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                      ),
                    ),
                    TextField(
                      controller: sellBrokerageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Brokerage (%)',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: calculateSell,
                      child: Text('Calculate'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Sell Amount: $sellAmount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Sell Brokerage: $sellBrokerage',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Sell Net Amount: $sellNetAmount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //tab3
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: marketPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Market Price (Before Book Closure)',
                      ),
                    ),
                    TextField(
                      controller: rightShareController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Right Share Ratio(in percentage)',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _calculateRightAdjustedPrice,
                      child: Text('Calculate'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Adjusted Price: ${rightadjustedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //tab4
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: marketPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Market Price (Before Book Closure)',
                      ),
                    ),
                    TextField(
                      controller: bonusShareController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Bonus Share Percentage',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _calculateBonusAdjustedPrice,
                      child: Text('Calculate'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Adjusted Price: ${bonusadjustedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
