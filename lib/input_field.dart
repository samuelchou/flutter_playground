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
          onPressed: saidHelloWithInput,
          child: const Text("Say Hello"),
        ),
      ],
    );
  }

  void saidHelloWithInput() {
    debugPrint("Hello ${textEditingController.text}");
  }
}
