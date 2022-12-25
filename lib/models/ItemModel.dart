import 'package:flutter/cupertino.dart';

var data = [
  {
    "name": "LAPTOPS GAMING",
    "price": 25.0,
    "fav": false,
    "rating": 4.5,
    "category": "Asus",
    "description": "ASUS ZEN BOOK UM431DA-AM003T (AMD Ryzen™ 5 3500U - 8GB - 512GBSSD - Radeon® Vega 8 Itergrated Graphics -14.0FHD - Win10 H) SILVER BLUE10 H SILVER BLUE",
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUvv9Qnyi9J70_TtO_dRGDOEaU0WIEPnQKSQ&usqp=CAU"
  },
  {
    "name": "Dell cor i5 ram 8",
    "price": 200.0,
    "fav": false,
    "rating": 4.5,
    "category": "Dell",
    "description": "Dell latitude 5410 Laptop - 11th Intel Core I5 -10210U, 8GB RAM, 1TB HDD, 14 HD, Intel UHD Graphics, Ubuntu",
    "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkK25JkTchPaUJUWSlmn2F_sn9jHk1ugNBkg&usqp=CAU"

  },
  {
    "name": "CROSSHAIR 17 GAMING",
    "price": 299.0,
    "fav": false,
    "rating": 4.5,
    "category": "hp",
    "description": "Crosshair 17 Gaming Laptop 17.3” FHD IPS 144Hz (72% NTSC) 11th Generation Intel Octa-core i7-11800H 32GB RAM 1TB SSD GeForce RTX 3050 Ti 4GB USB-C Backlit Keyboard Win10 + HDMI Cable",
    "image":
        "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RWBrzy?ver=85d4&q=90&m=6&h=705&w=1253&b=%23FFFFFFFF&f=jpg"
  },
  {
    "name": "IdeaPad Gaming 3",
    "price": 3001.0,
    "fav": false,
    "rating": 3.5,
    "category": "Lenovo",
    "description": "Lenovo IdeaPad Gaming 3 Laptop - Ryzen 7 5800H 8Cores, 16GB RAM, 512GB RAM, NVIDIA GeForce RTX 3050 4GB GDDR6 Graphics, 15.6 FHD 1920x1080 IPS 120Hz, Backlit Keyboard, Dos - Black + Gaming RGB Mouse",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0I6WUzes3xNkNpOFse0sOlmt_rice58Rwvw&usqp=CAU"
  },
  {
    "name": "notebook g5",
    "price": 25.0,
    "fav": false,
    "rating": 4.5,
    "category": "hp",
    "description": "HP 255 G8 Laptop - Ryzen 5 3500U, 8 GB RAM, 1 TB HDD, AMD Radeon Vega 8 Graphics, 15.6-Inch HD, DOS - Asteroid silver",

    "image":
        "https://england.edu/wp-content/themes/englandedu/images/articles/laptop.jpg"
  },
  {
    "name": "Laptop Dell Windows White",
    "price": 214.0,
    "fav": false,
    "rating": 4.0,
    "category": "Dell",
    "description": "Dell latitude 5410 Laptop - 11th Intel Core I5 -10210U, 8GB RAM, 1TB HDD, 14 HD, Intel UHD Graphics, Ubuntu",

    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc09ckIhcldLxnYy_iUWe1Fp2R0gX4epTayg&usqp=CAU"
  },
  {
    "name": "Victus 15 Gaming",
    "price": 205.0,
    "fav": false,
    "rating": 4.0,
    "category": "hp",
    "description": "HP Victus 15-fa0031dx Gaming Laptop - 12th i5-12450H 8-Cores , 8GB RAM, 512GB SSD, Nvidia GeForce GTX 1650 4GB GDDR6 Graphics, 15.6 FHD ( 1920x1080) 144Hz, Backlit Keyboard, Windows 11 - Mica Silver",
    "image":
        "https://england.edu/wp-content/themes/englandedu/images/articles/laptop.jpg"
  },
  {
    "name": "Legion 5 Gaming",
    "price": 200.0,
    "fav": false,
    "rating": 4.9,
    "category": "Lenovo",
    "description": "Lenovo Legion 5 Pro Laptop - 11th Intel Core i7-11800H, 16GB RAM, 512GB SSD, NVIDIA RTX 3050 Ti 4GB GDDR6 Graphics, 16 WQXGA (2560x1600) IPS 500nits 165Hz, 4-Zone RGB Backlit KB, Dos - Storm Grey",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5FGMEwIkOuwZXgtqmyo3mlXF_AC0F7Pi0_g&usqp=CAU"
  }
];

class ShopItemModel {
  String name;
  double price;
  bool fav;
  double rating;
  String image;
  String category;
  String description;
  int id;
  int? shopId;

  ShopItemModel(
      {this.shopId,
      required this.id,
      required this.fav,
      required this.rating,
      required this.price,
      required this.image,
      required this.category,
      required this.description,
      required this.name});

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      name: json['name'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}
