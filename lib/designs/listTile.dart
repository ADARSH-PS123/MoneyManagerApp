import 'package:flutter/material.dart';
import 'package:money_manager/databaseModelClass/AppDatabase.dart';
import 'package:money_manager/designs/AppAlertDialog.dart';

import '../databaseModelClass/AppModelClass.dart';
String id="";
class AppListTile extends StatelessWidget {
  final int index;
  final ValueNotifier<List<ModelClass>> inls;
// ignore: use_key_in_widget_constructors
  AppListTile({required this.index,required this.inls});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text("Rs. ${inls.value[index].amount}"),
      subtitle: Text(inls.value[index].comment),
      leading: CircleAvatar(radius: 37,backgroundColor: inls.value[index].category == "Income"
                ? Colors.green
                : Colors.red,
          child: Padding(
            padding: const EdgeInsets.only(top: 16,bottom: 15),
            child: Column(
              children: [
                Text(
        inls.value[index].date,
        style:const TextStyle(fontSize: 9,color: Colors.white),
      ),Text(inls.value[index].category,style: TextStyle(fontSize: 9,color: Colors.white),)
              ],
            ),
          )),
      trailing: Wrap(
        children: [ IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              id=inls.value[index].id;
              
              dialogShower(context: context,isUpdate: true,index: index);
              updateDatabase(inls.value[index]);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              deleteDate(index: index,id:inls.value[index].id );
            },
          ),
        ],
      ),
    ));
  }
}
