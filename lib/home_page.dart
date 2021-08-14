

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ylabs_task2/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final StateController stateController = Get.put(StateController());

    return Scaffold(

      body: Center(
        child: Container(
          margin: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(30),child: Text("Kimi no Namaewa", style: Theme.of(context).textTheme.headline6,),),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                labelText: "Masukkan namamu"),
                onChanged: (value){stateController.changeName(value);},
                ),
              Padding(padding: EdgeInsets.all(30),child: Text("Apa warna kesukaanmu", style: Theme.of(context).textTheme.headline6,),),
              Obx(() => DropdownButton(
                value: stateController.firstColor.value,
                items: [
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.lightBlue),value: Colors.lightBlue[500],),
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.lightGreen),value: Colors.lightGreen[500],),
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.orange),value: Colors.orange[500],),
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.pink),value: Colors.pink[500],),
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.grey),value: Colors.grey[500],),
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.lime),value: Colors.lime[500],),
                  DropdownMenuItem(child: Container(width: 30,height: 24,color: Colors.teal),value: Colors.teal[500],),
                ],
                onChanged: (Color? color){stateController.changeColor(color??Colors.lightBlue);},
                )),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){Get.toNamed('/cv');},
                  child: Text("Mari Berkenalan"))    
            ],
          ),
        ),
      )
      
    );
  }
}