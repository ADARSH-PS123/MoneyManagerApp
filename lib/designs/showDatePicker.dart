
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
ValueNotifier<String> publicDate=ValueNotifier("");
datePicker(BuildContext cxt){

showDatePicker(context: cxt,
 initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year-1),
  lastDate: DateTime.now()).then((value) {
    publicDate.value=value!.day.toString()+"/"+value.month.toString()+"/"+value.year.toString();
    publicDate.notifyListeners();
    return value;});

}


