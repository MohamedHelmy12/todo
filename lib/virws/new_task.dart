import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cupits/app_state.dart';

import '../cupits/app_cupit.dart';
import '../widgets/initial_page.dart';
import '../widgets/item_builder.dart';

class NewTask extends StatelessWidget {
   const NewTask({super.key });


  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {

      },
      builder:(context, state) =>
      AppCubit.get(context).newTasks.length>0?ListView.separated(
          itemBuilder: (context, index) => buildItem(AppCubit.get(context).newTasks[index],context),
          separatorBuilder: (context, index) => Container(
            height: 2,
            width: 2,
            color: Colors.grey[300],
          ),
          itemCount: AppCubit.get(context).newTasks.length): buildInitialPage()
    );
  }


}
