import 'package:flutter/foundation.dart';
import '../Models/Ticket.dart';

class TicketProvider with ChangeNotifier {
  Ticket? _ticket;
  List<Ticket> _tickets = [];

  Ticket? get ticket => _ticket;
  List<Ticket> get tickets => _tickets;

  void setTicket(Ticket ticket) {
    _ticket = ticket;
    notifyListeners();
  }

  Future<void> setMultiTickets(Map<String, dynamic> response) async {
    _tickets = [];
    List<dynamic> data = response['data'];
    for (var ticketJson in data) {
      Ticket ticket = Ticket(
        crossed: ticketJson['price']['crossed'],
        current: ticketJson['price']['current'],
        id: ticketJson['_id'],
        club: ticketJson['club'],
        event: ticketJson['event'],
        name: ticketJson['name'],
        available: ticketJson['available'],
        v: ticketJson['__v'],
      );
      _tickets.add(ticket);
    }

    notifyListeners();
  }
}
