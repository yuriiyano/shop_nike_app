import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/models/index.dart';

class CheckoutReceiverInfoItem extends StatelessWidget {
  const CheckoutReceiverInfoItem({
    super.key,
    required this.receiver,
    required this.infoLabel,
    required this.infoValue,
    required this.horizontalPadding,
  });

  final ReceiverModel receiver;
  
  final String infoLabel;
  final String infoValue;

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$infoLabel:',
                style: const TextStyle(
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                infoValue,
                style: const TextStyle(
                  fontFamily: FontFamily.helveticaNowText,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 2, color: Colors.grey),
        ],
      ),
    );
  }
}
