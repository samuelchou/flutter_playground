import 'package:flutter/material.dart';

import 'StorageItem.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Sqlflite Data Storage"),
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
                        builder: (context) => const ListPage()));
              },
              child: const Text('Open List')),
        ],
      ),
    );
  }
}

class DynamicListWidget extends StatefulWidget {
  final List<StorageItem> list;
  const DynamicListWidget({Key? key, required this.list}) : super(key: key);

  @override
  State<DynamicListWidget> createState() => _DynamicListWidgetState();
}

class _DynamicListWidgetState extends State<DynamicListWidget> {
  @override
  Widget build(BuildContext context) {
    var dataList = widget.list;
    return generateStaticList(dataList);
  }

  Widget generateStaticList(List<StorageItem> list) {
    List<ListTile> widgetList = <ListTile>[];
    for (int i = 0; i < list.length; i++) {
      var item = list[i];
      widgetList.add(ListTile(
        title: Text(item.name),
        subtitle: Text('Note: ${item.notes}'),
        leading: const Icon(Icons.account_box, color: Colors.amberAccent),
        trailing: const Icon(Icons.keyboard_arrow_right),
        selected: item.hasChecked,
        enabled: i % 4 != 0,
        onTap: () {
          // TODO: on tap, update data
          debugPrint('tap item $i');
        },
        onLongPress: () {
          // TODO: on long press, ask if want to delete
          debugPrint('Long Press item $i');
        },
      ));
    }
    var newTiles = ListTile.divideTiles(tiles: widgetList, color: Colors.pink);
    // return ListView(children: widgetList,);
    return ListView(
      children: newTiles.toList(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  List<StorageItem> readList() {
    // TODO: read data here.
    List<StorageItem> data = [];
    for (int i = 0; i <= 30; i++) {
      data.add(StorageItem(
          i, "Item $i", "no notes at $i", i % 3 == 0
      ));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: create button here to add data.
    final data = readList();
    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      // body: ListView(children: widgetList,),
      body: DynamicListWidget(list: data),
    );
  }
}
