import 'package:ShoppingApp/controller/homePageController.dart';
import 'package:ShoppingApp/models/ItemModel.dart';
import 'package:ShoppingApp/pages/CartPage.dart';
import 'package:ShoppingApp/pages/ItemDetail.dart';
import 'package:ShoppingApp/pages/about.dart';
import 'package:ShoppingApp/pages/product/add_product.dart';
import 'package:ShoppingApp/pages/product/category_page.dart';
import 'package:ShoppingApp/services/itemService.dart';
import 'package:ShoppingApp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemServices itemServices = ItemServices();
  final HomePageController controller = Get.put(HomePageController());
  bool issearching = false;
  @override
  void initState() {

    controller.get_category();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.get_category();
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: !issearching ?  Text("Shop"):  TextField(
            onChanged: (s)=> controller.search_prodeuct(s),
            decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: "search"
            ),
          ),
          elevation: 0.0,
          centerTitle: true,

          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkResponse(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => About()));

                },
                child:  Align(
                  child: Icon(Icons.person),
                  alignment: Alignment.center,
                ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkResponse(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: Stack(
                    children: [
                      GetBuilder<HomePageController>(builder: (_) => Align(
                        child: Text(controller.cartItems.length > 0 ? controller.cartItems.length.toString() : ''),
                        alignment: Alignment.topLeft,
                      )),
                      Align(
                        child: Icon(Icons.shopping_cart),
                        alignment: Alignment.center,
                      ),
                    ],
                  )),
            ),
            IconButton(onPressed: (){
              setState((){
                this.issearching = !this.issearching;
                controller.search_prodeuct("");

              });
            }, icon: Icon( !this.issearching ? Icons.search : Icons.close ,color: Colors.black,))
          ],
        ),
       drawer: NavDrawer(),
        body:  GetBuilder<HomePageController>(
            init: controller,
            builder: (_) => controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                :  CustomScrollView(
              semanticChildCount: 2,
              slivers: [
                SliverToBoxAdapter(
                  child:   _buildCategories(size),
                ),
                // SliverToBoxAdapter(
                // //  child:   ShopItemListing(items: controller.items,),
                //
                // ),
                _buildContent(context, size),
              ]

                ),
          ),
        );
  }

  Widget _buildCategories(size) {
    return   SizedBox(
      height:  size.width  > 800 ? 100 :150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final ShopItemModel item = controller.items_category[index];

          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 0),
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 15,
            child: Row(
              children: [
                index == 0
                    ? SizedBox(
                  width: 2,
                )
                    : const SizedBox(),
                GestureDetector(
                  onTap: () {
                    controller.selecte_category(item.category);
                    Get.to(()=>Category_page(title: item.category));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                   //   color: Colors.white,
                  //    boxShadow: AppShadow.buttonWhite,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    // margin: EdgeInsets.only(bottom: AppSpacing.space28),
                    // padding: EdgeInsets.all(AppSpacing.space4),
                    // width: 60.w,
                    // height: 98.w,
                    // decoration: BoxDecoration(
                    //   color: isSelected ? AppColors.blue : AppColors.white100,
                    //   boxShadow: AppShadow.buttonWhite,
                    //   borderRadius: BorderRadius.all(Radius.circular(AppRadius.border32)),
                    // ),
                    child: Column(
                      children: [
                        Image.network(
                          item.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),

                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                          //  padding: EdgeInsets.only(bottom: AppSpacing.space4),
                            // color: Colors.red,
                            child: Text(
                              item.category,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          );
        },
        itemCount: controller.items_category.length,
      ),
    );
  }
  Widget  _buildContent(BuildContext context,size) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  size.width > 1000? 4 :size.width > 700? 3:2,
            mainAxisExtent:  200 ,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 1.0),

        //   itemCount: _restaurantController.popularFoods.length,
        //   physics: NeverScrollableScrollPhysics(),
        delegate: SliverChildBuilderDelegate( ( BuildContext context,int index) =>
            Container(
              height: 300,
              margin: const EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ]),
              child:  InkWell(
                splashColor: Colors.cyanAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                    //  height: 130.0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image.network(
                                  controller.items[index].image,height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: controller.items[index].fav
                                  ? Icon(
                                Icons.favorite,
                                size: 20.0,
                                color: Colors.red,
                              )
                                  : Icon(
                                Icons.favorite_border,
                                size: 20.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),


                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "${controller.items[index].name}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              "\$${controller.items[index].price.toString()}",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),

                          Text(
                            "${controller.items[index].category}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text(
                            "${controller.items[index].rating}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(Icons.star,color: Colors.orangeAccent,),
                        ],
                      ),
                    ),

                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailPage(itemId: controller.items[index].id)));
                },
              ),

            ),
          childCount: controller.items.length,)

    );
  }
}


