import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rocket_help/shared/constants.dart';

class MyTextInput extends StatefulWidget {
  const MyTextInput({
    Key? key,
    required this.label,
    required this.onChange,
    this.size,
    this.expanded = false,
  }) : super(key: key);

  final String label;
  final bool expanded;
  final int? size;
  final Function(String) onChange;

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
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
      height: widget.expanded ? MediaQuery.of(context).size.height * 0.6 : 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Constants.gray700,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        alignment: widget.expanded ? null : Alignment.center,
        child: Stack(
          children: [
            if (widget.size != null)
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  child: Text(
                    '${controller.text.length}/${widget.size}',
                    style: TextStyle(
                      color: Constants.gray300.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            Container(
              height: widget.expanded
                  ? MediaQuery.of(context).size.height * 0.6
                  : 54,
              alignment: widget.size != null ? Alignment.center : null,
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  setState(() => widget.onChange(value));
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: widget.label,
                  hintStyle: const TextStyle(
                    color: Constants.gray300,
                  ),
                ),
                inputFormatters: widget.expanded
                    ? []
                    : [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                          widget.size,
                        ),
                      ],
                cursorColor: Constants.green700,
                keyboardType:
                    widget.expanded ? TextInputType.name : TextInputType.number,
                textInputAction: widget.expanded
                    ? TextInputAction.newline
                    : TextInputAction.next,
                maxLines: widget.expanded ? null : 1,
                style: const TextStyle(
                  color: Constants.gray300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
