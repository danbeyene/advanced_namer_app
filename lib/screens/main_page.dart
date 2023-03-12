import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:advanced_namer_app/provider/app_data_provider.dart';
import 'package:advanced_namer_app/utils/dimentions.dart';
import 'package:advanced_namer_app/widgets/big_card.dart';
import 'package:provider/provider.dart';

import '../widgets/small_text.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    WordPair namePair = context.watch<AppDataProvider>().namePair;
    void onNavigationTab(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    Widget page;
    switch(selectedIndex){
      case 0:
        page = HomePage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('there is no page for tab $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: appTheme.colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < Dimensions.mobileSize) {
          return Column(
            children: [
              Expanded(
                  child: mainArea),
              SafeArea(
                  child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: onNavigationTab,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorites')
                ],
              ))
            ],
          );
        } else {
          return Row(
            children: [
              SafeArea(
                  child: NavigationRail(
                onDestinationSelected: onNavigationTab,
                extended: constraints.maxWidth > Dimensions.tabletSize,
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: SmallText(
                        text: 'Home',
                      )),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: SmallText(
                        text: 'Favorites',
                      ))
                ],
                selectedIndex: selectedIndex,
              )),
              Expanded(
                  child: mainArea),
            ],
          );
        }
      }),
    );
  }
}
