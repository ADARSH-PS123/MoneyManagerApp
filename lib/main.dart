
import 'package:flutter/material.dart';
import 'package:money_manager/categories/categories.dart';
import 'package:money_manager/databaseModelClass/AppDatabase.dart';
import 'package:money_manager/designs/AppAlertDialog.dart';
import 'package:money_manager/homeScreen/homeScreen.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await openBase();
  await readDatabase();
  runApp(MaterialApp(home: MainPage(),theme:ThemeData.light(),));
}

class MainPage extends StatelessWidget {
   MainPage({Key? key}) : super(key: key);
  ValueNotifier<int> indexNotifier=ValueNotifier(0);
  List<Widget>screens=[HomeScreen(),Categories()];
  @override
  
  Widget build(BuildContext context) {
    return 
        SafeArea(
            child: Scaffold(appBar: AppBar(title:Center(child:Text("Money Manager"))),floatingActionButton: FloatingActionButton(onPressed: (){
              dialogShower(context: context);
            },child:const Icon(Icons.add)),
      body:ValueListenableBuilder(valueListenable: indexNotifier, builder: (BuildContext ctx,int index,_){return
         screens[index];}),
      bottomNavigationBar:
      ValueListenableBuilder(valueListenable: indexNotifier, builder: (BuildContext ctx,int index,_){return
            BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
        onTap: (newIndex){
          indexNotifier.value=newIndex;
          indexNotifier.notifyListeners();


          },currentIndex: indexNotifier.value,
          )
        
        
        ;},)
      
   ));}}
       
  
      
     

     