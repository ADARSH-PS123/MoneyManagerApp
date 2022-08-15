import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager/databaseModelClass/AppDatabase.dart';
import 'package:money_manager/designs/listTile.dart';

import '../databaseModelClass/AppModelClass.dart';

class AppListView extends StatelessWidget {
  final itemCount;
 final ValueNotifier<List<ModelClass>> ls;
  const AppListView({Key? key,required this.itemCount,required this.ls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (BuildContext cxt, int index){
      return Padding(
        padding: const EdgeInsets.only(right: 6,left: 6),
        child: AppListTile(index: index, inls: ls,),
      );
    }, separatorBuilder: (cxt, int value){ 
      return  Divider(height: 0,);}
   , itemCount: itemCount );
  }
}