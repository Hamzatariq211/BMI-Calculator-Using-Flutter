import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/src/material/colors.dart';

class GenderWidget extends StatefulWidget {

  final Function(int) onChange;

  const GenderWidget({Key? key,required this.onChange}): super(key: key);

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {


  int gender= 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
    topColor: Colors.grey[200]!,
    backColor: Colors.white10,
    borderRadius: BorderRadius.circular(20),

  );


  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
  topColor: Colors.white30,
  backColor: Colors.white10,
  borderRadius: BorderRadius.circular(20),

  );




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(color: Colors.black12),
              style: gender==1? selectedStyle : unselectedStyle,
              onSelected: (){
                setState(() {
                  gender=1;
                });
                widget.onChange(gender);



              }, onUnSelected: (){}, selected: gender==1, child: Column(
            children: [
              Image.asset("assets/images/download-removebg-preview (1).png", width: 50 ,),
              const SizedBox(
                height: 5,
              ),
              const Text("Male"),

            ],
          )),
          const SizedBox(
            width: 20,
          ),



          ChoiceChip3D(
              border: Border.all(color: Colors.black12),
              style:  gender==2? selectedStyle : unselectedStyle,
              onSelected: (){
                setState(() {
                  gender=2;
                });
                widget.onChange(gender);

              }, onUnSelected: (){},selected: gender==2, child: Column(
            children: [
              Image.asset("assets/images/Venus_symbol.svg.png", width: 50 ,),
              const SizedBox(
                height: 5,
              ),
              const Text("Female"),

            ],
          )),



        ],
      ),
    );
  }
}
