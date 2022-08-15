


import 'package:flutter/material.dart';
import 'package:money_manager/databaseModelClass/AppDatabase.dart';
import 'package:money_manager/databaseModelClass/AppModelClass.dart';
import 'package:money_manager/designs/listTile.dart';
import 'package:money_manager/designs/showDatePicker.dart';

ValueNotifier<int> radioStatus = ValueNotifier(0);
Future dialogShower(
    {required BuildContext context, bool isUpdate = false, int index = 0}) {
  TextEditingController incomeExpenceController =
      TextEditingController(text: isUpdate ? ls.value[index].amount : "");
  TextEditingController commentController =
      TextEditingController(text: isUpdate ? ls.value[index].comment : "");
  final formKey = GlobalKey<FormState>();
  if (isUpdate) {
    publicDate.value = ls.value[index].date;
  }

  return showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return ValueListenableBuilder(
            valueListenable: radioStatus,
            builder: (BuildContext ctx, int value, _) {
              return AlertDialog(
                scrollable: true,
                title: const Text(
                  "Choose Option",
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (isUpdate) {
                            ModelClass ob = ModelClass(
                                id: id,
                                amount: incomeExpenceController.text,
                                category: radioStatus.value == 0
                                    ? "Income"
                                    : "Expence",
                                date: publicDate.value,

                                ///from show date picker file
                                comment: commentController.text);
                            updateDatabase(ob);

                            Navigator.of(context).pop();
                            ls.notifyListeners();
                          
                          } else {
                            DateTime time = DateTime.now();
                            ModelClass ob = ModelClass(
                                id: time.millisecondsSinceEpoch.toString(),
                                amount: incomeExpenceController.text,
                                category: radioStatus.value == 0
                                    ? "Income"
                                    : "Expence",
                                date: publicDate.value,

                                ///from show date picker file
                                comment: commentController.text);
                            putData(ob);

                            Navigator.of(context).pop();
                            ls.notifyListeners();

                          }
                        }
                      },
                      child: Text("Confirm")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"))
                ],
                content: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: true,
                        validator: (value){
                            if(value.toString()==""){
                              return 'Empty Field';
                            } else{
                           
                              return null;
                            }
                            
                            },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter income or Expence",
                          ),
                        controller: incomeExpenceController,
                      ),
                      TextFormField(
                        controller: commentController,
                        decoration: InputDecoration(hintText: "Enter Comment"),
                      ),
                      TextButton(
                        onPressed: () {
                          datePicker(context);
                          publicDate.notifyListeners();
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: ValueListenableBuilder(
                          valueListenable: publicDate,
                          builder: (BuildContext cnt, String st, _) {
                            return Text(publicDate.value == ""
                                ? "Pick date"
                                : publicDate.value);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 0,
                              groupValue: radioStatus.value,
                              onChanged: (value) {
                                radioStatus.value = value as int;
                                radioStatus.notifyListeners();
                              }),
                          const Text("Income"),
                          Radio(
                              value: 1,
                              groupValue: radioStatus.value,
                              onChanged: (value) {
                                radioStatus.value = value as int;
                                radioStatus.notifyListeners();
                              }),
                          const Text("Expence")
                        ],
                      ),
                    ],
                  ),
                ),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
              );
            });
      });
}
