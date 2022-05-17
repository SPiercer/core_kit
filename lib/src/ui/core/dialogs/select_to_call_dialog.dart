import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core_kit.dart';
import '../../assets/assets.gen.dart';

class SelectCallDialog extends StatefulWidget {
  final String? title;
  final String? message;
  final List<String>? numbers;

  const SelectCallDialog({
    Key? key,
    this.title,
    this.message,
    this.numbers,
  }) : super(key: key);

  @override
  _SelectCallDialogState createState() => _SelectCallDialogState();
}

class _SelectCallDialogState extends State<SelectCallDialog> {
  TextEditingController searchController = TextEditingController();
  List<String>? _filteredList;
  final _list = <String>[];

  @override
  void initState() {
    super.initState();
    _filteredList = widget.numbers;
    _list.addAll(_filteredList!);
  }

  @override
  Widget build(BuildContext context) {
    String? Function(String) translate = KitLocalization.of(context)!.translate;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title ?? '',
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            Flexible(
              child: SizedBox(
                height: 240,
                child: ListView.separated(
                  itemCount: _filteredList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 4,
                    color: Colors.white,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey.shade50,
                      child: ListTile(
                        onTap: () async =>
                            await launch('tel://${_filteredList![index]}'),
                        title: Text(
                          _filteredList!.elementAt(index),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                String number = _filteredList![index];
                                bool isNumberRight = false;
                                if (number.length == 11 && number[0] == '0') {
                                  number = "+2" + number;
                                  isNumberRight = true;
                                } else if (number.length == 13 &&
                                    number[0] == '+') {
                                  isNumberRight = true;
                                }
                                if (isNumberRight) {
                                  await launch(
                                      "https://wa.me/$number?text=${Uri.encodeFull(
                                    widget.message!,
                                  )}");
                                } else {
                                  Toasts.errorToast(
                                    msg: translate(
                                      LocalKeys.userExp.notFoundInWhatsApp,
                                    )!,
                                  ).show(context);
                                }
                              },
                              icon: Assets.icons.whatsapp.svg(
                                width: 20,
                                height: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () async => await launch(
                                  "sms:${_filteredList![index]}?body=${Uri.encodeFull(
                                widget.message!,
                              )}"),
                              icon: Icon(
                                Icons.message_outlined,
                                color: Theme.of(context).primaryColor,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
