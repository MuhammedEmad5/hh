import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validator {
  final BuildContext context;
  final AppLocalizations appLocalizations;

  Validator(this.context) : appLocalizations = AppLocalizations.of(context)!;

  String? validate(String? filledValue,String filledName ) {
    if (filledValue == null || filledValue.isEmpty) {
      return  "$filledName ${appLocalizations.is_required}";
    }
    return null;
  }
}