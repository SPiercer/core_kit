import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerSingleItem extends StatelessWidget {
  const DrawerSingleItem({
    Key? key,
    this.title,
    this.onTap,
    this.iconPath,
    this.iconColor = const Color(0xFF848484),
  }) : super(key: key);
  final String? title;
  final VoidCallback? onTap;
  final String? iconPath;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: iconPath != null ? 24 : 18,
          vertical: 12,
        ),
        child: Row(
          children: [
            iconPath != null
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: SvgPicture.asset(
                      iconPath!,
                      color: const Color(0xFF6e6b7b),
                    ),
                  )
                : Container(
                    width: 10,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
