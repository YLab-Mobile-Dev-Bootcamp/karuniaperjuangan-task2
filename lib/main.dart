import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV Juang',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CVJuangPage(),
    );
  }
}

class CVJuangPage extends StatefulWidget {
  CVJuangPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  

  @override
  _CVJuangPageState createState() => _CVJuangPageState();
}

class _CVJuangPageState extends State<CVJuangPage> {
  

  @override
  Widget build(BuildContext context) {

    final maxDimension = max(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    final minDimension = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      
      body: Center(
        child: Stack(
          
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff3a91a5),
                  height: maxDimension/6,
                ),
                Expanded(child: Container(
                  color: Color(0xfff0f0f0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: minDimension/5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Karunia Perjuangan M", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                      ),
                      Expanded(child: Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.all(25),
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text("Tentang", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              width: minDimension-25*2,
                              child: Wrap(
                                children: [
                                  Text("Halo, namaku adalah Karunia Perjuangan. Aku berasal dari Jogja. Di sini, aku mengikuti Bootcamp YLabs ID yang sangat menyenangkan. Salam kenal semua"
                                  ,textAlign: TextAlign.justify,)
                                ],
                              ),
                            ),
                            SizedBox(height: maxDimension/24,),
                            Text("Pendidikan", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              width: minDimension-25*2,
                              child: Wrap(
                                children: [
                                  Text("Universitas Gadjah Mada (2020-)"
                                  ,textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),)
                                ],
                              ),
                            ),
                            SizedBox(height: maxDimension/24,),
                            Text("Skill", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset('images/FlutterLogo.png',width: minDimension/7,),
                                Image.asset('images/BlazorLogo.png',width: minDimension/7,),
                                Image.asset('images/BlenderLogo.png',width: minDimension/7,),
                                Image.asset('images/HTMLLogo.png',width: minDimension/7,),
                                Image.asset('images/NETCoreLogo.png',width: minDimension/7,),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ))
              ],
            ),
            Positioned(
              top: maxDimension/6 -minDimension/5,
              child: CircleAvatar(
                backgroundColor: Color(0xfff0f0f0),
                radius: minDimension/5,
                child: CircleAvatar(
                  radius: minDimension/5 -5,
                  backgroundImage: AssetImage('images/MyPhoto.jpg'),
                  ),
              ))
          ],
        ),
      ),
      
    );
  }
}
