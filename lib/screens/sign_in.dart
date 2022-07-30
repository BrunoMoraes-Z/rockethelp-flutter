import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocket_help/screens/home.dart';

import '../shared/constants.dart';
import '../shared/widgets/my_button.dart';
import '../shared/widgets/my_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.gray600,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 64),
                      SvgPicture.asset(
                        'assets/primaryLogo.svg',
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                  Positioned.fill(
                    top: 210,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .45,
                        child: Column(
                          children: [
                            // const SizedBox(height: 164),
                            // const SizedBox(height: 50),
                            const Text(
                              'Acesse sua conta',
                              style: TextStyle(
                                fontSize: 16,
                                color: Constants.gray100,
                              ),
                            ),
                            const SizedBox(height: 24),
                            MyTextField(
                              icon: PhosphorIcons.envelope,
                              placeholder: 'E-mail',
                              onChange: (value) {},
                              validator: Constants.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            MyTextField(
                              icon: PhosphorIcons.key,
                              placeholder: 'Senha',
                              obscure: true,
                              onChange: (value) {},
                              validator: Constants.passwordValidator,
                            ),
                            const SizedBox(height: 32),
                            MyButton(
                              label: 'Entrar',
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              },
                              // enabled: false,
                            ),
                            const Spacer()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
