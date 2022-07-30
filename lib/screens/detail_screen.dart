import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:rocket_help/controllers/requests_controller.dart';
import 'package:rocket_help/models/request_order.dart';
import 'package:rocket_help/shared/constants.dart';
import 'package:rocket_help/shared/widgets/back_header.dart';
import 'package:rocket_help/shared/widgets/my_button.dart';
import 'package:rocket_help/shared/widgets/order_detail_information.dart';
import 'package:rocket_help/shared/widgets/order_information.dart';
import 'package:rocket_help/shared/widgets/solution_detail_information.dart';

class DetailRequestScreen extends StatelessWidget {
  const DetailRequestScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RequestOrder order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.gray700,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 130,
              color: Constants.gray600,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: BackHeader(),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 48,
                    color: Constants.gray400,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            order.finished
                                ? PhosphorIcons.circle_wavy_check
                                : PhosphorIcons.hourglass,
                            color: order.finished
                                ? Constants.green300
                                : Constants.secondary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            order.finished ? 'FINALIZADO' : 'EM ANDAMENTO',
                            style: TextStyle(
                              color: order.finished
                                  ? Constants.green300
                                  : Constants.secondary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 144,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderIdentification(order: order),
                    const SizedBox(height: 16),
                    OrderDetailInformation(order: order),
                    const SizedBox(height: 16),
                    SolutionDetailInformation(order: order),
                    SizedBox(height: order.finished ? 16 : 86),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Visibility(
                        visible: !order.finished,
                        child: MyButton(
                          label: 'Finalizar',
                          onTap: () {
                            final requestsController =
                                context.read<RequestsController>();
                            FocusScope.of(context).unfocus();
                            if (order.solution.isEmpty) {
                            } else {
                              requestsController.close(order);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
