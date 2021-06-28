import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  var output = "";
  List<dynamic> lst = [];

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemCount: lst.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.lightGreen.shade400,
                          height: 3,
                          margin: EdgeInsets.only(top: 7),
                        ),
                        Container(
                          height: 50,
                          color: Colors.lightGreen.shade100,
                          margin: EdgeInsets.only(top: 10),
                          child: (ListTile(
                            title: Text("${lst[index]}" ,
                             style: TextStyle(
                               fontFamily: 'RobotMono' ,
                               fontSize: 25.0 ,
                               color: Colors.blueGrey,
                             ),),
                            trailing: Container(
                              width: 50,
                              child: Row(
                                children: [
                                  GestureDetector(onTap: (){
                                    showDialog(context: context, builder: (context){
                            return AlertDialog(
                             title: Text("EDIT TODOS"),
                             content: TextField(
                               onChanged: (value){
                                 output = value;
                                 }
                                 
                               
                             ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                setState(() {
                                  Navigator.of(context).pop();
                                  lst.replaceRange(index, index+1, {output});
                                });
                              },style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),                             
                               child: Text("EDIT")
                              )
                            ],

                            );
                          });
                                  },child: Icon(Icons.edit)),
                                  GestureDetector(onTap: (){
                                    setState(() {
                                      lst.removeAt(index);
                                    });
                                  },child: Icon(Icons.delete)),
                                  
                                ],
                              ),
                            ),
                          )),
                        ),
                      ],
                    );
                  }),
                  floatingActionButton: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                         title: Text("ADD TODOS"),
                         content: TextField(
                           onChanged: (value){
                             if(value.length > 1){
                               output = value;
                             }else{
                               AlertDialog(
                                 content: Text("Invalid Output"),
                               );
                             }
                             
                           }
                         ),
                        actions: [
                          ElevatedButton(onPressed: (){
                            setState(() {
                              Navigator.of(context).pop();
                              lst.add(output);
                            });
                          },
                           style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                           child: Text("ADD TASK"))
                        ],

                        );
                      });
                    } ,
                    
                     label: Text("+ ADD" , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                     backgroundColor: Colors.green,                    
                    ),
                  ),
    );
  }
}
