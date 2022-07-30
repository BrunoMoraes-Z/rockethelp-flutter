import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rocket_help/controllers/request_controller.dart';
import 'package:rocket_help/controllers/requests_controller.dart';
import 'package:rocket_help/repositories/requests_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => RequestsRepository(),
  ),
  ChangeNotifierProvider(
    create: (context) => RequestsController(
      requestsRepository: context.read<RequestsRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => RequestController(),
  )
];
