
import 'package:addtasks/model.dart';
import "package:flutter/material.dart";
import 'package:addtasks/APIHelper.dart';
class TasksList extends StatefulWidget {
  const TasksList({ Key? key }) : super(key: key);

  @override
  State createState() => _TasksListState();
}
 
class _TasksListState extends State<TasksList> {
  APIHelper api=APIHelper();
  List<Task> tasks=[];
  fetchData() async{
    var list =await api.getAllTasks();
    setState(() {
      tasks=list;
    });
  }
  deleteTask(int id)async{
   await api.DeleteTask(id);
       fetchData();

  }
    @override

    void initState(){
      fetchData();
    }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Tasks${tasks.length}"),
      ),
      body:(tasks.isEmpty)?Text("loading......."):
      ListView.builder(
        itemCount: tasks.length,
        itemBuilder:((context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 251, 251, 251),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
          title: Text(tasks[index].Title,style:
           TextStyle(color:Colors.deepPurple,fontWeight: FontWeight.bold),),
          subtitle:Text(tasks[index].CreatedDate.toString(),style:
           TextStyle(color:Color.fromARGB(255, 83, 82, 82)),),
          trailing: Container(
            width: 100,
            child:Row(
              children: [
                 IconButton(onPressed:(){
                  Navigator.of(context).pushNamed("/edit",arguments:{"id":tasks[index].ID.toString(),"Title":tasks[index].Title,"IsDone":tasks[index].IsDone});
                 }, icon: Icon(Icons.edit,color: Color.fromARGB(255, 21, 62, 224))),
                 IconButton(onPressed:(){
                  deleteTask(tasks[index].ID);
                 }, icon: Icon(Icons.delete_forever_rounded,color: Color.fromARGB(255, 224, 35, 21),)),
              ],
            )
          ),
        )
        );
        }),
        
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed("/add");
          },
          child: Icon(Icons.add),
        ),
        
      );
  
  }
}