import 'package:ShoppingApp/controller/homePageController.dart';
import 'package:ShoppingApp/models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_peodect extends StatefulWidget {
   Add_peodect({Key? key}) : super(key: key);

  @override
  State<Add_peodect> createState() => _Add_peodectState();
}

class _Add_peodectState extends State<Add_peodect> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController image = TextEditingController();

   HomePageController pageController = Get.find();

   String _selected_category = 'Select';
    List<ShopItemModel> items_category = [] ;


  @override
  void initState() {

    pageController.items.forEach((el) {
      if(items_category.isEmpty){
        items_category.add(el);
      }if(items_category.where((ele) => ele.category == el.category).isEmpty ){
        items_category.add(el);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add product"),
      centerTitle: true,
      ),
      body: Column(
        children: [

          TextFormField(
            controller: image,
            decoration: InputDecoration(
              hintText: 'url image',
              labelText: 'url image',
              prefixIcon: Icon(Icons.image_outlined),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
          ),

          TextFormField(
            controller: name,
            decoration: InputDecoration(
              hintText: 'name',
              labelText: 'name',
              prefixIcon: Icon(Icons.production_quantity_limits_outlined),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
          ), TextFormField(
            controller: description,
            decoration: InputDecoration(
              hintText: 'description',
              labelText: 'description',
              prefixIcon: Icon(Icons.production_quantity_limits_outlined),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
          ),
          TextFormField(
            controller: price,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'price',
              labelText: 'price',
              prefixIcon: Icon(Icons.monetization_on_outlined),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('category',style: TextStyle(fontWeight: FontWeight.w700),),
              DropdownButton(
                elevation: 15,
                hint: Text('$_selected_category',style: TextStyle(color: Colors.black),),
                items: items_category.map((value) {
                  return DropdownMenuItem(
                    value: value.category ,
                    child: Text(value.category.toString(),style: TextStyle(fontWeight: FontWeight.normal),),
                  );
                }).toList(),
                onChanged: (val){
                  setState(() {
                    _selected_category = val.toString();
                  });
                } ,
              ),


            ],
          ),

          ElevatedButton(
            onPressed: (){
              if(image.text.isEmpty){
                Get.snackbar("Error", " empty  image ",backgroundColor: Colors.amberAccent);
              }else if(name.text.isEmpty){
                Get.snackbar("Error", " empty  name ",backgroundColor: Colors.amberAccent);
              }else if(description.text.isEmpty){
                Get.snackbar("Error", " empty  description ",backgroundColor: Colors.amberAccent);
              }else if(price.text.isEmpty){
                Get.snackbar("Error", " empty  price ",backgroundColor: Colors.amberAccent);
              }else if(_selected_category == 'Select'){
                Get.snackbar("Error", " empty  Select ",backgroundColor: Colors.amberAccent);
              }else{
                var item = ShopItemModel(name: name.text.toString().trim(),description: description.text.toString().trim(),price: double.parse(price.text.trim()),fav: false,rating:50,image:image.text.trim().toString(), id:pageController.items.length+1,category: _selected_category);
                pageController.add_prodect(item);
                Navigator.pop(context);
              }


            },
            child: Text('Save'),
          )

        ],
      ),
    );
  }
}
