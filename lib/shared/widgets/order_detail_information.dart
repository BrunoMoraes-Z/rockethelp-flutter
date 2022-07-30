import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:rocket_help/models/request_order.dart';
import 'package:rocket_help/shared/constants.dart';
import 'package:rocket_help/shared/date_util.dart';

class OrderDetailInformation extends StatelessWidget {
  const OrderDetailInformation({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RequestOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Constants.gray600,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                PhosphorIcons.clipboard_text,
                color: Constants.primary,
              ),
              SizedBox(width: 8),
              Text(
                'DESCRIÇÂO DO PROBLEMA',
                style: TextStyle(
                  color: Constants.gray300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            order.description,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Divider(
            color: Constants.gray300.withOpacity(0.7),
          ),
          Text(
            'Registrado em ${formatDate(order.createdAt)}',
            style: const TextStyle(
              color: Constants.gray300,
            ),
          )
        ],
      ),
    );
  }
}
