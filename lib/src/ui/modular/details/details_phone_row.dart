import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core_kit.dart';
import '../../assets/assets.gen.dart';

class DetailsPhoneRow extends StatelessWidget {
  const DetailsPhoneRow({
    Key? key,
    required this.label,
    required this.phone,
  }) : super(key: key);

  final String label;
  final dynamic phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (phone != null) {
          launch('tel:' + phone);
        }
      },
      child: DetailsPadding(
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            ConditionalBuilder(
              condition: phone != null,
              builder: (context) => Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          phone ?? '--',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Assets.icons.phone.svg(
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
              fallback: (context) => const Expanded(
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 15,
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
