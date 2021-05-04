import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../product/manager/shop/shop_manager.dart';
import '../product/widgets/photo_card.dart';

class BasketView extends StatelessWidget {
  final String title = 'Basket';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: context.watch<ShopManager>().shopPhotoItems.isEmpty
          ? Center(
              child: Text('Basket is empty'),
            )
          : ListView.builder(
            itemCount: context.watch<ShopManager>().shopPhotoItems.length,
              itemBuilder: (context, index) => PhotoCard(
                model: context.watch<ShopManager>().shopPhotoItems[index],
              ),
            ),
    );
  }
}
