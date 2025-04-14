import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/product/controller/product_controller.dart';
import 'package:logiology/product/screens/product_title.dart';


class Producthome extends StatelessWidget {

  final ProductController productController=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: Column(
          children: [
            SearchBar(hintText: "Search",),
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
             Get.toNamed('/filter');
          },
          child: Text("Filter"),
        ),
      ),
    ),

    Expanded
    (child:
    Obx((){
          if(productController.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return GridView.builder(
                itemCount: productController.filteredList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context,index){
                  return Producttile(
                      productController.productList[index]);
                });
          }
        }),
      ),
   ] ),
    );
  }
}
