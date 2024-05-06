import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/presentation/widgets/toast_notification.dart';

class HintView extends StatelessWidget {
  const HintView({super.key});

  void launchMyURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.hint,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.to_request_technical_support_visit,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            try {
              launchMyURL("https://www.AppyInnovate.com");
            }catch(e){

              showToast(
                  context: context,
                  message: e.toString(),
                  backgroundColor: Colors.red);
            }
          },
          child: Text(
            'https://www.AppyInnovate.com',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.by_using_this_software,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            try {
              launchMyURL("https://www.AppyInnovate.com");
            }catch(e){

              showToast(
                  context: context,
                  message: e.toString(),
                  backgroundColor: Colors.red);
            }
          },
          child: Text(
            'https://www.AppyInnovate.com',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
          ),
        ),
      ],
    );
  }
}
