import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/language_bloc/language_bloc.dart';
import '../../constants/colors.dart';

class FormNavigation extends StatefulWidget {
  final int length;
  final double? width;
  final Function(int) onChanged;
  final int? pagerIndex;
  final Function(int)? setPagerIndex;
  const FormNavigation({
    super.key,
    required this.length,
    required this.onChanged,
    this.width,
    this.pagerIndex,
    this.setPagerIndex,
  });

  @override
  State<FormNavigation> createState() => _FormNavigationState();
}

class _FormNavigationState extends State<FormNavigation> {
  int currentIndex = 1;
  bool isArabic = false;

  updateIndex(value) {
    if (widget.setPagerIndex != null) {
      widget.setPagerIndex!(value);
    } else {
      setState(() {
        currentIndex = value;
      });
    }
    widget.onChanged(value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isArabic =
        context.read<LanguageBloc>().state.languageCode == 'ar' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    currentIndex =
        widget.pagerIndex != null ? widget.pagerIndex! : currentIndex;
    return Container(
      height: 60,
      width: widget.width,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 3)],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              updateIndex(1);
            },
            child: Transform.flip(
              flipX: isArabic ? false : true,
              child: const Icon(
                color: AppColors.primaryColor,
                Icons.fast_forward,
                size: 30,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (currentIndex > 1) {
                updateIndex(currentIndex - 1);
              }
            },
            child: Transform.flip(
              flipX: isArabic ? false : true,
              child: const Icon(
                color: AppColors.primaryColor,
                Icons.play_arrow,
                size: 30,
              ),
            ),
          ),
          Text(
            '${widget.pagerIndex ?? currentIndex} / ${widget.length}',
          ),
          TextButton(
            onPressed: () {
              if (currentIndex < widget.length) {
                updateIndex(currentIndex + 1);
              }
            },
            child: Transform.flip(
              flipX: isArabic ? true : false,
              child: const Icon(
                color: AppColors.primaryColor,
                Icons.play_arrow,
                size: 30,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              updateIndex(widget.length);
            },
            child: Transform.flip(
              flipX: isArabic ? true : false,
              child: const Icon(
                color: AppColors.primaryColor,
                Icons.fast_forward,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
