import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: const Center(
        child: HomePage(),
      ),
    ),
  );
  runApp(app);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MyItem> data = [];
    for (int i = 0; i <= 30; i++) {
      data.add(MyItem("Item $i", "no notes at $i"));
    }

    return Center(
        child: ElevatedButton(
      child: const Text('Go to ListPage'),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListPage(list: data)));
      },
    ));
  }
}

class MyItem {
  final String name;
  final String notes;

  MyItem(this.name, this.notes);
}

class ListPage extends StatelessWidget {
  final List<MyItem> list;

  const ListPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    for (MyItem item in list) {
      widgetList.add(ListTile(
        title: Text(item.name),
        subtitle: Text('Note: ${item.notes}'),
        leading: const Icon(Icons.account_box, color: Colors.blue),
      ));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      body: ListView(children: widgetList,),
    );
  }
}
