import 'package:ShoppingApp/controller/homePageController.dart';
import 'package:ShoppingApp/models/ItemModel.dart';
import 'package:ShoppingApp/pages/ItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category_page extends StatefulWidget {
   Category_page({Key? key,required this.title}) : super(key: key);
   late String title;

  @override
  State<Category_page> createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
   final HomePageController controller = Get.find();


   @override
  void dispose() {
     controller.get_category();
     controller.items_category.clear();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: Obx(()=> controller.items_category.isEmpty ? Center(
          child: CircularProgressIndicator(),
        ): ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final ShopItemModel item = controller.items_category[index];

            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 0),
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 15,
              child:  GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailPage(itemId: item.id)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      item.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  Column(
                    children: [
                      Text(
                        item.name,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                           "\$${item.price.toString()}",
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Text(
                            item.category,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  ],
                ),
              ),
            );
          },
          itemCount: controller.items_category.length,
        ),),
      ),
    );
  }
}
