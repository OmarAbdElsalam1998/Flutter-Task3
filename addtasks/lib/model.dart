// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';

class AddNewTask{
  String Title;
  AddNewTask({required this.Title});
}
class Task{
 int  ID; 
 String Title; 
 bool IsDone; 
 String CreatedDate;

 Task({
  required this.ID,
  required this.Title,
  required this.IsDone,
  required this.CreatedDate,
 });
}