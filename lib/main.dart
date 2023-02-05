import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home : bmi(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  String result="0";
  String status="";
  bool container=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator',
                      style: TextStyle(fontWeight: FontWeight.bold,),),
        ),
        backgroundColor: Color(0xFF1746A2),
      ),
      body: Container(
        color: Color(0xFFFFF7E9),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
              child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7)
                    ),
                    filled: true,
                    labelText: 'Height',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    fillColor: Color(0xFF5F9DF7),
                  hintText: 'Enter Height (m)',
                  ),
                keyboardType: TextInputType.number,
                  controller: height,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                labelText: 'Weight',
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                hintText: 'Enter Weight (Kg)',
                filled: true,
                fillColor: Color(0xFF5F9DF7)
            ),
            keyboardType: TextInputType.number,
            controller: weight,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          ),
           Center(
             child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
             child: ElevatedButton(
               onPressed: (){
                 setState(() {
                   container = true;
                   double heightSqr = double.parse(height.text)*double.parse(height.text);
                   double bmi = (int.parse(weight.text)/heightSqr);

                   if(bmi<16.1)
                     {
                       status = "     (Underweight (Severe thinness))";
                     }
                   else if (bmi<17)
                     {
                       status ="    (Underweight (Moderate thinness))";
                     }
                   else if(bmi<18.5)
                     {
                       status="     (Underweight (Mild thinness))";
                     }
                   else if(bmi<25)
                     {
                       status = "     (Normal range)";
                     }
                   else if(bmi<30)
                     {
                       status="   (Overweight (Pre-obese))";
                     }
                   else if(bmi<35)
                     {
                       status="   (Obese (Class I))";
                     }
                   else if(bmi<40)
                     {
                       status="   (Obese (Class II))";
                     }
                   else
                     {
                       status="   (Obese (Class III))";
                     }
                   result = bmi.toString()+status;
                 });
               },
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text('  Calculate  '),
               ),
             ),),
           ),
            if(container) Center(
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Container(
                  height: 80,
                  width: 600,
                  color: Color(0xFF1746A2),
                  child: Center(
                    child: Text(
                      'BMI = '+ result,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )]
        ),
      ),
    );
  }
}

