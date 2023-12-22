import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids/utils/model.dart';


class MonthSound extends StatefulWidget {
  int index ;
  MonthSound( this.index);

  @override
  State<MonthSound> createState() => _MonthSoundState();
}
List<Numbermodel> monthlist =month1();

class _MonthSoundState extends State<MonthSound> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    int i=0;
    Future _speak() async{
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(10.0);
      print(await flutterTts.getVoices);
      int count = widget.index;
      await flutterTts.speak(monthlist[count].Text);
    }
    final _controller = new PageController();
    return  Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
                'Month',style: TextStyle(color: Colors.black,fontFamily: "arlrdbd"),
            ),
            backgroundColor: Colors.orange[50],
          ),
          body: Container(
            height: 650,
            width: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/Union 12.png")
              ),
            ),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Card(
                          margin: EdgeInsets.all(20),
                          elevation: 5,
                          shadowColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: PageView.builder(
                            controller: _controller,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:monthlist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Image.asset(monthlist[widget.index].image,alignment: Alignment.topCenter,),
                              );

                            },
                          ),
                        ),
                      ),
                      Column(
                          children: [
                            InkWell(
                                onTap: ()=> _speak(),
                                child: Image.asset('assets/images/11MaskGroup3.png')),
                            Align(
                              heightFactor: 0.5,
                              child: Center(
                                    child: ListTile(
                                      trailing: InkWell(
                                        onTap: (){
                                          if(widget.index>=0 && widget.index<11){
                                            i++;
                                            print(widget.index);
                                            setState(() {
                                              widget.index++;
                                            });
                                          }
                                          _speak();
                                          // changeImage(count);
                                        },
                                        child: Image(

                                          image: AssetImage('assets/images/11MaskGroup5.png'),
                                        ),
                                      ),

                                      leading: InkWell(
                                        onTap: (){

                                          if(widget.index>0 && widget.index<=11){
                                            i--;
                                            setState(() {
                                              widget.index--;
                                            });
                                          }
                                          _speak();
                                        },
                                        child: Image(
                                          image: AssetImage('assets/images/11MaskGroup4.png'),

                                        ),
                                      ),

                                    ),
                                  ),
                            )
                          ]
                      )
                    ]
                )
            ),
          )
    );
  }
}
