import 'package:flutter/cupertino.dart';

typedef void OnChanged(value);

class TextField extends StatelessWidget {
  const TextField(
      {this.placeholder, this.keyboardType, this.onChanged, this.icon});
  final String placeholder;
  final TextInputType keyboardType;
  final OnChanged onChanged;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      prefix: Icon(
        icon,
        color: CupertinoColors.lightBackgroundGray,
        size: 28,
      ),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: keyboardType,
      autocorrect: false,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: CupertinoColors.inactiveGray,
          ),
        ),
      ),
      placeholder: placeholder,
      onChanged: onChanged,
    );
  }
}
