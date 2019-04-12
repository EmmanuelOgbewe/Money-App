import 'package:flutter/material.dart';

class CashCardScreen extends StatefulWidget {

  final PageController controller;

  const CashCardScreen({Key key, this.controller})
   : super(key : key);

  @override
  _CashCardScreenState createState() => _CashCardScreenState();
}

class _CashCardScreenState extends State<CashCardScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              'CASH',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
              onPressed: () {
                widget.controller.animateToPage(1, duration:Duration(milliseconds: 200), curve: Curves.easeOut);
              },
              icon: RotatedBox(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade400.withOpacity(0.6),
                  size: 30.0,
                ),
                quarterTurns: -1,
              )),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, right: 15.0),
            child: Center(
              child: Text(
                'BTC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey.shade100])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        '\$0.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(
                        'CASH',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 270,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/black_card_4.png'),
                            fit: BoxFit.none)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40.0, bottom: 40.0),
                child: FlatButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(27.0),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blue, Colors.blue.shade300])),
                    child: Center(
                      child: Text('GET FREE CASH CARD',
                          style: TextStyle(fontSize: 17.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 2.0,
                            spreadRadius: 2.0)
                      ]),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(20.0))),
                        child: Center(
                            child: Text(
                          'Add Cash',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    SizedBox(width: 1),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(20.0))),
                        child: Center(
                            child: Text(
                          'Cash Out',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    )
                  ]),
                ),
              )
            ]),
      ),
    );
  }
}
