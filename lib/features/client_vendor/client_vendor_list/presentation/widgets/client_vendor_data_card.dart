import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../domain/entities/client_vendor_entity/client_vendor_entity_model.dart';

class ClientVendorDataCard extends StatelessWidget {
  final ClientVendorEntity data;
  const ClientVendorDataCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(text: data.clientVendorNo.toString()),
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Label(text: data.aName ?? 'Arabic Name'),
          Label(text: data.eName ?? 'English Name'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(text: data.mainContact1 ?? 'Main Contact'),
              Label(
                text: data.VATID ?? 'VATID',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
