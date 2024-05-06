import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/presentation/widgets/card.dart';
import '../../home_models/screen_item_model.dart';

class ScreenItemCard extends StatelessWidget {
  final ScreenItem data;
  const ScreenItemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          data.onPressed();
        },
        child: CustomCard(
            color: AppColors.primaryColor,
            isExpanded: true,
            // padding: const EdgeInsets.symmetric(vertical: 35),
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/home_icons/${data.iconName}.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 150,
                    child: Text(
                      data.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
