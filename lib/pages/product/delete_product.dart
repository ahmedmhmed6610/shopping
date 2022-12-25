import 'package:ShoppingApp/controller/homePageController.dart';
import 'package:ShoppingApp/models/ItemModel.dart';
import 'package:ShoppingApp/pages/ItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delete_product extends StatefulWidget {
  Delete_product({Key? key}) : super(key: key);


  @override
  State<Delete_product> createState() => _Delete_product();
}

class _Delete_product extends State<Delete_product> {
  final HomePageController controller = Get.find();


  @override
  void dispose() {
    // controller.get_category();
    // controller.items_category.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select'),
        centerTitle: true,
      ),
      body: Container(
        child: Obx(()=> controller.items_search.isEmpty ? Center(
          child: CircularProgressIndicator(),
        ): ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final ShopItemModel item = controller.items_search[index];

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
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                            onPressed: ()=> controller.delete_prodect(item.id), child: Text('Delete')),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: controller.items_search.length,
        ),),
      ),
    );
  }
}
