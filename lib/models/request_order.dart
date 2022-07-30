import 'package:uuid/uuid.dart';

class RequestOrder {
  final int patrimony;
  final String description;
  final DateTime createdAt;
  late bool finished;
  late DateTime? closetAt;
  late String solution;
  late String id;

  RequestOrder({
    required this.patrimony,
    required this.description,
    required this.createdAt,
    this.finished = false,
    this.closetAt,
    this.solution = '',
  }) {
    id = const Uuid().v4().toString();
  }
}
