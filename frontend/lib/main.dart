import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Location/Location.dart';
// import 'package:flutter_application_1/pages/home.dart';
import 'pages/Others/others.dart';
// import 'package:flutter_application_1/pages/Explore/explore.dart';
// import 'package:flutter_application_1/pages/UserProfile/UserProfile.dart';

void main() {
  runApp(const MongoMap());
}

class MongoMap extends StatelessWidget {
  const MongoMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MongoMap App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0CA9C8)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Location(key: Key('Location')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          // Another page to navigate button
          children: <Widget>[
            Text(
              "Your Page",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Others()),
                );
              },
              child: const Text('Go to Your Page'),
            ),
          ],
        ),
      ),
    );
  }
}
