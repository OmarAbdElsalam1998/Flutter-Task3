
import 'package:addtasks/APIHelper.dart';
import 'package:addtasks/model.dart';
import 'package:flutter/material.dart';
class EditTask extends StatefulWidget {
  const EditTask({ Key? key }) : super(key: key);

  @override
  State createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  APIHelper api=APIHelper();
  String taskTitle="";
  bool IsDone=false;
  var args;
 
  var form=GlobalKey<FormState>();
 
  // saveTask(){
  //   if(form.currentState!.validate()){
  //     form.currentState!.save();
  //      api.saveTask(task);
  //   }
  
    
  // }

  @override
  void initState(){
    
    
  }
  
  Widget build(BuildContext context) {
   var args=ModalRoute.of(context)?.settings.arguments as Map <String,Object>;
    return Scaffold(
      appBar: AppBar(
        title:  Text(args["id"].toString()),
        actions: [
          IconButton(onPressed: (){
            form.currentState!.reset();

          }, icon: Icon(Icons.replay))
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.all(10),
      child:Form(
        key: form,
        child: ListView(
          children: [
            SizedBox(height: 10,),
             TextFormField(
                controller:TextEditingController(text:args["Title"].toString() ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return "required";
                  }
                  if(value.length<3){
                    return "must have at least 3 characters";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    taskTitle=newValue!;
                  });
                },
                decoration: InputDecoration(

                  hintText: "Add Task",
                  labelText: "Task",
                  border: OutlineInputBorder(),
                ),
                
  
             ) ,
             SizedBox(height: 10,),
               TextFormField(
                controller:TextEditingController(text:args["IsDone"].toString() ),
                keyboardType: TextInputType.emailAddress,
               
                onSaved: (newValue) {
                  setState(() {
                    IsDone=newValue! as bool;
                  });
                },
                decoration: InputDecoration(

                  hintText: "Is Done",
                  labelText: "Is Done",
                  border: OutlineInputBorder(),
                ),
                
  
             ) ,
             ElevatedButton(onPressed:()async{
              await api.updateTask(int.parse(args["id"].toString()) ,taskTitle, IsDone as bool);
             }, child: Text("Edit Task")) 
          ],
        ),
        
      )
    ),
    floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed("/list");
          },
          child: Icon(Icons.add),
        ),
    );
  }
}