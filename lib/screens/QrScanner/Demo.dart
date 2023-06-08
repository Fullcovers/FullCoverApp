import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  final String ticketId;
  final int quantity;
  final bool isValid;

  const Demo({
    Key? key,
    required this.ticketId,
    required this.quantity,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Ticket ID: $ticketId')),
            Center(child: Text('Quantity: $quantity')),
            Center(child: Text('Is Valid: $isValid')),
          ],
        ),
      ),
    );
  }
}
