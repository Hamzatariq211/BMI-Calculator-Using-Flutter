import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {

  final Function(int) onChange;

  final String title;

  final int initValue;

  final int min;

  final int max;

  const AgeWeightWidget({Key? key, required this.onChange ,required this.title,required this.initValue, required this.min,required this.max}): super(key:key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {

int counter=0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter=widget.initValue;
  }



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.grey),),


            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.remove, color: Colors.white),

                    ),
                    onTap: (){
                      setState(() {
                        if(counter > widget.min)
                          {
                            counter--;
                          }
                      });
                      widget.onChange(counter);


                    },
                  ),
                ),

const SizedBox(width: 20,),
                Text(counter.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),

                ),
                const SizedBox(width: 20,),
                InkWell(
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.add, color: Colors.white),

                  ),
                  onTap: (){
                    setState(() {
                      if(counter < widget.max)
                      {
                        counter++;
                      }
                    });
                    widget.onChange(counter);


                  },


                )


              ],
            )
          ],


        )
      ),

    );
  }
}
