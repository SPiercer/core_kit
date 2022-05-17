import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpandableCustomWidget extends StatefulWidget {
  const ExpandableCustomWidget({
    Key? key,
    required this.child,
    required this.expandableImagePath,
    required this.expandableTitle,
  }) : super(key: key);

  final Widget child;
  final String expandableImagePath;
  final String expandableTitle;

  @override
  State<ExpandableCustomWidget> createState() => _ExpandableCustomWidgetState();
}

class _ExpandableCustomWidgetState extends State<ExpandableCustomWidget> {
  ExpandableController? expandableController;

  @override
  void initState() {
    expandableController = ExpandableController(
      initialExpanded: false,
    );
    expandableController!.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      collapsed: widget.child,
      controller: expandableController,
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapBodyToCollapse: true,
        iconPadding: EdgeInsets.symmetric(
          horizontal: 28,
        ),
        expandIcon: Icons.keyboard_arrow_left,
        collapseIcon: Icons.keyboard_arrow_down,
        iconRotationAngle: 0,
      ),
      header: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 18,
              height: 18,
              child: SvgPicture.asset(
                widget.expandableImagePath,
                height: 16,
                width: 16,
                color: expandableController!.expanded
                    ? Theme.of(context).primaryColor
                    : const Color(0xFF6e6b7b),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.expandableTitle,
              style: TextStyle(
                color: expandableController!.expanded
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
      builder: (_, collapsed, expanded) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Expandable(
            collapsed: collapsed,
            expanded: expanded,
            theme: const ExpandableThemeData(
              crossFadePoint: 0,
            ),
          ),
        );
      },
      expanded: widget.child,
    );
  }
}
