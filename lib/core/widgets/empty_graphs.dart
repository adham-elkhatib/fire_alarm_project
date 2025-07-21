import 'package:flutter/material.dart';

class EmptyGraphs extends StatelessWidget {
  const EmptyGraphs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Temperature Graph Placeholder"),
        SizedBox(height: 16),
        Text("Smoke Graph Placeholder"),
      ],
    );
  }
}
