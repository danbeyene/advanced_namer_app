import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:advanced_namer_app/utils/dimentions.dart';
import 'package:provider/provider.dart';

import '../provider/app_data_provider.dart';
import '../widgets/small_text.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = context.watch<AppDataProvider>();
    var appTheme = Theme.of(context);
    List<WordPair> favorites = appProvider.favorites;
    if(favorites.isEmpty){
      return const Center(
          child: SmallText(
            text: 'No favorites yet.',
          ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('You have '
              '${appProvider.favorites.length} favorites:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in appProvider.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: appTheme.colorScheme.primary,
                    onPressed: () {
                      appProvider.removeFavorites(pair);
                    },
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
