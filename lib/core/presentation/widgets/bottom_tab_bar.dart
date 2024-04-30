import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'label.dart';

class BottomTabBar extends StatefulWidget {
  final TabController tabController;
  final List<String> items;
  const BottomTabBar(
      {super.key, required this.tabController, required this.items});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          ...widget.items.map(
            (e) => Flexible(
              flex: 1,
              child: MaterialButton(
                minWidth: double.infinity,
                height: double.infinity,
                color: widget.tabController.index == widget.items.indexOf(e)
                    ? AppColors.primaryColor
                    : null,
                onPressed: () {
                  setState(() {
                    widget.tabController.index = widget.items.indexOf(e);
                  });
                },
                child: Label(
                  text: e,
                  color: widget.tabController.index == widget.items.indexOf(e)
                      ? AppColors.onPrimary
                      : null,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
