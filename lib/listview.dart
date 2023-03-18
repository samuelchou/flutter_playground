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
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListPage(list: data)));
              },
              child: const Text('Go to List Page')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DynamicListPage(list: data)));
              },
              child: const Text('Go to List Page (Dynamic)')),
        ],
      ),
    );
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
    List<ListTile> widgetList = <ListTile>[];
    for (int i = 0; i < list.length; i++) {
      var item = list[i];
      widgetList.add(ListTile(
        title: Text(item.name),
        subtitle: Text('Note: ${item.notes}'),
        leading: const Icon(Icons.account_box, color: Colors.amberAccent),
        trailing: const Icon(Icons.keyboard_arrow_right),
        selected: i % 3 == 0,
        enabled: i % 4 != 0,
        onTap: () {
          debugPrint('tap item $i');
        },
        onLongPress: () {
          debugPrint('Long Press item $i');
        },
      ));
    }
    var newTiles = ListTile.divideTiles(tiles: widgetList, color: Colors.pink);
    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      // body: ListView(children: widgetList,),
      body: ListView(
        children: newTiles.toList(),
      ),
    );
  }
}

class DynamicListPage extends StatelessWidget {
  final List<MyItem> list;

  const DynamicListPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int i) {
          var item = list[i];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Note: ${item.notes}'),
            leading: const Icon(Icons.account_box, color: Colors.amberAccent),
            trailing: const Icon(Icons.keyboard_arrow_right),
            selected: i % 3 == 0,
            enabled: i % 4 != 0,
            onTap: () {
              debugPrint('tap item $i');
            },
            onLongPress: () {
              debugPrint('Long Press item $i');
            },
          );
        });
    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      body: listView,
    );
  }
}
