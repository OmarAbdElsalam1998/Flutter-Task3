import 'dart:convert';

import 'package:addtasks/model.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart";
class APIHelper{

  Future<List<Task>> getAllTasks() async{
    var url=Uri.https("api.mohamed-sadek.com","Task/Get");
    var res=await get(url);
    var response=jsonDecode(res.body)['Data'] as List;
    List<Task> list=response.map((data) => 
     Task(
      ID:data["ID"],
      Title: data["Title"],
      IsDone: data["IsDone"],
      CreatedDate: data["CreatedDate"]
     )
    ).toList();
    


  
  return list;
  }
  saveTask(AddNewTask task) async{
    var url=Uri.https("api.mohamed-sadek.com","Task/POST");
    var res=await post(url,
    headers: <String,String>{
      'Content-Type':'application/json;charset=UTF-8'},
      body:jsonEncode(<String,Object>{
        "Title":task.Title
      }));
      var data=jsonDecode(res.body);
      return data;
  }
  Future<bool> DeleteTask(int id) async{
    var url=Uri.https( "api.mohamed-sadek.com", "/Task/Delete", {'id': id.toString()});
    var res= await delete(url);
    return jsonDecode(res.body)["Success"] as bool;
  }

  // ignore: non_constant_identifier_names
   updateTask(int id,String title,bool IsDone)async{
     var url=Uri.https("api.mohamed-sadek.com","/Task/PUT");
    var res=await post(url,
    headers: <String,String>{
      'Content-Type':'application/json;charset=UTF-8'},
   
      body:jsonEncode(<String,Object>{
          "Title":title,
          "ID":id,
          "IsDone":IsDone,
        })
        
      );
      
  }
}
