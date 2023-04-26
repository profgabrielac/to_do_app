import 'package:flutter/material.dart';

import 'models/item.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  List<Item> items = [];

  HomePage() {
    items.add(Item(title: "Supino Inclinado", done: true));
    items.add(Item(title: "Supino Reto", done: false));
    items.add(Item(title: "Desenvolvimento", done: true));
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value!;
              });
            },
          );
        },
      ),
    );
  }
}
