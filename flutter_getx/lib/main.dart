import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter com GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Flutter com GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Text('Valor definido: ${valueController.definedValue}');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: TextField(
                controller: textController,
              ),
            ),
            Obx(
              () {
                return valueController.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;

                          valueController.setValue(value);

                          textController.clear();
                        },
                        child: const Text(
                          'Confirmar',
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
