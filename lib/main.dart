import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: "Generador de palabras",
      /*home: Scaffold(
        appBar: AppBar(
          title: const Text("Generador de palabras"),
        ),
          body: Center(
          //child:  Text(wordPair.asPascalCase),
            child: RandomWords(),
          ),
      ),*/
      home: RandomWords(),
    );
  }
}

//creamos la clase RanodmWords que va a ser StatefulWidget
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState()=> RandomWordsState();
}
class RandomWordsState extends State<RandomWords>{

  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle __biggerFont = const TextStyle(fontSize:20);

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(title: Text('Lista de generador de palabra')),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i){
        if(i.isOdd){
          return Divider();
        }
        final int index = i ~/ 2;
        if(index>=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: __biggerFont),
    );
  }

}