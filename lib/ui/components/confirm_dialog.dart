
import 'file:///C:/Users/jorge/AndroidStudioProjects/serviceAppFlutter/lib/ui/components/button.dart';
import 'package:flutter/material.dart';
import 'package:serviceapp/global_methods.dart';
import 'package:serviceapp/ui/components/textTypes/small_text.dart';

class ConfirmDialog extends StatefulWidget {
  Widget widget;
  Function function;
  BuildContext context;

  ConfirmDialog(this.widget, this.function);

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  double HEIGHT;
  double WIDHT;

  @override
  void initState() {
    widget.context = this.context;
  }

  @override
  Widget build(BuildContext context) {
    HEIGHT = MediaQuery.of(context).size.height;
    WIDHT = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Color.fromRGBO(30, 31, 32, 1),
      title: Center(child: widget.widget),
      content: Row(
        children: <Widget>[
          MyButton(
            () => GlobalMethods().popPage(context),
            SmallText('No'),
            color: Color.fromRGBO(230, 73, 90, 1),
            height: HEIGHT * 0.04,
          ),
          MyButton(widget.function, SmallText('Sí'),
              color: Color.fromRGBO(230, 73, 90, 1), height: HEIGHT * 0.04),
        ],
      ),
    );
  }
}
