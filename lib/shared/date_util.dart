import 'package:intl/intl.dart';

formatDate(DateTime time) {
  final formatter = DateFormat('dd/MM/yy');
  return '${formatter.format(time)} às ${time.hour}h';
}
