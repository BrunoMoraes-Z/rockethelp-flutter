import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rocket_help/screens/detail_screen.dart';
import 'package:rocket_help/screens/new_request.dart';

import '../controllers/requests_controller.dart';
import '../shared/constants.dart';
import '../shared/widgets/home_header.dart';
import '../shared/widgets/my_button.dart';
import '../shared/widgets/request_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.gray700,
      body: Stack(
        children: [
          const HomeHeader(),
          // Solicitações
          Container(
            margin: const EdgeInsets.only(
              top: 200,
              bottom: 80,
            ),
            child: Consumer<RequestsController>(
              builder: (context, controller, child) {
                if (controller.getOrders().isEmpty) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/messageBallon.png',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          controller.currentType == RequestType.open
                              ? 'Você ainda não\ntem solicitações criadas.'
                              : 'Você ainda não\ntem solicitações finalizadas.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Constants.gray300,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: controller.getOrders().map((request) {
                          return RequestCard(
                            key: Key(request.id),
                            patrimony: request.patrimony,
                            time: request.createdAt,
                            finished: request.finished,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailRequestScreen(
                                    order: request,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyButton(
                label: 'Nova Solicitação',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewRequestScreen(),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
