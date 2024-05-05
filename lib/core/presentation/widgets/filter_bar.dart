import 'dart:io';
import 'package:InvoiceF_Bills/core/presentation/widgets/text_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants/colors.dart';
import 'dropdown.dart';
import 'icon_button.dart';
import '../widgets/text_box.dart';


class FilterBar extends StatefulWidget {
  final double expandedHeight;
  final Function onClearPressed;
  final Function onApplyPressed;
  final Function onAddPressed;
  final Function(String) onSearchTermChanged;
  final Function(dynamic) onSearchFieldChanged;
  const FilterBar({
    super.key,
    required this.expandedHeight,
    required this.onClearPressed,
    required this.onApplyPressed,
    required this.onAddPressed,
    required this.onSearchTermChanged,
    required this.onSearchFieldChanged,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool showFilters = false;
  bool isLargeScreen =
      Platform.isLinux || Platform.isMacOS || Platform.isWindows ? true : false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: isLargeScreen
          ? 220
          : showFilters
              ? 310
              : 62,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextIconButton(
                onTap: () {
                  setState(
                    () {
                      showFilters = !showFilters;
                    },
                  );
                },
                title: 'Filter',
                icon: isLargeScreen
                    ? Icons.search
                    : showFilters
                        ? Icons.arrow_circle_up
                        : Icons.arrow_circle_down,
                iconColor: AppColors.onPrimary,
                textColor: AppColors.onPrimary,
              ),
              CustomIconButton(icon: Icons.add, onTap: widget.onAddPressed),
            ],
          ),
          // ...widget.children,
          isLargeScreen
              ? Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: TextBox(
                        label: 'Search term',
                        overAllColor: AppColors.onPrimary,
                        onChanged: widget.onSearchTermChanged,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DropDown(
                        label: 'Search in field:',
                        items: const [
                          'All Fields',
                          'Arabic Name',
                          'Contact 1',
                          'VAT #'
                        ],
                        initialValue: 'All Fields',
                        onChanged: (value) {},
                        overAllColor: AppColors.onPrimary,
                      ),
                    ),
                  ],
                )
              : Visibility(
                  maintainState: true,
                  visible: showFilters,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const TextBox(
                        label: 'Search term',
                        overAllColor: AppColors.onPrimary,
                      ),
                      DropDown(
                        label: 'Search in field:',
                        items: const [
                          'All Fields',
                          'id',
                          'Arabic Name',
                          'Contact 1',
                          'VAT #'
                        ],
                        initialValue: 'All Fields',
                        onChanged: widget.onSearchFieldChanged,
                        overAllColor: AppColors.onPrimary,
                      ),
                    ],
                  ),
                ),
          Visibility(
            maintainState: true,
            visible: isLargeScreen ? true : showFilters,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.onClearPressed();
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    color: Colors.white,
                  ),
                  TextIconButton(
                    title: 'Apply',
                    icon: Icons.find_in_page,
                    iconColor: AppColors.onPrimary,
                    textColor: AppColors.onPrimary,
                    onTap: widget.onApplyPressed,
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
