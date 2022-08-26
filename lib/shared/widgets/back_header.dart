import 'package:flutter/material.dart';

class BackHeader extends StatelessWidget {
  const BackHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            key: const Key('returnToHome'),
            onTap: () => Navigator.pop(context),
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 8),
            child: const Text(
              'Solicitação',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
