class CarosalModel {
  String image;

  CarosalModel(this.image);
}

List<CarosalModel> carosal =
    carosaldata.map((item) => CarosalModel(item['image'])).toList();
var carosaldata = [
  {"image": "assets/images/1.png"},
  {"image": "assets/images/2.png"},
  {"image": "assets/images/4.jpg"},
];
