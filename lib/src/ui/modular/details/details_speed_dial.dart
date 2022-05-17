import 'package:flutter/material.dart';
import '../../../utils/speed_dial.dart';

class DetailsSpeedDial extends StatefulWidget {
  const DetailsSpeedDial({
    Key? key,
    required this.childButtons,
  }) : super(key: key);

  final List<SpeedDialChild> childButtons;

  @override
  State<DetailsSpeedDial> createState() => _DetailsSpeedDialState();
}

class _DetailsSpeedDialState extends State<DetailsSpeedDial>
    with TickerProviderStateMixin {
  List<SpeedDialChild>? childButtons;

  @override
  void initState() {
    childButtons = widget.childButtons;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Container(
        margin: const EdgeInsets.all(24),
        child: SpeedDial(
          child: const Icon(Icons.add_outlined),
          controller: AnimationController(
            duration: const Duration(milliseconds: 200),
            vsync: this,
          ),
          openBackgroundColor: Colors.white,
          closedForegroundColor: Colors.white,
          openForegroundColor: Theme.of(context).primaryColor,
          closedBackgroundColor: Theme.of(context).primaryColor,
          speedDialChildren: childButtons,
        ),
      ),
    );
  }
}
