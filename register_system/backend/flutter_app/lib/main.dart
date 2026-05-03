import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key});

  @override
  
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://example.com'));
      
      
      debugPrint('Status: ${response.statusCode}');
      debugPrint('Body: ${response.body}');

      
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Berhasil mengambil data')),
      );
    } catch (e) {
      if (!mounted) return;
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          const Text('Hello World'),
          
          const SizedBox(height: 10), 
          ElevatedButton(onPressed: fetchData, child: const Text('Fetch')),
        ],
      ),
    );
  }
}
