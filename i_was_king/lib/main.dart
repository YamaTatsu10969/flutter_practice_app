import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I Was King'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Image.network(
              'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
        ),
      ),
    ),
  );
}
