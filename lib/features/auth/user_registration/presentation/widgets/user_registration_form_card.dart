import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/checkbox.dart';
import '../../../../../core/presentation/widgets/label.dart';
import '../../domain/entities/user_entity.dart';
import '../manager/user_registration_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../pages/user_form_view.dart';
import 'package:InvoiceF_ClientVendor/core/presentation/widgets/text_box.dart';


class UserRegistrationFormCard extends StatelessWidget {
  final User user;


  const UserRegistrationFormCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    // final screenData = BootstrapTheme.of(context);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final width = responsiveValue<double>(context,
        defaultValue: 200.0, md: 230.0, lg: 300, xl: 400);

    return CustomCard(
      child: FB5Grid(
        classNames:
            'row-cols-xs-1 row-cols-sm-1 row-cols-md-2 mx-0 mt-2 justify-content-center no-gutters',
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Label(
                text: appLocalizations.person,
                color: AppColors.primaryColor,
              ),
              const Spacer(),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                initialValue: '${user.personNumber}',
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Label(text: appLocalizations.login,
                   color: AppColors.primaryColor),
              const Spacer(),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                initialValue: user.email,
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Label(text: appLocalizations.arabic_name,
                   color: AppColors.primaryColor),
              const Spacer(),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                initialValue: user.arabicName,
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Label(
                  text: appLocalizations.english_name,
                  color: AppColors.primaryColor),
              const Spacer(),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                initialValue: user.englishName,
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Label(text: appLocalizations.contact1,
                   color: AppColors.primaryColor),
              const Spacer(),
              TextBox(
                labelWidth: width,
                isEnabled: false,
                initialValue: user.mainContact1,
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCheckbox(
                label: appLocalizations.admin,
                onChanged: (value) {},
                initialValue:  !user.isUser,
                isEnabled: false,
              ),
              CustomCheckbox(
                label: appLocalizations.user,
                onChanged: (value) {},
                initialValue: user.isUser ,
                isEnabled: false,
              ),
              IconButton(
                  onPressed: () {
                    AppNavigation.push(


                        MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                              value:   GetIt.I<BranchCubit>()..getAllBranches(),
                            ),
                            BlocProvider.value(
                              value:   GetIt.I<UserRegistrationCubit>(),
                            )
                          ],
                          child: UserFormView(index: user.personNumber,user: user,),
                        )


                    );
                  },
                  icon: const Icon(
                    Icons.description,
                    color: AppColors.primaryColor,
                  ))
            ],
          )
        ],
      ),
    );



  }
}
