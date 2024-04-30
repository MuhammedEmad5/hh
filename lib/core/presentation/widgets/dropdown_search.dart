// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'label.dart';

class DropdownSearch extends StatefulWidget {
  List<String> items;
  final Function(String) onChanged;
  final double? width;
  final String? initialValue;
  final String? label;
  final Color? labelColor;
  DropdownSearch({
    super.key,
    required this.items,
    this.initialValue,
    this.width,
    this.label,
    this.labelColor,
    required this.onChanged,
  });

  @override
  State<DropdownSearch> createState() => _DropdownSearchState();
}

class _DropdownSearchState extends State<DropdownSearch> {
  List<String> _filteredItems = [];
  String selectedValue = "";

  void _onFocusChange() {
    if (focusNode.hasFocus) {
      setState(() {
        showList = true;
      });
    }
    if (!focusNode.hasFocus) {
      // setState(() {
      //   showList = false;
      // });
      // if (!widget.items.contains(controller.text)) {
      //   controller.text = selectedValue;
      // }
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange); // Remove listener when done
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
    _filteredItems = widget.items;
    focusNode.addListener(_onFocusChange);
  }

  void _onTextChanged(String term) {
    setState(() {
      _filteredItems = widget.items
          .where(
            (item) => item.toLowerCase().contains(
                  term.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  bool showList = false;
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Label(
                  text: widget.label!,
                  color: widget.labelColor,
                )
              : const SizedBox(),
          SizedBox(
            height: widget.label != null ? 10 : 0,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Visibility(
                visible: showList,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.backgroundColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                          width: double.infinity,
                        ),
                        ..._filteredItems.map(
                          (e) => MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () {
                              setState(() {
                                controller.text = e;
                                selectedValue = e;
                                showList = false;
                                widget.onChanged(e);
                              });
                            },
                            child: Text(e),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.backgroundColor,
                ),
              ),
              TextField(
                focusNode: focusNode,
                controller: controller,
                onChanged: (value) {
                  _onTextChanged(value);
                },
                style: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return const TextStyle(
                        color: Colors.black,
                      );
                    } else {
                      return const TextStyle(color: null);
                    }
                  },
                ),
                decoration: InputDecoration(
                  focusColor: AppColors.primaryColor,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  counterText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      showList ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 30,
                    ),
                    onPressed: focusNode.hasFocus
                        ? () {
                            setState(() {
                              showList = !showList;
                              if (!focusNode.hasFocus) {
                                focusNode.requestFocus();
                              }
                            });
                          }
                        : null,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
