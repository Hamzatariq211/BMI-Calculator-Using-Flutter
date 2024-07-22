import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {

final double bmiscore;


final int age;

String? bmiStatus;

String? bmiInterpretation;

Color? bmiStatusColor;

   ScoreScreen({Key?key ,required this.bmiscore,required this.age}): super(key: key);

  @override
  Widget build(BuildContext context) {
    setbmiinterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bmi Score"),
      ),

      body: Container(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text("Your Score", style: TextStyle(fontSize: 30 , color: Colors.black),),

              const SizedBox(height: 20,),

              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment("UnderWeight", 18.5, Colors.red),
                  GaugeSegment("Normal", 6.4, Colors.green),
                  GaugeSegment("Overweight", 5, Colors.orange),
                  GaugeSegment("Obese", 10.1, Colors.pink),

                ],

                valueWidget: Text(bmiscore.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 40),

                ),
                currentValue: bmiscore.toDouble(),

                needleColor: Colors.blue,

              ),
              const SizedBox( height: 10,),

              Text(bmiStatus!,
              style: TextStyle(fontSize: 20,color: bmiStatusColor),
              ),
              const SizedBox( height: 10,),
              Text(bmiInterpretation!,
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){Navigator.pop(context);},
                      child: const Text("Recalculate")),

                  SizedBox(width: 10,),

                  ElevatedButton(onPressed: (){
                    Share.share("Your Bmi is ${bmiscore.toStringAsFixed(1)} at age $age");

                  },
                      child: const Text("Share"))

                ],
              )

            ],

          ),
        ),


      ),




    );
  }

  void setbmiinterpretation(){
    if(bmiscore>50) {
      bmiStatus= "Obese";
      bmiInterpretation= "Please work to reduce Obesity";
      bmiStatusColor=Colors.pink;
    } else if(bmiscore>=25) {
      bmiStatus= "Overweight";
      bmiInterpretation= "Do regular exercise & reduce the weight";
      bmiStatusColor=Colors.orange;
    } else if(bmiscore>=18.5) {
      bmiStatus= "Normal";
      bmiInterpretation= "Enjoy You Are Fit";
      bmiStatusColor=Colors.green;
    } else if(bmiscore < 18.5) {
      bmiStatus= "Underweight";
      bmiInterpretation= "Try to increase weight";
      bmiStatusColor=Colors.red;
    }






  }


}
