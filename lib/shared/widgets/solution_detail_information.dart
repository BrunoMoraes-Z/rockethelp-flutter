import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:rocket_help/models/request_order.dart';
import 'package:rocket_help/shared/constants.dart';
import 'package:rocket_help/shared/date_util.dart';

class SolutionDetailInformation extends StatefulWidget {
  const SolutionDetailInformation({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RequestOrder order;

  @override
  State<SolutionDetailInformation> createState() =>
      _SolutionDetailInformationState();
}

class _SolutionDetailInformationState extends State<SolutionDetailInformation> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                PhosphorIcons.circle_wavy_check,
                color: Constants.primary,
              ),
              SizedBox(width: 8),
              Text(
                'SOLUÇÃO',
                style: TextStyle(
                  color: Constants.gray300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          !widget.order.finished
              ? OnGoingTextField(
                  order: widget.order,
                  controller: controller,
                )
              : FineshedText(order: widget.order),
          const Spacer(),
          if (widget.order.finished)
            Divider(
              color: Constants.gray300.withOpacity(0.7),
            ),
          if (widget.order.finished)
            Text(
              'Finalizado em ${formatDate(widget.order.closetAt ?? DateTime.now())}',
              style: const TextStyle(
                color: Constants.gray300,
              ),
            ),
        ],
      ),
    );
  }
}

class OnGoingTextField extends StatefulWidget {
  const OnGoingTextField({
    Key? key,
    required this.order,
    required this.controller,
  }) : super(key: key);

  final RequestOrder order;
  final TextEditingController controller;

  @override
  State<OnGoingTextField> createState() => _OnGoingTextFieldState();
}

class _OnGoingTextFieldState extends State<OnGoingTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: TextField(
        controller: widget.controller,
        textInputAction: TextInputAction.newline,
        maxLines: null,
        onChanged: (value) {
          value = value.trim();
          widget.order.solution = value;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        cursorColor: Constants.green500,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}

class FineshedText extends StatelessWidget {
  const FineshedText({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RequestOrder order;

  @override
  Widget build(BuildContext context) {
    return Text(
      order.solution,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
