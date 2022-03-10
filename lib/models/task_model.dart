import 'package:todo_app/database/database_register.dart';
import 'package:todo_app/models/item_model.dart';
import 'package:flutter/cupertino.dart';

class TaskModel extends ChangeNotifier {
  //item list
  List<Item> pitem = <Item>[];
  int? pending;
  int? complete;

  //fetching items
  void getAllUser() async {
    final result = await StudentDataBase.instance.readAllItem();
    if (result.isNotEmpty) {
      pitem.clear();
      pitem.addAll(result);
      pending = result.where((element) => !element.check).length;
      complete = result.where((element) => element.check).length;
      notifyListeners();
    } else {
      pitem = <Item>[];
      pending = 0;
      complete = 0;
      notifyListeners();
    }
  }

  //progres bar logic
  double progress() {
    if (complete == 0) {
      return 0.0;
    } else {
      double sum = ((complete!.toDouble()) / pitem.length.toDouble());
      if (sum == 0) {
        return 1.0;
      } else {
        return sum;
      }
    }
  }

  //filter result logic
  List<Item> fresult = <Item>[];
  void filterSearch(String query) {
    List<Item> result = <Item>[];
    if (query.isNotEmpty) {
      result = pitem
          .where((element) =>
              element.body.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    fresult.clear();
    fresult.addAll(result);
    notifyListeners();
  }

  //add Item
  void addItem(Item item) async {
    final result = await StudentDataBase.instance.insertITem(item);
    print(result.body);
    notifyListeners();
  }

  //remove Item
  void removeItem(Item item) async {
    final result = await StudentDataBase.instance.deleteItem(item.id!);
    print(result);
    notifyListeners();
  }

  //toogle item
  void toogleTask(Item item) async {
    //final itemIndex = pitem.indexOf(item);
    item.toogleCompleted();
    var itm = Item(id: item.id, body: item.body, check: item.check);
    final result = await StudentDataBase.instance.updateItem(itm);
    print(result.toString());
    notifyListeners();
  }

  //update Item
  void updateItem(Item itm) async {
    var item = Item(id: itm.id, body: itm.body, check: itm.check);
    final result = await StudentDataBase.instance.updateItem(item);
    print(result.toString());
    notifyListeners();
  }
}
