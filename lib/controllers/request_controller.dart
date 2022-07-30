import 'package:flutter/cupertino.dart';
import 'package:rocket_help/controllers/requests_controller.dart';
import 'package:rocket_help/models/request_order.dart';

class RequestController extends ChangeNotifier {
  late int? patrimony = -1;
  late String? description;

  String create(RequestsController controller) {
    if (_validate()) {
      if (controller.hasPendingRequestFor(patrimony!)) {
        return 'Já existe um registro em andamento\npara este patrimonio.';
      }
      controller.addOrder(
        RequestOrder(
          patrimony: patrimony!,
          description: description!,
          createdAt: DateTime.now(),
        ),
      );
      patrimony = null;
      description = null;
      return '';
    }
    return 'É nescessário preencher os campos.';
  }

  bool _validate() {
    return patrimony != null &&
        patrimony! > 0 &&
        description != null &&
        description!.isNotEmpty;
  }

  void setPatrimony(String value) {
    patrimony = int.tryParse(value) ?? -1;
  }

  void setDescription(String value) {
    description = value.trim();
  }
}
