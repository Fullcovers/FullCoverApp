import 'package:flutter/foundation.dart';
import '../Models/Ticket.dart';

class TicketProvider with ChangeNotifier {
  Ticket? _ticket;

  Ticket? get ticket => _ticket;

  void setTicket(Ticket ticket) {
    _ticket = ticket;
    notifyListeners();
  }
}
