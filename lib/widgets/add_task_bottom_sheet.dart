import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/custtom_text_field.dart';

class AddTask extends StatelessWidget {
   AddTask({Key? key}) : super(key: key);
  TextEditingController titleController=TextEditingController();
   TextEditingController timeController=TextEditingController();
   TextEditingController dateController=TextEditingController();

   @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                controller: titleController,
                labelText:'Task Title' ,
                prefixIcon: Icon(Icons.title),

           ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: timeController,
                  onTap: (){
                    showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now()).then((value) {
                          timeController.text=value!.format(context).toString();
                        }
                        );
                  },
                  labelText:'Task Time' ,
                  prefixIcon: Icon(Icons.watch_later_outlined),

                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: dateController,
                  onTap: (){
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2023-12-30')
                    ).then((value) {
                      dateController.text=DateFormat.yMd().format(value!);
                    });
                  },
                  labelText:'Task Date' ,
                  prefixIcon: Icon(Icons.calendar_today),

                ),




              ]),
        ),
      ),
    );
  }
}
