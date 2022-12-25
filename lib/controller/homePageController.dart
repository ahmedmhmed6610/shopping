import 'package:ShoppingApp/models/ItemModel.dart';
import 'package:ShoppingApp/services/itemService.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  ItemServices itemServices = ItemServices();
  var items = <ShopItemModel>[].obs;
  var items_search = <ShopItemModel>[].obs;
  var items_category = <ShopItemModel>[].obs;
  var cartItems = <ShopItemModel>[].obs;

  bool isLoading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadDB();
  }

  loadDB() async {
    await itemServices.openDB();
    loadItems();
    getCardList();
  }

  getItem(int id) {
    return items.singleWhere((element) => element.id == id);
  }

  bool isAlreadyInCart(id) {
    return cartItems.indexWhere((element) => element.shopId == id) > -1;
  }

  getCardList() async{
    try {
      List list = await itemServices.getCartList();
      cartItems.clear();
      list.forEach((element) {
        cartItems.add(ShopItemModel.fromJson(element));
      });
      update();

    } catch (e) {
      print(e);
    }
  }

  loadItems()async{
    try {
      isLoading = true;
      update();

      List list = await itemServices.loadItems();
      list.forEach((element) {
        items.add(ShopItemModel.fromJson(element));
      });

      isLoading = false;
      items_search.value = items.value;
      get_category();
      update();
    } catch (e) {
      print(e);
    }
  }

  setToFav(int id, bool flag) async {
    int index = items.indexWhere((element) => element.id == id);

    items[index].fav = flag;
    update();
    try {
      await itemServices.setItemAsFavourite(id, flag);
    } catch (e) {
      print(e);
    }
  }

  Future addToCart(ShopItemModel item) async {
    isLoading = true;
    update();
    var result = await itemServices.addToCart(item);
    isLoading = false;
    update();
    return result;
  }

  removeFromCart(int shopId) async {
    itemServices.removeFromCart(shopId);
    int index = cartItems.indexWhere((element) => element.shopId == shopId);
    cartItems.removeAt(index);
    update();
  }

  add_prodect(ShopItemModel item){
    items.add(item);
    update();
  }
  delete_prodect(id){
    items.removeWhere((el) => el.id == id);
    items_search.removeWhere((el) => el.id == id);
    items_category.removeWhere((el) => el.id == id);
    cartItems.removeWhere((el) => el.id == id);
    update();
  }

  Future<void> search_prodeuct(String s) async {

    if (s.isEmpty) {
      items.value = await items_search.value;
    } else {
      items.value = items_search.where((element) => element.name.toLowerCase().contains(s.toLowerCase())).toList();
      if (items.isEmpty){
        items.value = items_search.where((element) => element.category.toLowerCase().contains(s.toLowerCase())).toList();

      }

      items.refresh();
      update();
    }
  }


  get_category(){
    items.forEach((el) {
      if(items_category.isEmpty){
        items_category.add(el);
      }if(items_category.where((ele) => ele.category == el.category).isEmpty ){
        items_category.add(el);
      }
    });
    items_category.refresh();
  }
  selecte_category(name){
    items_category.clear();
    items_search.forEach((el) {
      if(el.category == name){
        items_category.add(el);
      }
    });
  //  items.refresh();
    items_category.refresh();
  }
}