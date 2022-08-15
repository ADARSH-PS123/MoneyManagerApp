import 'package:flutter/material.dart';
import 'package:money_manager/databaseModelClass/AppModelClass.dart';

import 'package:money_manager/designs/AppListView.dart';


import '../databaseModelClass/AppDatabase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext ctx,List<ModelClass> lis, _) {
        return AppListView(itemCount: ls.value.length,ls: ls,);
      },valueListenable: ls,
    );
  }
}