import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
      ),
      body: const Center(
        child: HomePage(),
      ),
    ),
  );
  runApp(app);
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      children: [
        ElevatedButton(
          onPressed: () => snackBar(context, 'Hello!'),
          child: const Text('Normal SnackBar'),
        ),
        ElevatedButton(
          onPressed: () => snackBarWithUndo(context, 'Hello!'),
          child: const Text('SnackBar with button'),
        ),
      ],
    );
  }
}

void snackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void snackBarWithUndo(BuildContext context, String text) {
  const undoSnackBar = SnackBar(content: Text('Undo.'));
  final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          debugPrint('undo');
          // do something here to undo...
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(undoSnackBar);
        },
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
