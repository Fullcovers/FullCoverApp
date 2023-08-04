// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:pay/pay.dart';

// class Googlepayintigration extends StatefulWidget {
//   const Googlepayintigration({super.key});

//   @override
//   State<Googlepayintigration> createState() => _GooglepayintigrationState();
// }

// class _GooglepayintigrationState extends State<Googlepayintigration> {
//   String defaultGooglePay = '''{
//   "provider": "google_pay",
//   "data": {
//     "environment": "TEST",
//     "apiVersion": 2,
//     "apiVersionMinor": 0,
//     "allowedPaymentMethods": [
//       {
//         "type": "CARD",
//         "tokenizationSpecification": {
//           "type": "PAYMENT_GATEWAY",
//           "parameters": {
//             "gateway": "example",
//             "gatewayMerchantId": "gatewayMerchantId"
//           }
//         },
//         "parameters": {
//           "allowedCardNetworks": ["VISA", "MASTERCARD"],
//           "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
//           "billingAddressRequired": true,
//           "billingAddressParameters": {
//             "format": "FULL",
//             "phoneNumberRequired": true
//           }
//         }
//       }
//     ],
//     "merchantInfo": {
//       "merchantId": "01234567890123456789",
//       "merchantName": "Example Merchant Name"
//     },
//     "transactionInfo": {
//       "countryCode": "US",
//       "currencyCode": "USD"
//     }
//   }
// }''';
//   var googlePayButton = GooglePayButton(
//     paymentConfiguration: PaymentConfiguration.fromJsonString('''{
//   "provider": "google_pay",
//   "data": {
//     "environment": "TEST",
//     "apiVersion": 2,
//     "apiVersionMinor": 0,
//     "allowedPaymentMethods": [
//       {
//         "type": "CARD",
//         "tokenizationSpecification": {
//           "type": "PAYMENT_GATEWAY",
//           "parameters": {
//             "gateway": "example",
//             "gatewayMerchantId": "gatewayMerchantId"
//           }
//         },
//         "parameters": {
//           "allowedCardNetworks": ["VISA", "MASTERCARD"],
//           "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
//           "billingAddressRequired": true,
//           "billingAddressParameters": {
//             "format": "FULL",
//             "phoneNumberRequired": true
//           }
//         }
//       }
//     ],
//     "merchantInfo": {
//       "merchantId": "BCR2DN4TZ2F4R22Q",
//       "merchantName": "Example Merchant Name"
//     },
//     "transactionInfo": {
//       "countryCode": "IND",
//       "currencyCode": "INR"
//     }
//   }
// }'''),
//     paymentItems: const [
//       PaymentItem(
//         label: 'Total',
//         amount: '1',
//         status: PaymentItemStatus.final_price,
//       )
//     ],
//     type: GooglePayButtonType.pay,
//     margin: const EdgeInsets.only(top: 15.0),
//     onPaymentResult: (result) => debugPrint('Payment Result $result'),
//     loadingIndicator: const Center(
//       child: CircularProgressIndicator(),
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [googlePayButton],
//       ),
//     );
//   }
// }
