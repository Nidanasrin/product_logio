import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logiology/product/service/product_service.dart';

class ProductController extends GetxController{

  var isLoading = true.obs;
  var productList = [].obs;
  var filteredList = [].obs;

  var selectedCategory = ''.obs;
  var selectedTag = ''.obs;
  var minPrice = 0.0.obs;
  var maxPrice = 1000.0.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
  void getProducts() async{
    try{
      isLoading(true);
      var products= await ProductService.fetchProducts();
      if(products !=null){
        productList.value = products.products ?? [];
        filteredList.value = productList;
      }
    }catch(e){
      print("Error : $e");
    }finally{
      isLoading(false);
    }
  }
  void applyFilters() {
    filteredList.value = productList.where((product) {
      bool matchesCategory = selectedCategory.value.isEmpty || product.category?.toLowerCase() == selectedCategory.value.toLowerCase();
      bool matchesTag = selectedTag.value.isEmpty || (product.tags?.contains(selectedTag.value) ?? false);
      bool matchesPrice = (product.price ?? 0) >= minPrice.value && (product.price ?? 0) <= maxPrice.value;

      return matchesCategory && matchesTag && matchesPrice;
    }).toList();
  }

  void clearFilters() {
    selectedCategory.value = '';
    selectedTag.value = '';
    minPrice.value = 0;
    maxPrice.value = 1000;
    filteredList.value = productList;
  }
}
