import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
          )
        ],
        title: const Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(text: 'Green', style: TextStyle(color: Colors.green)),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: Color.fromARGB(255, 132, 18, 10),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}
