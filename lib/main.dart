import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:provider/provider.dart';

import 'week5/core/theme/light_theme.dart';
import 'week5/future/tabbar/app_tabbar.dart';
import 'week5/product/manager/shop/shop_manager.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
    // Provider<ShopManager>(create: (_) => ShopManager()),
    ChangeNotifierProvider<ShopManager>(create: (context)=> ShopManager(),)
    // Provider<SomethingElse>(create: (_) => SomethingElse()),
    // Provider<AnotherThing>(create: (_) => AnotherThing()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme.instance.data,
        home: AppTabBar());
  }
}
