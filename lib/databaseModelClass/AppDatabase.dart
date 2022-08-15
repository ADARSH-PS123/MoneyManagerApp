


import 'package:flutter/material.dart';
import 'package:money_manager/databaseModelClass/AppModelClass.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List <ModelClass>>ls=ValueNotifier([]);
ValueNotifier<List <ModelClass>>incomels=ValueNotifier([]);
ValueNotifier<List <ModelClass>>expencels=ValueNotifier([]);
 late Database db;

void putData(ModelClass ob)async{



 await db.transaction((txn) async {
    await txn
        .rawInsert('INSERT INTO Test(id, category,amount,comment,date) VALUES(?,?,?,?,?)', [ob.id,ob.category,ob.amount,ob.comment,ob.date ]);
  });


  ls.value.clear();
 await readDatabase();
ls.notifyListeners();

}



void deleteDate({required int index,required String id})async{
  
await db.rawDelete('DELETE FROM Test WHERE id=?', [id]);
ls.value.clear();
incomels.value.clear();
expencels.value.clear();
await readDatabase();
  ls.notifyListeners();
}




Future<void> openBase() async {
  db = await openDatabase("dbfff", version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE Test (id TEXT, category TEXT, amount TEXT,comment TEXT ,date TEXT)');
  });
}


Future readDatabase() async {
  final list = await db.rawQuery('SELECT * FROM Test');
  list.forEach((element) { 
    ls.value.add(ModelClass.toModelClass(element));
  });


  //spliting the ls into 2

  incomels.value.clear();
  expencels.value.clear();
 ls.value.forEach((element) {

  
  if (element.category=="Income"){
    incomels.value.add(element);
  
  }
  else{
    expencels.value.add(element);
  
  }
 });

incomels.notifyListeners();
expencels.notifyListeners();
print(incomels.value.length);
print(expencels.value.length);

}

updateDatabase(ModelClass ob)async{


  await db.rawUpdate(
    'UPDATE Test SET  amount = ?,category = ?, date= ?, comment = ? WHERE id = ?',
    [ob.amount,ob.category,ob.date,ob.comment,ob.id]);
incomels.value.clear();
expencels.value.clear();
ls.value.clear();
await readDatabase();
ls.notifyListeners();
expencels.notifyListeners();
incomels.notifyListeners();

}