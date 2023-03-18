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

  ElevatedButton buttonWithListType(
      BuildContext context, List<MyItem> data, ListType listType) {
    String buttonText = '';
    switch (listType) {
      case ListType.static:
        buttonText = 'ListView';
        break;
      case ListType.dynamic:
        buttonText = 'ListView (Dynamic)';
        break;
      case ListType.dynamicWithSeparator:
        buttonText = 'ListView (Dynamic + Separator)';
        break;
    }
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ListPage(list: data, listType: listType)));
        },
        child: Text(buttonText));
  }

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
          buttonWithListType(context, data, ListType.static),
          buttonWithListType(context, data, ListType.dynamic),
          buttonWithListType(context, data, ListType.dynamicWithSeparator),
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

enum ListType { static, dynamic, dynamicWithSeparator }

class ListPage extends StatelessWidget {
  final List<MyItem> list;
  final ListType listType;

  const ListPage({Key? key, required this.list, required this.listType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? body;
    switch (listType) {
      case ListType.static:
        body = generateStaticList();
        break;
      case ListType.dynamic:
        body = generateDynamicList();
        break;
      case ListType.dynamicWithSeparator:
        body = generateDynamicListWithSeparator();
        break;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      // body: ListView(children: widgetList,),
      body: body ?? const Text('no data!'),
    );
  }

  Widget generateStaticList() {
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
    // return ListView(children: widgetList,);
    return ListView(
      children: newTiles.toList(),
    );
  }

  Widget generateDynamicList() {
    return ListView.builder(
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
  }

  Widget generateDynamicListWithSeparator() {
    return ListView.separated(
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
      },
      separatorBuilder: (BuildContext context, int index) {
        Widget divider1 = const Divider(color: Colors.pink, thickness: 3);
        Widget divider2 = const Divider(color: Colors.green, thickness: 6);
        return index % 3 == 0 ? divider1 : divider2;
      },
    );
  }
}
