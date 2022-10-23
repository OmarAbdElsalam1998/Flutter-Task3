import 'package:addtasks/APIHelper.dart';
import 'package:addtasks/model.dart';
import 'package:flutter/material.dart';
class AddTask extends StatefulWidget {
  const AddTask({ Key? key }) : super(key: key);

  @override
  State createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  APIHelper api=APIHelper();
  AddNewTask task=AddNewTask(Title: "");
  var form=GlobalKey<FormState>();

  saveTask(){
    if(form.currentState!.validate()){
      form.currentState!.save();
      api.saveTask(task);
    } 

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
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
                    task.Title=newValue!;
                  });
                },
                decoration: InputDecoration(

                  hintText: "Add Task",
                  labelText: "Task",
                  border: OutlineInputBorder(),
                ),
                
  
             ) ,
             ElevatedButton(onPressed: saveTask, child: Text("Add Task")) 
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