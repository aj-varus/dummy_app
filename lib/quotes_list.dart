import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(content: "content 1", author: "author 1"),
    Quote(content: "content 2", author: "author 2"),
    Quote(content: "content 3", author: "author 3"),
  ];

  void addQuote() {
    setState(() {
      quotes.add(Quote(content: "content", author: "author"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("Quote's list"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: quotes
            .map((quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[900],
          onPressed: () {
            addQuote();
          },
          child: const Icon(Icons.add)),
    );
  }
}
