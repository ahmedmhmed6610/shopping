
import 'package:ShoppingApp/pages/about.dart';
import 'package:ShoppingApp/pages/product/add_product.dart';
import 'package:ShoppingApp/pages/product/delete_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Drawer(
        child: Column(
      children: [
        new Expanded(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text(
                  "shop",
                  style: TextStyle(color: Colors.black),

                ),
                accountEmail: new Text(
                  "all",
                  style: TextStyle(color: Colors.black),
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/images/background.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 65.0,
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/logo.png') ),
              ),
              new SizedBox(
                height: 30,
              ),
              new ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                  ),
                  title:
                      new Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    //       Get.offAll(MyHome());
                  }),


              new ListTile(
                  leading: Icon(
                    Icons.add_circle_outline_outlined,
                  ),
                  title: new Text('Add product'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Add_peodect()));
                  }),
              new ListTile(
                  leading: Icon(
                    Icons.delete_forever_outlined,
                  ),
                  title: new Text('Delete product'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Delete_product()));
                  }),
              new Divider(),
              new ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: new Text(
                    'About',
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                  }),

            ],
          ),
        ),

        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: ListTile(
        //       leading: Icon(Icons.refresh),
        //       title: Text(lang.text("refresh")),
        //   onTap: (){
        //     Get.snackbar(lang.text("ok"), lang.text("refresh"),backgroundColor: Colors.amberAccent);
        //     Navigator.pop(context);
        //     Get.offAll(Wait_Page());
        //   },),
        // ) , Align(
        //   alignment: Alignment.bottomCenter,
        //   child: ListTile(
        //       leading: Icon(Icons.settings),
        //       title: Text(lang.text("Settings")),
        //   onTap: (){
        //
        //         Get.to(Page_ip());
        //   },),
        // )
      ],
    ));
  }

}

