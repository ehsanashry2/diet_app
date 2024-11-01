class MealModel{
  int id;
  String name;
  String image;
  double price;
  int quantity ;
  MealModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}