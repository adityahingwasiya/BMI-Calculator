import 'package:flutter/material.dart';
import 'package:flutter_basic/Widget/Rounded_Button.dart';
import 'package:flutter_basic/splashScreen.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



void main(){
  runApp(FlutterApp());
}
class FlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(

        debugShowCheckedModeBanner: false,
        title: "FlutterApp",
        theme: ThemeData(
            primarySwatch: Colors.orange,

            textTheme: TextTheme(
            headlineLarge: TextStyle(fontFamily: 'FontMain',fontSize: 31,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
            titleMedium: TextStyle(fontFamily: 'FontMain',fontSize: 21,fontWeight: FontWeight.w500)
          )
        ),
        home: splashScreen(),
      );
  }

}

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}
class _DashBoardScreenState extends State<DashBoardScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  // var bgColor = Colors.purple.shade200;
  LinearGradient gradient = LinearGradient(
    colors: [Color(0xffffecd2), Color(0xfffcb69f)],
    begin: FractionalOffset(1.0, 0.0),
    end: FractionalOffset(0.0, 1.0),
  );
  @override
  Widget build(BuildContext context) {
    var arrcolors = [
      Colors.red,
      Colors.greenAccent,
      Colors.green,
      Colors.grey,
      Colors.brown
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.purpleAccent,
      ),
      body:Container(
        // color: bgColor,
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.health_and_safety, size: 35, color: Colors.blue),
                      ),
                      TextSpan(
                        text: ' BMI',
                        style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in Kgs',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in feets',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inches',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  if(wt!=""&&ft!=""&&inch!=""){
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);
                      var totalinch = (ift*12)+iinch;
                      var totalm = (totalinch*2.54)/100;
                      var bmi = iwt/(totalm*totalm);
                      var msg = "";
                      if(bmi>25){
                        msg = "You're OverWeight!!";
                        gradient = LinearGradient(
                          colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
                          begin: FractionalOffset(1.0, 0.0),
                          end: FractionalOffset(0.0, 1.0),
                        );
                        // bgColor = Colors.orange.shade200;
                      }
                      else if(bmi<18){
                        msg = "You'ar UnderWeight!!";
                        gradient = LinearGradient(
                          colors: [Colors.redAccent, Colors.deepOrange],
                          begin: FractionalOffset(1.0, 0.0),
                          end: FractionalOffset(0.0, 1.0),
                        );
                        // bgColor = Colors.red.shade200;
                      }
                      else{
                        msg = "You're Healthy!!";
                        gradient = LinearGradient(
                          colors: [Colors.greenAccent, Colors.green],
                          begin: FractionalOffset(1.0, 0.0),
                          end: FractionalOffset(0.0, 1.0),
                        );
                        // bgColor = Colors.green.shade200;
                      }
                      result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                      setState(() {

                      });
                  }
                  else{
                    setState(() {
                      result = "Fill All the Required Field";
                    });

                  }
                },
                    child: Text('Calculate',style: TextStyle(
                      color: Colors.white
                    ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple
                ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(result,style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

