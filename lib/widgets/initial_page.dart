import 'package:flutter/material.dart';

Widget buildInitialPage() => const Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.menu,
        color: Colors.grey,
        size: 100,
      ),
      Text(
        'No tasks yet please add some tasks',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey
        ),
      )

    ],
  ),
);
