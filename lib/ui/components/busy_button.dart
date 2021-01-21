import 'package:flutter/material.dart';

class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final double paddingLeft, paddingRight, paddingTop, paddingBottom, textSize;

  const BusyButton(
      {@required this.title,
      this.busy = false,
      @required this.onPressed,
      this.enabled = true,
      this.paddingLeft = 80.0,
      this.paddingRight = 80.0,
      this.paddingTop = 0,
      this.paddingBottom = 0,
      this.textSize = 14});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
      padding: EdgeInsets.only(
          left: widget.paddingLeft,
          right: widget.paddingRight,
          top: widget.paddingTop,
          bottom: widget.paddingBottom),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: Colors.white)),
        onPressed: widget.onPressed,
        child: InkWell(
          child: AnimatedContainer(
            height: widget.busy ? 40 : null,
            width: widget.busy ? 40 : null,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: widget.busy ? 10 : 15,
                vertical: widget.busy ? 10 : 10),
            child: !widget.busy
                ? Text(
                    widget.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: widget.textSize),
                  )
                : CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          ),
        ),
      ),
    ));
  }
}
