import 'package:flutter/material.dart';
import 'package:rocket_help/models/request_order.dart';
import 'package:rocket_help/repositories/requests_repository.dart';

enum RequestType {
  open,
  closed;
}

class RequestsController extends ChangeNotifier {
  RequestsController({
    required this.requestsRepository,
  }) {
    _getOrders();
  }

  final RequestsRepository requestsRepository;
  late RequestType currentType = RequestType.open;

  _getOrders() async {
    await requestsRepository.fetchAllOrders();
    notifyListeners();
  }

  close(RequestOrder order) {
    order.closetAt = DateTime.now();
    order.finished = true;
    notifyListeners();
  }

  hasPendingRequestFor(int patrimony) {
    return getPendingOrders().any((element) => element.patrimony == patrimony);
  }

  List<RequestOrder> getPendingOrders() {
    return requestsRepository.requets
        .where((element) => !element.finished)
        .toList();
  }

  List<RequestOrder> getFinishedOrders() {
    return requestsRepository.requets
        .where((element) => element.finished)
        .toList();
  }

  List<RequestOrder> getOrders() {
    switch (currentType) {
      case RequestType.open:
        return getPendingOrders();
      case RequestType.closed:
        return getFinishedOrders();
      default:
        return [];
    }
  }

  void toggle() {
    currentType =
        currentType == RequestType.open ? RequestType.closed : RequestType.open;
    notifyListeners();
  }

  void addOrder(RequestOrder order) {
    requestsRepository.requets.add(order);
    notifyListeners();
  }

  RequestOrder getOrderById(String id) {
    return orders.where((element) => element.id == id).first;
  }

  List<RequestOrder> get orders => requestsRepository.requets;
}
