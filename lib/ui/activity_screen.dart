import 'dart:math';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {

  final PageController controller;

  final List<String> names = [
    'Get \$5',
    'John',
    'Sam',
    'Danielle',
    'Sean',
    'Mom',
    'Dad',
  ];

  ActivityScreen({Key key, this.controller}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CustomAppBar(
        controller: widget.controller,
        names: widget.names,
      ),
      backgroundColor: Colors.grey.shade100,
      body: MainListView(names: widget.names),
    );
  }
}

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {

  final PageController controller;
  final List<String> names;

  CustomAppBar({this.controller, this.names});

  Size get preferredSize => Size(double.infinity, 165);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'Activity',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              onPressed: () {
                widget.controller.animateToPage(1,
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 200));
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                  color: Colors.grey.shade700,
                ),
                onPressed: () {},
              )
            ],
          ),
          HorizontalUsersList(names: widget.names)
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}

class HorizontalUsersList extends StatefulWidget {

  final List<String> names;

   HorizontalUsersList({this.names});

  final Random math = new Random();

  @override
  _HorizontalUsersListState createState() => _HorizontalUsersListState();
}

class _HorizontalUsersListState extends State<HorizontalUsersList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.names.length,
        itemBuilder: (BuildContext context, int index){
          return userTopProfile(widget.names[index], widget.names[index].substring(0,1), Color((widget.math.nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0));
        },
      ),
    );
  }
  Widget userTopProfile(String name, String firstletter, Color color){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: Center(
                child: Text(
                  firstletter,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0
                  ),
                ),
              ),
              backgroundColor: color,
              radius: 20,
            ),
            SizedBox(height: 13),
            Text(
              name,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11.0
              ),
            )
          ],
        ),
      )
    );
  }
}

class MainListView extends StatefulWidget {
  final List<String> names;
  
   MainListView({this.names});

   final List<String> payments = [
    '\$14.50',
    '\$2',
    '\$100.60',
    '\$1,050',
    '\$10',
    '\$100',
    '+\$2,000.50',
    '\$5',
    '\$10',
    '\$11',
    '\$12',
    '\$2,000.50',
  ];

   final Random math = new Random();

  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.names.length,
      itemBuilder: (BuildContext context, index){
        return usersTile(widget.names[index], widget.names[index].substring(0,1), Color((widget.math.nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0), widget.payments[index], index + 1);
      },
    );
  }
  Widget usersTile(String name, String firstletter, Color color, String amount, int index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.4,
            color: Colors.grey.shade300
          )
        )

      ),
      child: ListTile(
        leading:  CircleAvatar(
              child: Center(
                child: Text(
                  firstletter,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0
                  ),
                ),
              ),
              backgroundColor: color,
              radius: 20,
         ),
         title: Text(
           name,
           style:TextStyle(
             color:Colors.black,
             fontWeight:FontWeight.w400,
             fontSize: 20.0
           )
         ),
         subtitle: Text(
           'On April $index',
            style:TextStyle(
             color:Colors.grey.shade400,
             fontWeight:FontWeight.w400,
             fontSize: 14.0
           )
           
         ),
         trailing: Text(
           amount,
           style:TextStyle(
             color:Colors.black,
             fontWeight:FontWeight.w400,
             fontSize: 20.0
           )
         ),
      ),
    );
  }
}



