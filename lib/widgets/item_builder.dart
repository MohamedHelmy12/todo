import 'package:flutter/material.dart';

import '../cupits/app_cupit.dart';

Widget buildItem(Map model,context) {
  return Dismissible(
    key: Key(model['id'].toString()),
    onDismissed: (direction) {
      AppCubit.get(context).delet(id: model['id']);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(
                '${model['time']}'
            ),
            radius: 48,

          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${model['title']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:20
                  ),),
                Text('${model['date']}')
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () =>AppCubit.get(context).updateData(status: 'done', id:model['id'] ) ,
              icon: Icon(Icons.check_box,color: Colors.green,)),
          IconButton(
              onPressed: () =>AppCubit.get(context).updateData(status: 'archive', id:model['id'] ) ,
              icon: Icon(Icons.archive,color: Colors.black45,))


        ],
      ),
    ),
  );
}
