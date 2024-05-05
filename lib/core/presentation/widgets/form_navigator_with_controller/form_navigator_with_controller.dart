import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/language_bloc/language_bloc.dart';
import '../../../constants/colors.dart';
import '../../blocs/language_bloc/language_bloc.dart';
import 'form_navigator_controller.dart';

class FormNavigationWithController extends StatefulWidget {
  final double? width;
  final Function(int) onChanged;
  final FormNavigationController controller;

  const FormNavigationWithController({
    Key? key,
    required this.onChanged,
    this.width,
    required this.controller,
  }) : super(key: key);

  @override
  State<FormNavigationWithController> createState() =>
      _FormNavigationWithControllerState();
}

class _FormNavigationWithControllerState
    extends State<FormNavigationWithController> {
  bool isArabic = false;

  @override
  void initState() {
    super.initState();
    isArabic = context.read<LanguageBloc>().state.languageCode == 'ar';
    widget.controller.addListener(_onControllerUpdated);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdated);
    super.dispose();
  }

  void _onControllerUpdated() {
    setState(() {
      // Trigger a rebuild when the controller updates
    });
  }

  void updateIndex(int value) {
    widget.controller.updateIndex(value);
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = widget.controller.currentIndex;
    final length = widget.controller.length;

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
            '$currentIndex / $length',
          ),
          TextButton(
            onPressed: () {
              if (currentIndex < length) {
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
              updateIndex(length);
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
