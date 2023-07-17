import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/cupits/app_state.dart';

import '../virws/archieved_taske.dart';
import '../virws/done_taske.dart';
import '../virws/new_task.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(AppInitialState());

  static  AppCubit get(context)=> BlocProvider.of(context);

  bool isBottomSheetShown=true;
  IconData fIcon=Icons.edit;

  void changeFAB({bool? isshow,IconData? icon}){
       isBottomSheetShown=isshow!;
       fIcon=icon!;
       emit(AppChangeFABState());
  }


  List<String> titles=[
    'New Task',
    'Done Task',
    'Achieved Task'
  ];

  List<Widget> body=[
    NewTask(),
    DOneTaske(),
    ArchievedTaske()
  ];

  int currentIndex=0;
  late Database database;
 void onTap(int index){
    currentIndex=index;
    emit(AppChangeBNBState());
  }
  List<Map> newTasks=[];
  List<Map> doneTasks=[];
  List<Map> archiveTasks=[];

  void createDatabase(){
          openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,vertion){
          print('database created');
          database.execute(
              'CREATE TABLE Task(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)'
          );
          print('table ceated');
        },
        onOpen: (database){
          getFromDatabase(database);
          print('database opened');
        }
    ).then((value) {
      database=value;

    });
  }

  Future insertToDatabase({
    String? title,
    String? time,
    String? date,}
      ) async{
    return await database.transaction((txn) async{
      await txn.rawInsert(
          'INSERT INTO Task(title,date,time,status)VALUES("$title","$date","$time","new")'
      ).then((value) {
        print('$value inserted successfully');
        getFromDatabase(database);
      });
    });
  }

  void getFromDatabase(database)
  {
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
      database.rawQuery('SELECT * FROM Task').then((value) {
      value.forEach((i){
        if(i['status']=='new'){newTasks.add(i);}
        if(i['status']=='done'){doneTasks.add(i);}
        if(i['status']=='archive'){archiveTasks.add(i);}

      });
       emit(AppSuccessGetDataState());

     });

  }

  void updateData(
      { @required String? status,
    @required int? id,})async
  {
     await database.rawUpdate('UPDATE Task SET status = ? WHERE id=?',
         ['${status}',id]).then((value) {
      getFromDatabase(database);

    });

  }

  void delet({@required id}){
    database
        .rawDelete('DELETE FROM Task WHERE id = ?', ['$id']).then((value) {
          getFromDatabase(database);
    });
  }

}