import 'package:flutter/material.dart';
import 'package:fs_widgets/fs_widgets.dart';

void main() {
  runApp(myApp());
}

Widget myApp() {
  return statelessWidget((context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myHomePage(title: 'Flutter Demo Home Page'),
    );
  });
}

Widget myHomePage({required String title}) {
  var counter = 0;
  return statefulWidget((context, setState) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => counter++),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  });
}
