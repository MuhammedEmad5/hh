import 'package:InvoiceF_Configuration/features/configuration/user_registration/presentation/pages/user_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../../../../core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import '../../../../../core/presentation/widgets/loader_widget.dart';
import '../../../branch/presentation/manager/branch_cubit.dart';
import '../../domain/entities/user_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../manager/user_registration_cubit.dart';
import '../widgets/user_registration_form_card.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {

  List<User> usersList = [];
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
  }

  void onAddPressed() {
    context.read<BranchCubit>().getAllBranches();
    AppNavigation.push(


        MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value:   GetIt.I<BranchCubit>(),
              ),
               BlocProvider.value(
                 value:   GetIt.I<UserRegistrationCubit>(),
               )
            ],
          child: UserFormView(index: usersList.length + 1,),
    )


    )

    ;
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.user_registration,
        onAddPressed: () => onAddPressed(),
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        addBtnColor: AppColors.onPrimary,
      ),
      body: BlocBuilder<UserRegistrationCubit, UserRegistrationState>(
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox(),
              loading: () =>  Center(child: Loader(),),
              empty: () => const CustomEmptyWidget( text: "No User inserted before"),
              success: (users) {
                usersList = users;
                return SingleChildScrollView(
                  child: Column(
                    children: usersList.map((user) {
                      return UserRegistrationFormCard(user: user);
                    }).toList(),
                  ),
                );
              },
              error: (e) =>CustomErrorWidget(errorMessage: e,)
          );


        },
      ),
    );
  }
}
