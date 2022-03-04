// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _moneyController = TextEditingController();
  int dollar = 0;

  String rupee = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dollars to rupees converter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Text(
                  'Enter price in dollar',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 68.0),
                child: TextField(
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  controller: _moneyController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.dollarSign,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: 'Currency converted successfully');
                  FocusManager.instance.primaryFocus?.unfocus();

                  setState(() {
                    dollar = int.parse(_moneyController.text);
                    _moneyController.text = "";
                  });
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  '$dollar Dollar = ${dollar * 76.17} Rupee',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY3d8l3eAZXIybbJ7PB54ANAtiaM_MO5U4Bw&usqp=CAU'),
                height: 450,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
