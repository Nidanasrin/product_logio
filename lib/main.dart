import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logiology/login/screens/login_page.dart';
import 'package:logiology/product/controller/product_controller.dart';
import 'package:logiology/product/screens/product_filter.dart';
import 'package:logiology/product/screens/product_list.dart';

void main(){
  Get.put(ProductController());
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: ()=>Loginpage(),),
      GetPage(name: '/home', page: ()=>Producthome()),
      GetPage(name: '/filter', page: ()=>FilterPage())
    ],),
  );
}