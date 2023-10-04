import 'package:character_counter/util/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  int getWordCount(String text) {
    List<String> words = text.split(' ');
    words.removeWhere((word) => word.trim().isEmpty);
    return words.length;
  }

  int getNumberCount(String text) {
    RegExp regex = RegExp(r'\d');
    return regex.allMatches(text).length;
  }

  int getLetterCount(String text) {
    RegExp regex = RegExp(r'[A-Za-zأ-ي]');
    return regex.allMatches(text).length;
  }

  int getEmojiCount(String text) {
    RegExp regex = RegExp(
      r'[^\x00-\x7F\uD800-\uDFFF\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
      unicode: true,
      multiLine: true,
    );
    Iterable<Match> matches = regex.allMatches(text);
    int count = matches.length;
    return count;
  }

  int allOtherCharacters(String text) {
    RegExp regex = RegExp(r"[^A-Za-z0-9\u0080-\uFFFF\u0600-\u06FF]");
    return regex.allMatches(text).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Box(
                child: TextField(
                  controller: textController,
                  onChanged: (text) {
                    setState(() {
                      // No changes needed here
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your text here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Box(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Characters: ${textController.text.length}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text('Words: ${getWordCount(textController.text)}'),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Letters: ${getLetterCount(textController.text)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Numbers: ${getNumberCount(textController.text)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Emojis: ${getEmojiCount(textController.text)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Special Characters: '
                          '${allOtherCharacters(textController.text)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
