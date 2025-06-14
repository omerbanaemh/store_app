import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories_service.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final String selectedCategory;
  final Function(String) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: AllCategoriesService().getAllCateogires(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> categories = ['all', ...snapshot.data!];

          return Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];

                bool isSelected = selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton(
                    onPressed: () => onCategorySelected(category),
                    style: TextButton.styleFrom(
                      backgroundColor:
                      isSelected ? Colors.blue.shade700 : Colors.grey.shade200,
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
