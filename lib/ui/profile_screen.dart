import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final PageController controller;

  ProfileScreen({Key key, @required this.controller}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF28c101),
        leading: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Container(
                  child: Text("SHARE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0))),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            color: Colors.white,
            iconSize: 30,
            onPressed: () {
              widget.controller.animateToPage(1,
                  curve: Curves.easeIn, duration: Duration(milliseconds: 200));
            },
          ),
          SizedBox(width: 20)
        ],
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ProfileOptionsList(),
    );
  }
}

class ProfileOptionsList extends StatefulWidget {
  @override
  _ProfileOptionsListState createState() => _ProfileOptionsListState();
}

class _ProfileOptionsListState extends State<ProfileOptionsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          AddPhoto(),
          InviteFriends(),
          sectionTitle('SECURITY'),
          SecurityLock(),
          sectionTitle('FUNDS'),
          FundsListTile(
              sectionTitle: 'Cash',
              icon: Icons.attach_money,
              amount: '\$0.00',
              optionalAmountColor: Colors.green),
          FundsListTile(
              sectionTitle: 'Bitcoin',
              icon: Icons.block,
              amount: '\$100.00',
              optionalAmountColor: Colors.blue),
          FundsListTile(
            sectionTitle: 'Add Bank',
            icon: Icons.add,
            amount: "",
            sectionColor: Colors.grey,
          ),
          FundsListTile(
            sectionTitle: 'Add Credit Card',
            icon: Icons.add,
            amount: "",
            sectionColor: Colors.grey,
          ),
          sectionTitle('CASH CARD'),
          CashCard(),
          sectionTitle('SETTINGS'),
          SettingsTile(sectionTitle: 'Personal', iconData: Icons.person),
          SettingsTile(
              sectionTitle: 'Notifications', iconData: Icons.notifications),
          SettingsTile(sectionTitle: 'Privacy', iconData: Icons.lock),
          sectionTitle(''),
          ReusableButtons(
            text: 'Cash Support',
            action: () {},
          ),
          ReusableButtons(
              text: 'Sign Out', action: () {}, hideBottomBorder: true),
          Container(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Privacy Policy. Terms of Service \n and Open Source Software',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset(
                          'assets/twitter.png',
                          fit: BoxFit.fill,
                          height: 23.0,
                          color: Colors.grey.shade400,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 20.0),
                      IconButton(
                        icon: Image.asset(
                          'assets/instagram.png',
                          fit: BoxFit.fill,
                          height: 23.0,
                          color: Colors.grey.shade400,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 20.0),
                      IconButton(
                        icon: Image.asset(
                          'assets/facebook.png',
                          fit: BoxFit.fill,
                          height: 23.0,
                          color: Colors.grey.shade400,
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget sectionTitle(text) {
    return Container(
      height: 70,
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
                fontSize: 12.0),
          ),
        ),
      ),
    );
  }
}

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xFFFF28c101),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Center(
                    child: Text('ADD \n PHOTO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w700))),
              ),
              onTap: () {
                //Show camera options when tapped
              },
            ),
            SizedBox(height: 10.0),
            Text('John AppleSeed',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 7.0),
            Text(
              '\$John_Apple',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class InviteFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Center(
          child: Text(
        'Invite Friends, Get \$5',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.w500, fontSize: 20.0),
      )),
    );
  }
}

class SecurityLock extends StatefulWidget {
  @override
  _SecurityLockState createState() => _SecurityLockState();
}

class _SecurityLockState extends State<SecurityLock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Switch(
              onChanged: (bool b) {
                print('turn on');
              },
              activeTrackColor: Colors.green,
              activeColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade200,
              value: false,
            ),
            SizedBox(height: 10),
            Text('Security Lock',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Text('Requires Face ID to \n transfer funds',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}

class FundsListTile extends StatefulWidget {
  final String sectionTitle;
  final String amount;
  final Color optionalAmountColor;
  final IconData icon;
  final Color sectionColor;
  final Color iconColor;

  FundsListTile(
      {
      Key key,
      this.sectionTitle,
      this.amount,
      this.optionalAmountColor,
      this.icon,
      this.sectionColor,
      this.iconColor}) 
      :   super(key : key);

  @override
  _FundsListTileState createState() => _FundsListTileState();
}

class _FundsListTileState extends State<FundsListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
      child: Center(
        child: ListTile(
          leading: Container(
            height: 22,
            width: 37,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(5.0)),
            child: Icon(widget.icon, color: widget.iconColor, size: 20),
          ),
          title: Text(
            widget.sectionTitle,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                color: widget.sectionColor),
          ),
          trailing: Text(
            widget.amount,
            style: TextStyle(
                color: widget.optionalAmountColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}

class CashCard extends StatefulWidget {
  @override
  _CashCardState createState() => _CashCardState();
}

class _CashCardState extends State<CashCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              height: 90,
              width: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/black_card_5.png'),
                      fit: BoxFit.contain)),
            ),
            SizedBox(height: 10),
            Text(
              'Get a free debit card to use your \n cash and get instant discounts',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 0.3,
              color: Colors.grey.shade300,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: new ReusableButtons(
                  text: 'Get Cash Card', action: () {}, hideBottomBorder: true),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableButtons extends StatelessWidget {
  final String text;
  final Function action;
  final bool hideBottomBorder;

  const ReusableButtons(
      {Key key, this.text, this.action, this.hideBottomBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      color: hideBottomBorder == true
                          ? Colors.white
                          : Colors.grey.shade200))),
          child: Center(
            child: Text(text,
                style: TextStyle(color: Colors.green, fontSize: 19.0)),
          ),
        ),
        onTap: () => action);
  }
}

class SettingsTile extends StatefulWidget {
  final String sectionTitle;
  final IconData iconData;

  SettingsTile({ Key key, this.sectionTitle, this.iconData}) : super(key : key);

  @override
  _SettingsTileState createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.3,
          ))),
      child: Center(
        child: ListTile(
          leading: Text(
            widget.sectionTitle,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.0),
          ),
          trailing: Icon(widget.iconData, color: Colors.green, size: 24.0),
        ),
      ),
    );
  }
}
