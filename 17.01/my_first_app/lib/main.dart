import 'package:flutter/material.dart';
import 'package:my_first_app/person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    Person person1 = Person(
      "065065065",
      firstName: "Djordje",
      /**
      asdasdas d
      asd asas asd
      as da
     */
      lastName: "Cvijic",
    );
    person1.printPersonData();
    person2.printPersonData();
    person1.printYearOfBirth(2025, text: "asdasda");

    setState(() {
      _counter++;
    });
  }

  Person person2 = Person(
    "065065065",
    firstName: "Marko",
    lastName: "Markovic",
    age: 35,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Dugme je pritisnuto ovoliko puta:",
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.access_alarm_outlined),
      ),
    );
  }
}
