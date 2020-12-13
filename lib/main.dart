import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double result= 0.0;
  String strResult= '0';
  String operator= '';
  double firstNumber ;
  bool isFirstNumberAfterOperationButton = true;

  void onDigitPress(String text){
    print('digit pressed  $text ' );
    if(text=='+'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });
    }
    else if(text== '-'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {
      });
    }
    else if(text== 'x'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {
      });
    }
    else if(text== '÷'){
      operator= text;
      firstNumber = result;
      isFirstNumberAfterOperationButton= true;
      strResult = '';
      setState(() {

      });
    }
    else if(text== '='){
      switch (operator){
        case '+':{
          setState(() {
            result= result + firstNumber;
          });
          strResult = '$result';
        }
        break;
        case '-':{
          setState(() {
            result=  firstNumber - result;
          });
          strResult = '$result';
        }
        break;
        case 'x':{
          setState(() {
            result= result * firstNumber;
          });
          strResult = '$result';
        }
        break;
        case '÷':{
          setState(() {
            result=   firstNumber/result;
          });
          strResult = '$result';
        }
        break;
      }
    }
    else if(text== '⌫'){
      result=0;
      firstNumber = result;
      strResult = '';
      setState(() {

      });
    }


    else if(text == 'C'){
      result=0;
      firstNumber = result;
      strResult = '';
      setState(() {
      });
    }
    else {
      var tempResult;
      if (isFirstNumberAfterOperationButton) {
        tempResult = text;
        isFirstNumberAfterOperationButton = false;
      }
      else {

        tempResult = strResult + text;
      }
      var temp = double.tryParse(tempResult);
      if (temp != null) {
        strResult = tempResult;
        setState(() {
          result = temp ?? result;
        });
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [

            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '$result',
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  buildCalcButton('C',Colors.red),
                  buildCalcButton('⌫',Colors.blue),
                  buildCalcButton('÷',Colors.blue),

                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalcButton('7', Colors.black54),
                  buildCalcButton('8', Colors.black54),
                  buildCalcButton('9', Colors.black54),
                  buildCalcButton('x',Colors.blue),

                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalcButton('4', Colors.black54),
                  buildCalcButton('5', Colors.black54),
                  buildCalcButton('6', Colors.black54),
                  buildCalcButton('+',Colors.blue),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalcButton('1', Colors.black54),
                  buildCalcButton('2', Colors.black54),
                  buildCalcButton('3', Colors.black54),
                  buildCalcButton('-',Colors.blue),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildCalcButton('.', Colors.black54),
                  buildCalcButton('0', Colors.black54),
                  buildCalcButton('00', Colors.black54),
                  buildCalcButton('=',Colors.blue),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildCalcButton(String text, Color color) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          onDigitPress(text);
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        color: color,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
