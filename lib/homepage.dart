import 'dart:math';

import 'package:bmi/height_widget.dart';
import 'package:bmi/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'age_weight_widget.dart';
import 'gender_widget.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int gender= 0;
  int _height=150;

  int _age= 30;
  int _weight=50;

  double _bmiscore=0;


bool _isFinished=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bmi Calculator'),
      ),

      body: SingleChildScrollView(
        child: Container(
         padding: const EdgeInsets.all(12),
         child: Card(
           elevation: 12,
           shape: const RoundedRectangleBorder(),
           child: Column(
             children: [
               //widget for gender selection
               GenderWidget(onChange: (genderVal){
                 gender = genderVal;
               },),

               HeightWidget(onChange: (heightval)
                 {
                   _height= heightval;

                 },),

               Row(
                 children: [
                   AgeWeightWidget(onChange: (ageval){
                     var _age=ageval;
                   }, title: "Age", initValue: 30, min: 0, max: 100),


                   AgeWeightWidget(onChange: (weightval){
                     var _weight=weightval;
                   }, title: "Weight(kg)", initValue: 50, min: 0, max: 200),

                 ],
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 20,
                 horizontal: 60,),

                 child: SwipeableButtonView(
                     isFinished:_isFinished,
                     onFinish: ()async
                     {
                       await Navigator.push(context,
                       PageTransition(child: ScoreScreen(bmiscore: _bmiscore, age:_age), type: PageTransitionType.fade)
                       );

                      setState(() {
                        _isFinished=false;
                      });

                     },
                     onWaitingProcess: (){
                       CalculateBmi();
                       Future.delayed(Duration(seconds: 1),(){
                         setState(() {
                           _isFinished=true;
                         });


                       }
                       );




                       
                     },
                     activeColor: Colors.blue,
                     buttonWidget: const Icon(
                       Icons.forward,
                       color: Colors.black,
                     ),
                     buttonText: "Calculate"),
               )






             ],
           ),
         ),
        ),
      ),


    );
  }


  void CalculateBmi(){
_bmiscore=_weight/pow(_height/100, 2);
    
  }



}

