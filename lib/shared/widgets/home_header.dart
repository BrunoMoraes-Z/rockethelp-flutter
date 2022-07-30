import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rocket_help/controllers/requests_controller.dart';
import 'package:rocket_help/shared/constants.dart';
import 'package:rocket_help/shared/widgets/menu_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          // Logo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            decoration: const BoxDecoration(
              color: Constants.gray600,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/secondaryLogo.svg',
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.logout,
                    color: Constants.gray300,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Solicitações
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Solicitações',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Consumer<RequestsController>(
                  builder: (context, controller, child) {
                    return Text(
                      '${controller.getOrders().length}',
                      style: const TextStyle(
                        color: Constants.gray300,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Menu
          Consumer<RequestsController>(
            builder: (context, controller, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    MenuButton(
                      label: 'EM ANDAMENTO',
                      onTap: () {
                        if (controller.currentType == RequestType.closed) {
                          controller.toggle();
                        }
                      },
                      selected: controller.currentType == RequestType.open,
                      color: Constants.secondary,
                    ),
                    const SizedBox(width: 8),
                    MenuButton(
                      label: 'FINALIZADOS',
                      onTap: () {
                        if (controller.currentType == RequestType.open) {
                          controller.toggle();
                        }
                      },
                      selected: controller.currentType == RequestType.closed,
                      color: Constants.green300,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
