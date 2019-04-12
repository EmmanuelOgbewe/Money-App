
import 'package:flutter/material.dart';
import 'package:cash_app/ui/animations.dart';

class HomeScreen extends StatefulWidget {
  final PageController controller;
  final PageController nestedController;

  const HomeScreen({Key key, this.controller, this.nestedController}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF28c101),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TopContainer(controller: widget.controller, controller2: widget.nestedController,),
                Amount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatefulWidget {
  final PageController controller;
  final PageController controller2;

  TopContainer({Key key, this.controller, this.controller2 }): super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              goToPage(0);
            },
          ),
          InkWell(
            child: Container(
              height: 35,
              width: 130,
              decoration: BoxDecoration(
                  color: Color(0xFFFF30db2e),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Center(
                child: Text('Cash Card',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            onTap: (){
                widget.controller2.animateToPage(0,
                  curve: Curves.easeIn, duration: Duration(milliseconds: 200));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.access_time,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
               widget.controller.animateToPage(2,
                  curve: Curves.easeIn, duration: Duration(milliseconds: 200));
            },
          ),
        ],
      ),
    );
  }

  void goToPage(index) {
    widget.controller
        .animateToPage(index, curve: Curves.easeIn, duration: Duration(milliseconds: 200));
  }
}

class Amount extends StatefulWidget {
  @override
  _AmountState createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  int amount = 0;
  String textAmount = "\$0";

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  color: Colors.transparent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Visibility(
                            visible: true,
                            child: AnimateText(text: textAmount,)
                          ),
                        ),
                      ])),
            ),
            SizedBox(height: 55.0),
            Container(
              child: Column(
                children: <Widget>[
                  numberRow(1, 2, 3),
                  numberRow(4, 5, 6),
                  numberRow(7, 8, 9),
                  finalRow(),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            BottomButtons()
          ],
        ));
  }
  Widget numberRow(number1, number2, number3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            calculateNumber(number1);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                number1.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(number2);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                number2.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(number3);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                number3.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget finalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            // calculateNumber(number1);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                '.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNumber(0);
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
              child: Text(
                0.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              amount = amount * 0;
              textAmount = '\$$amount';
              print(textAmount);
            });
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            child: Center(
                child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25.0,
            )),
          ),
        )
      ],
    );
  }
  //Calulate amount depending on the number that was selected
  calculateNumber(number) {
    if (amount == 0) {
      setState(() {
        amount = number;
        textAmount = '\$$amount';
        print(textAmount);
      });
    } else {
      setState(() {
        amount = (amount * 10) + number;
        textAmount = '\$$amount';
        print(textAmount);
      });
    }
  }
}

class BottomButtons extends StatefulWidget {
  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFF30db2e),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Center(
                    child: Text(
                  'Request',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                )),
              ),
            ),
          ),
          SizedBox(width: 1),
          Expanded(
            child: InkWell(
              onTap: (){
                
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFF30db2e),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                child: Center(
                    child: Text(
                  'Pay',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}