import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';

class RandomWords extends StatefulWidget {

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
    /*navigationBar: CupertinoNavigationBar(
      middle: Text('Startup Name Generator'),
    ),*/
    child: _buildSuggestions(),
  );
  }

   Widget _buildSuggestions(){
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
              largeTitle: Text('Startup Namer'),
            ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i){
              if (i.isOdd) return SizedBox( width: 1.0);
              final index = i ~/ 2;
              if( index >= _suggestions.length){
                _suggestions.addAll(generateWordPairs().take(10));
              }
              return _buildRow(_suggestions[index]);
            }
          ),
        )
      ],
    );
  }

  Widget _buildRow(WordPair pair){
    return Container(
      padding: EdgeInsets.only(bottom: 15.0,top: 15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: CupertinoColors.lightBackgroundGray,
          width: 1.0
        ) )
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0),
            child: Icon(
              IconData(0xf3ff,fontFamily: CupertinoIcons.iconFont,fontPackage: CupertinoIcons.iconFontPackage),
              color: CupertinoColors.inactiveGray,
            ),
          ),
          Text(pair.asPascalCase,
            style: _biggerFont,
          ),
        ],
      )
    );
  }

}