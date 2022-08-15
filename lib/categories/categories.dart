import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager/databaseModelClass/AppModelClass.dart';
import 'package:money_manager/designs/AppListView.dart';

import '../databaseModelClass/AppDatabase.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
   

  @override
  Widget build(BuildContext context) {
    return
     Column(
      children: [
        TabBar(labelColor: Colors.blue,indicatorColor: Colors.blue,unselectedLabelColor: Colors.black
          ,controller: tabController, tabs: [
          Tab(
            text: "Income",
          ),
          Tab(
            text: "Expense",
          )
        ]),
         Expanded(
            child: TabBarView(controller: tabController
              ,children: [
ValueListenableBuilder(valueListenable: incomels, builder: (BuildContext ctx,List<ModelClass>ls,_){
   return AppListView(itemCount: incomels.value.length,ls: incomels,);
}),
ValueListenableBuilder(valueListenable: expencels, builder: (BuildContext ctx,List<ModelClass>ls,_){
 return  AppListView(itemCount: expencels.value.length,ls: 
 expencels,);
}),


          
        ]))
      ],
    );
  }
}
