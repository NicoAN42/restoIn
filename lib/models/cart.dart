import 'package:intl/intl.dart';
import 'package:restoin/models/food.dart';
import 'package:restoin/models/restaurant.dart';

class Cart {
  Restaurant resto;
  List<Food> foods = [];
  List<Extra> extras = [];
  List<int> qtys = [];
  List<String> notes = [];

  Cart({this.resto, this.foods, this.qtys, this.notes});

  String getPrice() {
    int p = 0;
    final formatter =
        NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);

    for (int i = 0; i < foods.length; i++) {
      if (foods[i].name == "Chunky Pie" && extras.isNotEmpty) {
        for (int j = 0; j < extras.length; j++) {
          p += extras[j].price * qtys[i];
        }
      }
      p += foods[i].price * qtys[i];
    }
    return formatter.format(p);
  }
}

class Extra {
  String name;
  int price;

  Extra({this.name, this.price});
}
