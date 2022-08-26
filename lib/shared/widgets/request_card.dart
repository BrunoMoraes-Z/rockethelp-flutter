import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:rocket_help/shared/constants.dart';
import 'package:rocket_help/shared/date_util.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    Key? key,
    required this.patrimony,
    required this.time,
    required this.onTap,
    this.finished = false,
  }) : super(key: key);

  final bool finished;
  final int patrimony;
  final DateTime time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final id = '${formatDate(time)}.$patrimony'.hashCode.toString();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        key: Key(id),
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Constants.gray600,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: double.infinity,
                width: 8,
                decoration: BoxDecoration(
                  color: finished ? Constants.green300 : Constants.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patrimônio ${patrimony.toString().padLeft(6, '0')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            PhosphorIcons.clock,
                            color: Constants.gray300,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            formatDate(time),
                            style: const TextStyle(
                              color: Constants.gray300,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '-',
                            style: TextStyle(
                              color: Constants.gray300,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'ID: $id',
                            style: const TextStyle(
                              color: Constants.gray300,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Constants.gray500,
                ),
                child: Center(
                  child: Icon(
                    finished
                        ? PhosphorIcons.circle_wavy_check
                        : PhosphorIcons.hourglass,
                    color: finished ? Constants.green300 : Constants.secondary,
                  ),
                ),
              ),
              const SizedBox(width: 16)
            ],
          ),
        ),
      ),
    );
  }
}
