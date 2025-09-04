import 'package:book_hotel/services/shared_prefs.dart';
import 'package:book_hotel/services/widget_support.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String wallet = '\$0.00';

  getOnTheLoad() async {
    wallet = (await SharedPrefHelper().getUserWallet())!;
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bookings', style: AppWidget.headLineTextStyle(30.0)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 3.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xffececf8),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/wallet.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 50.0),
                      Column(
                        children: [
                          Text(
                            'Your wallet',
                            style: AppWidget.normalTextStyle(20.0),
                          ),
                          Text(
                            '$wallet',
                            style: AppWidget.headLineTextStyle(34.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 2.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      ('50'),
                      style: AppWidget.boldWhiteTextStyle(24.0),
                    ),
                  ),
                ),
                const SizedBox(width: 30.0),
                Container(
                  //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 2.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      ('100'),
                      style: AppWidget.boldWhiteTextStyle(24.0),
                    ),
                  ),
                ),
                const SizedBox(width: 30.0),
                Container(
                  //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 2.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      ('200'),
                      style: AppWidget.boldWhiteTextStyle(24.0),
                    ),
                  ),
                ),
                const SizedBox(width: 30.0),
              ],
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => openBox(),
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Add Money',
                    style: AppWidget.boldWhiteTextStyle(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openBox() => showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.cancel)),
                    Text('Add Money', style: AppWidget.normalTextStyle(15.0),),
                ],
              ),
              const SizedBox(height: 8.0,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, )
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Amount',hintStyle: AppWidget.normalTextStyle(12.0)
                    ,
                  ),
                ),
              ), 
              const SizedBox(height: 10.0,),
              Center(
                
                child: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(10.0)),
                  child: Center(child: Text('Add', style: AppWidget.whiteTextStyle(12.0),)),
                
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
