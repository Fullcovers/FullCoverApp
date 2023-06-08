import '../Models/Order.dart';

import 'package:flutter/foundation.dart';

class OrderProvider with ChangeNotifier {
  OrderModel? _order;

  OrderModel? get order => _order;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Setter method to update the isLoading value
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setOrder(OrderModel order) {
    _order = order;
    notifyListeners();
  }

  void clearOrder() {
    _order = null;
    notifyListeners();
  }

  OrderModel? getOrderFromMap(Map<String, dynamic> orderMap) {
    try {
      String id = orderMap['_id'];
      String user = orderMap['user'];
      bool isValid = orderMap['isValid'];
      bool isPaid = orderMap['isPaid'];
      double total = orderMap['total'].toDouble();
      String paymentMethod = orderMap['paymentMethod'];
      DateTime createdAt = DateTime.parse(orderMap['createdAt']);
      DateTime updatedAt = DateTime.parse(orderMap['updatedAt']);

      List<OrderItem> items = (orderMap['items'] as List<dynamic>)
          .map((item) => OrderItem(
                quantity: item['quantity'],
                ticket: item['ticket'],
                id: item['_id'],
              ))
          .toList();

      return OrderModel(
        id: id,
        user: user,
        items: items,
        isValid: isValid,
        isPaid: isPaid,
        total: total,
        paymentMethod: paymentMethod,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
    } catch (e) {
      // Handle any parsing errors here
      print('Error parsing order data: $e');
      return null;
    }
  }
}
