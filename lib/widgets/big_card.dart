import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:advanced_namer_app/utils/dimentions.dart';
import 'package:advanced_namer_app/widgets/big_text.dart';

class BigCard extends StatelessWidget {
  final WordPair wordPair;
  const BigCard({Key? key,required this.wordPair}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme= Theme.of(context);
    TextStyle style = appTheme.textTheme.displayMedium!.copyWith(color: appTheme.colorScheme.onPrimary);
    return Card(
      color: appTheme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          // Make sure that the compound word wraps correctly when the window
          // is too narrow.
          child: MergeSemantics(
            child: Wrap(
              children: [
                Text(
                  wordPair.first,
                  style: style.copyWith(fontWeight: FontWeight.w200),
                ),
                Text(
                  wordPair.second,
                  style: style.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
