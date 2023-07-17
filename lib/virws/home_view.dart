import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cupits/app_cupit.dart';
import 'package:todo/cupits/app_state.dart';
import 'package:todo/virws/archieved_taske.dart';
import 'package:todo/virws/done_taske.dart';
import 'package:todo/virws/new_task.dart';

import '../widgets/add_task_bottom_sheet.dart';

class Home extends StatelessWidget {

   var scaffoldKey=GlobalKey<ScaffoldState>();
   var formKey=GlobalKey<FormState>();

  AddTask addTask=AddTask();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppState>(
       listener: (context, state) {},
        builder: (context, state) => Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(AppCubit.get(context).titles[AppCubit.get(context).currentIndex]),
          ),
          body:AppCubit.get(context).body[AppCubit.get(context).currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if(AppCubit.get(context).isBottomSheetShown){
                scaffoldKey.currentState!.showBottomSheet(elevation: 24,
                        (context) => Form(
                            key: formKey,
                            child: addTask)).closed.then((value) {
                  AppCubit.get(context).changeFAB(isshow: true,icon:Icons.edit );
                });

                AppCubit.get(context).changeFAB(isshow: false,icon:Icons.add );

              }
              else{
                if(formKey.currentState!.validate()){
      AppCubit.get(context).insertToDatabase(
      title: addTask.titleController.text,
      time: addTask.timeController.text,
      date: addTask.dateController.text

      ).then((value) {
      Navigator.pop(context);
      AppCubit.get(context).changeFAB(isshow: true,icon:Icons.edit );

      });
                };}
            }
  ,
            child: Icon(AppCubit.get(context).fIcon)
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              AppCubit.get(context).onTap(index);
            },
            currentIndex: AppCubit.get(context).currentIndex,
            type:BottomNavigationBarType.fixed ,
            items:const [
              BottomNavigationBarItem(icon:Icon(Icons.menu ),label: 'Tasks'),
              BottomNavigationBarItem(icon:Icon(Icons.check_circle),label: 'Done'),
              BottomNavigationBarItem(icon:Icon(Icons.archive_outlined ),label: 'Archived'),
            ],

          ),
        ),
      ),
    );
  }


}

