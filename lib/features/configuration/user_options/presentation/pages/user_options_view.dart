import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/custom_error_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/empty_widgets/custom_empty_widget.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/core/utils/logger.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/entities/them_entity.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/manager/user_options_cubit.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/widgets/user_options_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';

class UserOptionView extends StatefulWidget {
  const UserOptionView({super.key});

  @override
  State<UserOptionView> createState() => _UserOptionViewState();
}

class _UserOptionViewState extends State<UserOptionView> {
  late CustomDropdownController startPageDropdownController;
  late CustomDropdownController startListThemeDropdownController;
  late AppLocalizations appLocalizations;
  List<ThemeEntity> mainThemeList= [];

  @override
  void initState() {
    super.initState();
    startListThemeDropdownController = CustomDropdownController();
    startPageDropdownController = CustomDropdownController();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    startListThemeDropdownController.dispose();
    startPageDropdownController.dispose();
  }
  void handleSuccess(List<ThemeEntity> themeList)async{
   final pageThemeId = await context.read<UserOptionsCubit>().getPageTheme();

   final listThemeId = await context.read<UserOptionsCubit>().getListTheme();
   LoggerSingleton.logger.w(pageThemeId);
   if (pageThemeId != null && listThemeId !=null) {
     startListThemeDropdownController.setValue(listThemeId);
     startPageDropdownController.setValue(pageThemeId);
   }else {
    startListThemeDropdownController.setValue(themeList[0].themeNumber);
     startPageDropdownController.setValue(themeList[0].themeNumber);
   }



  }
  void saveThemes(){
    if (mainThemeList.isNotEmpty){
      context.read<UserOptionsCubit>().saveThemes(
          pageTheme: startPageDropdownController.value,
          listTheme: startListThemeDropdownController.value);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
        onSavePressed: () => saveThemes(),
        title: appLocalizations.user_options,
        saveBtnColor: Colors.white,
        color: AppColors.primaryColor,
        textColor: Colors.white,
      ),
      body: BlocBuilder<UserOptionsCubit, UserOptionsState>(
        builder: (context, state) {
          return state.when(
              initial: ()=> SizedBox(),
              loading: () => Loader(),
              success: (themeList){
                mainThemeList = themeList;
                handleSuccess(themeList);

              return  Column(
                  children: [
                    Expanded(child: UserOptionsContainer(
                        startPageDropdownController: startPageDropdownController,
                        startListThemeDropdownController: startListThemeDropdownController,
                        appLocalizations: appLocalizations,
                        themeList: themeList,
                    )),
                  ],
                );
              },
              empty: () => CustomEmptyWidget(text: appLocalizations.no_data,),
              error: (msg)=> CustomErrorWidget(errorMessage: msg,)
          );
        },
      ),
    );
  }
}
