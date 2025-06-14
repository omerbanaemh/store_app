import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_card.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key,required this.products,});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: GridView.builder(
              itemCount: products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 100,
              ),
              itemBuilder: (context, index) {
                return CustomCard(product: products[index]);
              })
      ),
    );
  }
}
