import 'package:acm_hacettepe/week5/future/photos/viewmodel/photos_view_model.dart';
import 'package:acm_hacettepe/week5/product/manager/shop/shop_manager.dart';
import 'package:acm_hacettepe/week5/product/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PhotosView extends StatelessWidget {
  final _viewModel = PhotosViewModel();

  @override
  Widget build(BuildContext context) {
    final String title = 'Shop';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: buildIsLoadingBar,
        actions: [
          buildActionChip(context),
        ],
      ),
      body: buildGridView,
    );
  }

  Observer get buildIsLoadingBar => Observer(
        builder: (_) => Visibility(
          visible: _viewModel.isLoading,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      );

  ActionChip buildActionChip(BuildContext context) => ActionChip(
      label: Text('\$ ${context.watch<ShopManager>().totalMoney}'), avatar: Icon(Icons.shopping_bag), onPressed: () {});

  Observer get buildGridView => Observer(
        builder: (_) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (context, index) => PhotoCard(
            model: _viewModel.photos[index],
          ),
          itemCount: _viewModel.photos.length,
        ),
      );
}
