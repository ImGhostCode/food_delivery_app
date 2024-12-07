import 'package:food_delivery_app/dish/model/ingridient_model.dart';

class DishModel {
  final String name;
  final String picture;
  final String? description;
  final double rate;
  final int numberOfRates;
  final int time;
  final int? kcal;
  final double price;
  final List<IngridientModel>? ingridients;

  DishModel({
    required this.name,
    required this.picture,
    this.description,
    required this.rate,
    required this.numberOfRates,
    required this.time,
    this.kcal,
    required this.price,
    this.ingridients,
  });
}
