import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//------------------------------------------------------------------------------
void main() {
  runApp(const CounterApp());
}

//------------------------------------------------------------------------------
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

//------------------------------------------------------------------------------
class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void incrementCounter() async {
    debugPrint('Incrementing counter to ${_counter + 1}');
    setState(() {
      _counter += 1;
    });
    final prefsFuture = await SharedPreferences.getInstance();
    await prefsFuture.setInt('counter', _counter);
  }

  void decrementCounter() async {
    debugPrint('Decrementing counter from $_counter to ${_counter - 1}');
    setState(() {
      _counter -= 1;
    });
    final prefsFuture = await SharedPreferences.getInstance();
    await prefsFuture.setInt('counter', _counter);
  }

  void resetCounter() async {
    debugPrint('Resetting counter to 0');
    setState(() {
      _counter = 0;
    });
    final prefsFuture = await SharedPreferences.getInstance();
    await prefsFuture.setInt('counter', _counter);
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _counter = prefs.getInt('counter') ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.amber,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Counter App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              SizedBox(
                width: 100,
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: resetCounter,
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
