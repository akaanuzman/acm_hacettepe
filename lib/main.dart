import 'package:acm_hacettepe/week4/feature/task/view/task_view.dart';
import 'package:acm_hacettepe/week5/core/theme/light_theme.dart';
import 'package:acm_hacettepe/week5/future/tabbar/app_tabbar.dart';
import 'package:acm_hacettepe/week5/product/manager/shop/shop_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:provider/provider.dart';

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
