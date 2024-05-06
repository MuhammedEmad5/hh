import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:InvoiceF/core/presentation/views/example_view.dart';
import '../../constants/colors.dart';
import '../../navigation/navigation.dart';
import 'label.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showSettings;
  final Color? color;
  final Color? textColor;
  final Color? addBtnColor;
  final Color? saveBtnColor;
  final Widget? actionButton;
  final Function? onSavePressed;
  final Function? onAddPressed;
  const CustomAppBar({
    super.key,
    this.title = 'Invoice App',
    this.color,
    this.textColor,
    this.addBtnColor,
    this.saveBtnColor,
    this.showBack = true,
    this.showSettings = false,
    this.actionButton,
    this.onSavePressed,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: textColor),
        maxLines: 2,
      ),
      backgroundColor: color,
      leading: !showBack
          ? null
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: BackButton(
                  color: textColor,
                  onPressed: () {
                    AppNavigation.pop();
                  }),
            ),
      actions: [
        onAddPressed != null
            ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    onAddPressed!();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Column(
                      children: [
                        Icon(
                          Icons.post_add,
                          color: addBtnColor ?? AppColors.primaryColor,
                          size: 28,
                        ),
                        Label(
                          text: AppLocalizations.of(context)!.add,
                          color: addBtnColor ?? AppColors.primaryColor,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        onSavePressed != null
            ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    onSavePressed!();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Column(
                      children: [
                        Icon(
                          Icons.save,
                          color: saveBtnColor ?? AppColors.onPrimary,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Label(
                          text: AppLocalizations.of(context)!.save,
                          color: saveBtnColor ?? AppColors.onPrimary,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        actionButton != null ? actionButton! : const SizedBox(),
        !showSettings
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () {
                    AppNavigation.push(const ExampleView());
                  },
                  icon: Icon(
                    Icons.settings_outlined,
                    color: textColor,
                  ),
                ),
              ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
