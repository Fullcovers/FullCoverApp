// // Import necessary packages



// import 'package:phonepe_gateway/phonepe_gateway.dart';


// import 'package:flutter/material.dart';

// class PayUI extends StatefulWidget {
//   const PayUI({Key? key}) : super(key: key);

//   @override
//   State<PayUI> createState() => _PayUIState();
// }

// class _PayUIState extends State<PayUI> {
//   @override
//   void initState() {
//     // Initialize the payment gateway with configuration parameters
//     PhonepePaymentGateway.instance.init(...);
//     // Setup event handlers for payment events
//     // PhonepePaymentGateway.instance.handlerCancelled(...);
//     // PhonepePaymentGateway.instance.handlerFailed(...);
//     // PhonepePaymentGateway.instance.handlerSuccess(...);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Gateway Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Trigger the payment process when the button is pressed
//             _startPaymentProcess();
//           },
//           child: const Text('Make Payment'),
//         ),
//       ),
//     );
//   }

//   void _startPaymentProcess() {
//     // Prepare payment details, such as amount, transaction ID, user details, etc.
//     // Make API call to the payment gateway with the payment details
//     // Handle the response and status callbacks accordingly
//   }
// }