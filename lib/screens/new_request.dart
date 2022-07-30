import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:rocket_help/controllers/request_controller.dart';
import 'package:rocket_help/shared/constants.dart';
import 'package:rocket_help/shared/widgets/back_header.dart';
import 'package:rocket_help/shared/widgets/my_button.dart';
import 'package:rocket_help/shared/widgets/text_input.dart';

class NewRequestScreen extends StatelessWidget {
  const NewRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RequestController>();
    return Scaffold(
      backgroundColor: Constants.gray600,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      MyTextInput(
                        label: 'Número do Património',
                        size: 6,
                        onChange: controller.setPatrimony,
                      ),
                      const SizedBox(height: 16),
                      MyTextInput(
                        label: 'Descrição do problema',
                        onChange: controller.setDescription,
                        expanded: true,
                      ),
                      const SizedBox(height: 16),
                      MyButton(
                        label: 'Cadastrar',
                        onTap: () {
                          String result = controller.create(context.read());
                          if (result.isEmpty) {
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Constants.error,
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(result),
                                    const Icon(
                                      PhosphorIcons.warning,
                                      color: Constants.gray600,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: BackHeader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
