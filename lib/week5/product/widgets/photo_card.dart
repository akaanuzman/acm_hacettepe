import 'package:acm_hacettepe/week5/future/photos/model/photos_model.dart';
import 'package:acm_hacettepe/week5/product/manager/shop/shop_manager.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class PhotoCard extends StatefulWidget {
  final PhotoModel model;
  const PhotoCard({Key? key, required this.model}) : super(key: key);

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  late final PhotoModel model;

  @override
  void initState() { 
    super.initState();
    model = widget.model;
  }
  bool isIncrementOpen = false;

  void isIncrementChange() {
    if (!isIncrementOpen) {
      context.read<ShopManager>().addShopItem(model);
    } else {
      context.read<ShopManager>().removeShopItem(model);
    }
    setState(() {
      isIncrementOpen = !isIncrementOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          buildListTileCard,
          Positioned(
            right: 0,
            child: buildCardShopIncrement,
          )
        ],
      ),
    );
  }

  ListTile get buildListTileCard => ListTile(
        title: Image.network(model.url ?? ''),
        subtitle: Column(
          children: [
            Text(
              model.title ?? '',
              maxLines: 2,
            ),
            IconButton(
                onPressed: isIncrementChange,
                icon: Icon(Icons.shopping_basket_sharp))
          ],
        ),
      );

  Widget get buildCardShopIncrement => AnimatedContainer(
        duration: context.durationLow,
        height: isIncrementOpen ? context.dynamicHeight(0.125) : 0,
        width: isIncrementOpen ? context.dynamicHeight(0.05) : 0,
        child: Card(
          elevation: 10,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: buildIconButtonIncrement,
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: buildIconButtonRemove,
              ),
            ],
          ),
        ),
      );

  IconButton get buildIconButtonIncrement => IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          context.read<ShopManager>().incrementItem(model);
        },
        icon: Icon(Icons.add),
      );

  IconButton get buildIconButtonRemove => IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          context.read<ShopManager>().deIncrementItem(model);
        },
        icon: Icon(Icons.remove),
      );
}
