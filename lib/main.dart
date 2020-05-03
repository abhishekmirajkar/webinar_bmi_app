import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double bmi =0;
  String bmihealth = null;

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();


  void calculate() {
    
   setState(() {

     int age = int.parse(_ageController.text);
     double height = double.parse(_heightController.text);
     double weight = double.parse(_weightController.text);


     print(age);
     print(height);
     print(weight);


     bmi = (weight / (height*height)) *10000;

     print(bmi);

     if(bmi >= 25.0 && bmi<29.9){
       bmihealth="Overweight";
     }else if (bmi >= 18.5 && bmi< 25.0){
       bmihealth = "Healthy";
     }else if (bmi >= 29.9){
       bmihealth = "Obese";
     }else{
       bmihealth="Underweight";
     }

     print(bmihealth);





   });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text("One Touch BMI",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        ),
        body: Column(
          children: <Widget>[
            Image.asset("images/back.png"),

            ListTile(
              leading: Icon(Icons.person,color: Colors.teal,),
              title: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Age",
                  hintText: "Enter Your Age"
                ),
              ),
              
            ),
            ListTile(
              leading: Icon(Icons.insert_chart,color: Colors.blue,),
              title: TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height",
                    hintText: "Enter Your Height in cms"
                ),
              ),

            ),
            ListTile(
              leading: Icon(Icons.line_weight,color: Colors.deepPurple,),
              title: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight",
                    hintText: "Enter Your Weight in kgs"
                ),
              ),

            ),
            
            RaisedButton(onPressed: calculate,
              elevation: 3.0,
            color: Colors.orange[400],
            child: Text("Calculate"),),


            Container(
              child: Text("Your BMI value is ${bmi.toStringAsFixed(2)}"),
            ),
            Container(
              child: Text("You are $bmihealth"),
            ),



          ],
        )
      ),
    );
  }


}
