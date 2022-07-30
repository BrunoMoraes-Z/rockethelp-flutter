import 'package:rocket_help/models/request_order.dart';

class RequestsRepository {
  late List<RequestOrder> requets = [];

  Future<List<RequestOrder>> fetchAllOrders() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    requets = [
      RequestOrder(
        patrimony: 1083,
        description: 'teasdasd',
        createdAt: DateTime(2022, 7, 18),
      ),
      RequestOrder(
        patrimony: 768,
        description: 'teasdasd',
        createdAt: DateTime(2022, 6, 18),
      ),
      RequestOrder(
        patrimony: 187,
        description: 'teasdasd',
        createdAt: DateTime(2022, 6, 6),
        finished: true,
        closetAt: DateTime(2022, 6, 12),
        solution: 'test',
      )
    ];
    return requets;
  }
}
