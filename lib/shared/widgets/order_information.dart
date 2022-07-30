import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:rocket_help/models/request_order.dart';
import 'package:rocket_help/shared/constants.dart';

class OrderIdentification extends StatelessWidget {
  const OrderIdentification({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RequestOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
                PhosphorIcons.desktop_tower,
                color: Constants.primary,
              ),
              SizedBox(width: 8),
              Text(
                'EQUIPAMENTO',
                style: TextStyle(
                  color: Constants.gray300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Patrimônio ${order.patrimony.toString().padLeft(6, '0')}',
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
