import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.leading,
    required this.title,
    required this.trailing,
  });
  final Widget title;
  final Widget leading;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              spacing: 10,
              children: [
                IconTheme.merge(child: leading, data: IconThemeData(size: 24)),
                Flexible(
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyLarge!,
                    overflow: TextOverflow.ellipsis,
                    child: title,
                  ),
                ),
              ],
            ),
          ),
          Flexible(flex: 3, child: FittedBox(child: trailing)),
        ],
      ),
    );
  }
}
