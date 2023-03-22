import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final String keyName = "name";
  final TextEditingController textEditingController = TextEditingController();

  void loadName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var name = pref.getString(keyName) ?? '';
    textEditingController.text = name;
  }

  void saveName(String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(keyName, name);
  }

  @override
  Widget build(BuildContext context) {
    loadName();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: "Input your name here",
            prefixIcon: Icon(Icons.abc),
          ),
          keyboardType: TextInputType.number,
          controller: textEditingController,
        ),
        ElevatedButton(
          onPressed: () => saidHelloWithInput(context),
          child: const Text('Save Your Name'),
        ),
      ],
    );
  }

  void saidHelloWithInput(BuildContext context) {
    final input = textEditingController.text;
    debugPrint('Hello $input');
    saveName(input);
    final snackBar = SnackBar(
        content: Text(
            'Hello $input! Your name will be stored and shown up next time.'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
