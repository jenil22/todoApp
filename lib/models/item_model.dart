//table name for item
const String itemTable = 'items';

//item fields
class ItemFields {
  static final List<String> values = [id, body, check];
  static const String id = 'mid';
  static const String body = 'body';
  static const String check = 'important';
}

//Item model
class Item {
  int? id;
  String body;
  bool check;
  Item({this.id, required this.body, this.check = false});

  void toogleCompleted() {
    check = !check;
  }

  //mapping object in json
  static Item fromJson(Map<String, dynamic> json) {
    return Item(
        id: json[ItemFields.id] as int,
        body: json[ItemFields.body] as String,
        check: json[ItemFields.check] == 1);
  }

  //convert item to json
  Map<String, dynamic> toJson() => {
        ItemFields.id: id,
        ItemFields.body: body,
        ItemFields.check: check ? 1 : 0
      };

  //copy of item
  Item copy({int? id, String? body, bool? check}) => Item(
      id: id ?? this.id, body: body ?? this.body, check: check ?? this.check);
}
