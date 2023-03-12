import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class AppDataProvider extends ChangeNotifier{
  WordPair namePair= WordPair.random();
  List<WordPair> favorites=[];
  List<WordPair> historyList=[];
  GlobalKey? historyListKey;
  void nextNamePair(){
    historyList.insert(0, namePair);
    AnimatedListState? animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    namePair= WordPair.random();
    notifyListeners();
  }
  void toggleFavorites([WordPair? pair]){
    pair = pair ?? namePair;
    if(favorites.contains(pair)){
      favorites.remove(pair);
    }else{
      favorites.add(pair);
    }
    notifyListeners();
  }
  void removeFavorites(WordPair pair){
    favorites.remove(pair);
    notifyListeners();
  }
}