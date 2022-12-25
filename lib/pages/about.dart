import 'package:ShoppingApp/controller/homePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
   About({Key? key}) : super(key: key);
   HomePageController _productController = Get.find();


  TextEditingController qty = TextEditingController();
  TextEditingController __password = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        title: Text('about',style: TextStyle(color: Colors.black,),),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    //  leading: BackButton(onPressed: ()=> Get.back(),color: Colors.black,)

    ),
//    drawer: NavDrawer(),
    body:  Container(
      height: size.height*1,
      width: size.width*1,
      decoration: BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("assets/images/login_bk.png"),
          //     fit: BoxFit.cover
          // )
      ),
      child: Column(
     //   mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height*0.2,),
       Card(
         elevation: 30,
           shape: RoundedRectangleBorder(
             //     side: BorderSide(width: 1),
             borderRadius: BorderRadius.circular(50),
           ),
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: Image.asset('assets/logo.png',width: size.width*0.55,),
           )),
          SizedBox(height: size.height*0.1,),
          Text('info',style: TextStyle(color: Colors.black),),
          SizedBox(height: size.height*0.05,),
          Text('En Ahmed ',style: TextStyle(color: Colors.black),),
          SizedBox(height: size.height*0.02,),
          Text('Phone number'+' : +201000679584',style: TextStyle(color: Colors.black),),
          SizedBox(height: size.height*0.03,),
          Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
            //    color: Colors.green,
                  onPressed: ()=>launch('tel:+201000679584'), child: Icon(Icons.call,color: Colors.black,)),
              ElevatedButton(onPressed: () async => await launch("https://wa.me/+201000679584?text=Hello"),
                  child: Icon(Icons.whatsapp_rounded,color: Colors.green,)),
              ElevatedButton(onPressed: () {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'ahmedmohamedabdelhamammed6610@gmail.com',
                );
                launch('$params');
              }, child: Icon(Icons.mail_outline,color: Colors.amber,)),
            ],
          )

        ],
      ),
    ),);
  }
}
