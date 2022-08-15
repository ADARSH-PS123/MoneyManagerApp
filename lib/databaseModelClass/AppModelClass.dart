class ModelClass{
ModelClass({ required this.id,required this.amount,required this.category,required this.date, this.comment="",bool forUpdate=false});
String id;
String category;
String amount;
String date;
String comment;

static ModelClass toModelClass( Map<String,Object?> dataMap){
 String id=dataMap['id'] as String;
String category=dataMap['category'] as String;
String amount=dataMap['amount'] as String;
String date=dataMap['date'] as String;
String comment=dataMap['comment'] as String;
return ModelClass(id: id, amount: amount, category: category, date: date,comment: comment);
}

}