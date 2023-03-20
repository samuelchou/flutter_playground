import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Lab Code"),
      ),
      body: Center(
        child: HomePage(),
      ),
    ),
  );
  runApp(app);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: "Input your name here",
            prefixIcon: Icon(Icons.abc),
            errorText: "必填欄位",
          ),
          keyboardType: TextInputType.number,
          controller: textEditingController,
        ),
        ElevatedButton(
          onPressed: () => saidHelloWithInput(context),
          child: const Text("Say Hello"),
        ),
      ],
    );
  }

  void saidHelloWithInput(BuildContext context) {
    final input = textEditingController.text;
    debugPrint('Hello $input');
    final snackBar = SnackBar(content: Text('Hello $input'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
