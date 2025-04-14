import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/product/controller/product_controller.dart';

class FilterPage extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  final categories = ['', 'beauty', 'groceries', 'fragrances', 'furniture'];
  final tags = ['', 'new', 'popular', 'sale', 'hot'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Products')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: controller.selectedCategory.value,
              decoration: InputDecoration(labelText: 'Category'),
              items: categories.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat.isEmpty ? 'All' : cat.capitalize!),
                );
              }).toList(),
              onChanged: (val) => controller.selectedCategory.value = val ?? '',
            ),
            DropdownButtonFormField(
              value: controller.selectedTag.value,
              decoration: InputDecoration(labelText: 'Tag'),
              items: tags.map((tag) {
                return DropdownMenuItem(
                  value: tag,
                  child: Text(tag.isEmpty ? 'All' : tag.capitalize!),
                );
              }).toList(),
              onChanged: (val) => controller.selectedTag.value = val ?? '',
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Min Price'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => controller.minPrice.value = double.tryParse(val) ?? 0,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Max Price'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => controller.maxPrice.value = double.tryParse(val) ?? 1000,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.applyFilters();
                Get.back();
              },
              child: Text('Apply Filters'),
            ),
            TextButton(
              onPressed: () {
                controller.clearFilters();
                Get.back();
              },
              child: Text('Clear Filters'),
            )
          ],
        ),
      ),
    );
  }
}
