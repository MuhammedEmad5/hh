import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/toast_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/presentation/widgets/app_bar.dart';
import '../../../../../core/presentation/widgets/bottom_tab_bar.dart';
import '../../../../../core/presentation/widgets/custom_button.dart';
import '../../../../../core/presentation/widgets/dropdown.dart';
import '../../../../../core/presentation/widgets/ok_alert.dart';
import '../../../../../core/presentation/widgets/split_screen.dart';
import '../../data/repositories/client_vendor_repo.dart';
import '../../di/client_vendor_service.dart';
import '../../domain/entities/client_vendor_entity/client_vendor_entity_model.dart';
import '../manager/client_vendor_cubit.dart';
import 'client_vendor_page.dart';
import 'package:InvoiceF/core/presentation/widgets/text_box.dart';

class AddClientVendorPage extends StatefulWidget {
  final int newIndex;
  final bool isEdit;
  final ClientVendorEntity? data;
  const AddClientVendorPage({
    super.key,
    required this.newIndex,
    this.isEdit = false,
    this.data,
  });

  @override
  State<AddClientVendorPage> createState() => _AddClientVendorPageState();
}

class _AddClientVendorPageState extends State<AddClientVendorPage>
    with TickerProviderStateMixin {
  //General Controllers
  TextEditingController clientVendorNo = TextEditingController();
  TextEditingController aName = TextEditingController();
  TextEditingController aDescription = TextEditingController();
  TextEditingController eName = TextEditingController();
  TextEditingController eDescription = TextEditingController();
  TextEditingController vATID = TextEditingController();
  TextEditingController mainContact1 = TextEditingController();
  TextEditingController mainContact2 = TextEditingController();
  TextEditingController mainContact3 = TextEditingController();
  TextEditingController mainContact4 = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController warnMaxBalance = TextEditingController();
  TextEditingController warnMinBalance = TextEditingController();
  TextEditingController maxBalanceAllowed = TextEditingController();
  TextEditingController minBalanceAllowed = TextEditingController();
  TextEditingController note = TextEditingController();
  // GAZT Controllers
  TextEditingController apartmentNum = TextEditingController();
  TextEditingController pOBoxAdditionalNum = TextEditingController();
  TextEditingController pOBox = TextEditingController();
  TextEditingController streetEng = TextEditingController();
  TextEditingController streetArb = TextEditingController();
  TextEditingController districtArb = TextEditingController();
  TextEditingController districtEng = TextEditingController();
  TextEditingController cityEng = TextEditingController();
  TextEditingController cityArb = TextEditingController();
  TextEditingController countryArb = TextEditingController();
  TextEditingController countryEng = TextEditingController();
  TextEditingController secondBusinessID = TextEditingController();
  CustomDropdownController clientVendorType = CustomDropdownController();
  CustomDropdownController secondBusinessIDType = CustomDropdownController();

  List<DropdownMenuItem<dynamic>> clientVendorTypes = [
    DropdownMenuItem(
      child: Text(AppLocalizations.of(AppNavigation.context)!.client_vendor),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text(AppLocalizations.of(AppNavigation.context)!.client),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text(AppLocalizations.of(AppNavigation.context)!.vendor),
      value: 3,
    ),
  ];

  List<DropdownMenuItem<dynamic>> secondBusinessIDTypes = [
    DropdownMenuItem(
      child: Text('National Identity'),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text('Residency Number'),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text('Passport'),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text('No. 700'),
      value: 4,
    ),
    DropdownMenuItem(
      child: Text('TIN Special Tax No.'),
      value: 5,
    ),
    DropdownMenuItem(
      child: Text('Commercial Resister CR'),
      value: 6,
    ),
    DropdownMenuItem(
      child: Text('Ministry of Municipal and Rural Affairs license'),
      value: 7,
    ),
    DropdownMenuItem(
      child: Text(
          'License of the Ministry of Human Resources and Social Development'),
      value: 8,
    ),
    DropdownMenuItem(
      child: Text('General Investment Authority license'),
      value: 9,
    ),
    DropdownMenuItem(
      child: Text('The Gulf identity of the customer'),
      value: 10,
    ),
  ];

  late TabController tabController;
  late ClientVendorEntity data;
  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      data = widget.data!;
    }
    clientVendorNo.text = '${widget.newIndex == 0 ? 1 : widget.newIndex}';
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    if (widget.isEdit && widget.data != null) {
      clientVendorType.value = data.typeOfClientOrVendor ?? 1;
      aName.text = data.aName ?? '';
      eName.text = data.eName ?? '';
      aDescription.text = data.eDescription ?? '';
      eDescription.text = data.eDescription ?? '';
      vATID.text = data.VATID ?? '';
      mainContact1.text = data.mainContact1 ?? '';
      mainContact2.text = data.mainContact2 ?? '';
      mainContact3.text = data.mainContact3 ?? '';
      mainContact4.text = data.mainContact4 ?? '';
      address.text = data.address ?? '';
      warnMaxBalance.text = data.warnMaxBalance.toString();
      warnMinBalance.text = data.warnMinBalance.toString();
      maxBalanceAllowed.text = data.maxBalanceAllowed.toString();
      minBalanceAllowed.text = data.minBalanceAllowed.toString();
      note.text = data.note ?? '';
      apartmentNum.text = data.apartmentNum ?? '';
      pOBoxAdditionalNum.text = data.POBoxAdditionalNum ?? '';
      pOBox.text = data.POBox ?? '';
      streetArb.text = data.street_Arb ?? '';
      streetEng.text = data.street_Eng ?? '';
      districtArb.text = data.district_Arb ?? '';
      districtEng.text = data.district_Eng ?? '';
      countryArb.text = data.country_Arb;
      countryEng.text = data.country_Eng;
      secondBusinessID.text = data.secondBusinessID ?? '';
      secondBusinessIDType.value = data.secondBusinessIDType ?? 1;
    } else {
      secondBusinessIDType.value = 1;
      clientVendorType.value = 1;
      warnMaxBalance.text = '0';
      warnMinBalance.text = '0';
      maxBalanceAllowed.text = '0';
      minBalanceAllowed.text = '0';
    }
  }

  @override
  void dispose() {
    clientVendorNo.dispose();
    clientVendorType.dispose();
    aName.dispose();
    aDescription.dispose();
    eName.dispose();
    eDescription.dispose();
    vATID.dispose();
    mainContact1.dispose();
    mainContact2.dispose();
    mainContact3.dispose();
    mainContact4.dispose();
    address.dispose();
    warnMaxBalance.dispose();
    warnMinBalance.dispose();
    maxBalanceAllowed.dispose();
    minBalanceAllowed.dispose();
    note.dispose();
    // Dispose GAZT controllers
    apartmentNum.dispose();
    pOBoxAdditionalNum.dispose();
    pOBox.dispose();
    streetEng.dispose();
    streetArb.dispose();
    districtArb.dispose();
    districtEng.dispose();
    cityEng.dispose();
    cityArb.dispose();
    countryArb.dispose();
    countryEng.dispose();
    secondBusinessID.dispose();
    secondBusinessIDType.dispose();
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientVendorCubit>.value(
      value: GetIt.I<ClientVendorCubit>(),
      child: BlocBuilder<ClientVendorCubit, ClientVendorState>(
        builder: (context, state) {
          handleSave() {
            ClientVendorEntity clientVendor = ClientVendorEntity(
              clientVendorNo: widget.newIndex == 0 ? 1 : widget.newIndex,
              typeOfClientOrVendor: clientVendorType.value,
              aName: aName.text.isEmpty ? 'عميل / مورد' : aName.text,
              eName: eName.text.isEmpty ? 'Client / Vendor' : eName.text,
              aDescription: aDescription.text,
              eDescription: eDescription.text,
              VATID: vATID.text,
              mainContact1: mainContact1.text,
              mainContact2: mainContact2.text,
              mainContact3: mainContact3.text,
              mainContact4: mainContact4.text,
              address: address.text,
              warnMaxBalance: num.parse(warnMaxBalance.text),
              warnMinBalance: num.parse(warnMinBalance.text),
              maxBalanceAllowed: num.parse(maxBalanceAllowed.text),
              minBalanceAllowed: num.parse(minBalanceAllowed.text),
              note: note.text,
              // GAZT
              apartmentNum: apartmentNum.text,
              POBoxAdditionalNum: pOBoxAdditionalNum.text,
              POBox: pOBox.text,
              street_Arb: streetArb.text,
              street_Eng: streetEng.text,
              district_Arb: districtArb.text,
              district_Eng: districtEng.text,
              country_Arb: countryArb.text,
              city_Eng: countryEng.text,
              secondBusinessID: secondBusinessID.text,
              secondBusinessIDType: secondBusinessIDType.value,
            );
            widget.isEdit
                ? context
                    .read<ClientVendorCubit>()
                    .updateClientVendor(clientVendorEntity: clientVendor)
                : context
                    .read<ClientVendorCubit>()
                    .insertClientVendor(clientVendor);
            showOKDialog(
              context: context,
              title: AppLocalizations.of(context)!.success,
              message: '',
              onOkPressed: () {
                AppNavigation.pop();
                ClientVendorService().initDi();
                AppNavigation.pushReplacement(RepositoryProvider(
                    create: (context) => GetIt.I<ClientVendorRepo>(),
                    child: BlocProvider<ClientVendorCubit>.value(
                      value: GetIt.I<ClientVendorCubit>()..getClientsVendors(),
                      child: const ClientVendorPage(),
                    )));
              },
            );
          }

          validate() {
            if (aName.text.isEmpty) {
              showToast(
                  context: context,
                  message:
                      AppLocalizations.of(context)!.client_vendor_validation);
            } else {
              handleSave();
            }
          }

          return Scaffold(
            appBar: CustomAppBar(
              title:
                  '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.client_vendor}',
              color: AppColors.primaryColor,
              textColor: AppColors.onPrimary,
              onSavePressed: () {
                validate();
              },
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                // General Tab --------------
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  children: [
                    const SizedBox(height: 10),
                    SplitScreenWidget(
                      child1: TextBox(
                        isNumberBox: true,
                        label: AppLocalizations.of(context)!.number,
                        // width: double.infinity,
                        isEnabled: false,
                        controller: clientVendorNo,
                      ),
                      child2: CustomDropdownWithController(
                        controller: clientVendorType,
                        title: AppLocalizations.of(context)!.type,
                        onChanged: (value) {},
                        items: clientVendorTypes,
                      ),
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.arabic_name,
                      controller: aName,
                      textDirection: TextDirection.rtl,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.arabic_description,
                      maxLines: 4,
                      controller: aDescription,
                      textDirection: TextDirection.rtl,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.english_name,
                      controller: eName,
                      textDirection: TextDirection.ltr,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.english_description,
                      maxLines: 4,
                      controller: eDescription,
                      textDirection: TextDirection.ltr,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.vat_id,
                      isNumberBox: true,
                      controller: vATID,
                    ),
                    SplitScreenWidget(
                      child1: TextBox(
                        label: '${AppLocalizations.of(context)!.contact} 1',
                        controller: mainContact1,
                      ),
                      child2: TextBox(
                        label: '${AppLocalizations.of(context)!.contact} 2',
                        controller: mainContact2,
                      ),
                    ),
                    SplitScreenWidget(
                      child1: TextBox(
                        label: '${AppLocalizations.of(context)!.contact} 3',
                        controller: mainContact3,
                      ),
                      child2: TextBox(
                        label: '${AppLocalizations.of(context)!.contact} 4',
                        controller: mainContact4,
                      ),
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.address,
                      maxLines: 4,
                      controller: address,
                    ),
                    TextBox(
                      label:
                          AppLocalizations.of(context)!.warn_balance_reach_max,
                      isNumberBox: true,
                      controller: warnMaxBalance,
                    ),
                    TextBox(
                      label:
                          AppLocalizations.of(context)!.warn_balance_reach_min,
                      isNumberBox: true,
                      controller: warnMinBalance,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.max_balance_allowed,
                      isNumberBox: true,
                      controller: maxBalanceAllowed,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.min_balance_allowed,
                      isNumberBox: true,
                      controller: minBalanceAllowed,
                    ),
                    TextBox(
                      label: AppLocalizations.of(context)!.note,
                      maxLines: 4,
                      controller: note,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                // Others Tab ----------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomButton(
                          text: AppLocalizations.of(context)!
                              .re_calc_transaction_balances,
                          onPressed: () {}),
                      CustomButton(
                          text: AppLocalizations.of(context)!
                              .re_calc_all_transaction_balances_this_client,
                          onPressed: () {}),
                      CustomButton(
                          text: AppLocalizations.of(context)!.re_calc_balances,
                          onPressed: () {}),
                      CustomButton(
                          text: AppLocalizations.of(context)!.account_statement,
                          onPressed: () {}),
                    ],
                  ),
                ),
                // GAZT Tab -------------
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextBox(
                            label:
                                AppLocalizations.of(context)!.building_number,
                            controller: apartmentNum,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextBox(
                            label:
                                AppLocalizations.of(context)!.additional_number,
                            controller: pOBoxAdditionalNum,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: TextBox(
                            label: AppLocalizations.of(context)!.postal_code,
                            controller: pOBox,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    SplitScreenWidget(
                      child1: TextBox(
                        label: AppLocalizations.of(context)!.street_Eng,
                        controller: streetEng,
                        textDirection: TextDirection.ltr,
                      ),
                      child2: TextBox(
                        label: AppLocalizations.of(context)!.street_Arb,
                        controller: streetArb,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SplitScreenWidget(
                      child1: TextBox(
                        label: AppLocalizations.of(context)!.district_Eng,
                        controller: districtEng,
                        textDirection: TextDirection.ltr,
                      ),
                      child2: TextBox(
                        label: AppLocalizations.of(context)!.district_Arb,
                        controller: districtArb,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SplitScreenWidget(
                      child1: TextBox(
                        label: AppLocalizations.of(context)!.country_Eng,
                        controller: countryEng,
                        textDirection: TextDirection.ltr,
                      ),
                      child2: TextBox(
                        label: AppLocalizations.of(context)!.country_Arb,
                        controller: countryArb,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SplitScreenWidget(
                      child1: TextBox(
                        label: AppLocalizations.of(context)!.second_business_id,
                        controller: secondBusinessID,
                      ),
                      child2: CustomDropdownWithController(
                        controller: secondBusinessIDType,
                        title: AppLocalizations.of(context)!
                            .second_business_id_type,
                        onChanged: (value) {},
                        items: secondBusinessIDTypes,
                      ),
                      // child2: DropDown(
                      //   label: AppLocalizations.of(context)!
                      //       .second_business_id_type,
                      //   items: secondBusinessIDTypes,
                      //   onChanged: (value) {
                      //     secondBusinessIDType.text = value;
                      //   },
                      //   initialValue: secondBusinessIDType.text,
                      // ),
                    ),
                  ],
                )
              ],
            ),
            bottomNavigationBar: BottomTabBar(
              items: [
                AppLocalizations.of(context)!.general,
                AppLocalizations.of(context)!.others,
                AppLocalizations.of(context)!.gazt
              ],
              tabController: tabController,
            ),
          );
        },
      ),
    );
  }
}





// async ReCalcTransactionBalances(clientVendorNo:number,year:string){
//     let sqlcmd: string = EXEC dbo.stp_ClientVendor_ReCalc_RunningBalance @clientVendorNo = ${clientVendorNo},@Year='${year}',@retInt=1;
//     if (this.queryService.databaseStatus) {
     
// console.log(sqlcmd);
//       return this._databaseService.executeQuery<any>(
//         async (db: SQLiteDBConnection) => {

         
//           let ret: any =  db.run(sqlcmd).then(() => {

       

//           })
//           .catch((error) => {
//             console.log(error)
//             // console.log(Error at ${this.constructor.name} :- ${error});
//           });
       
      
//             console.log(ret);
            
       
//             return ret.changes as number;
          
//         }
//       );

//     } else {
   
//       return this.sqlQuery.sendQuery(sqlcmd)
//         .then((ress: any) => {
//           console.log('IN postInvoice SQL SERVER', ress)
         
//           return ress;
//         });
//     }
//   }

//   async ReCalcTransactionBalancesForClient(clientVendorNo:number,manPosted:number){
//     let sqlcmd: string = EXEC dbo.stp_ClientVendor_CalculateBalances_PerOne @clientVendorNo = ${clientVendorNo},@manPosted_LastBalance=${manPosted},@retBool=true;
//     if (this.queryService.databaseStatus) {
     
// console.log(sqlcmd);
//       return this._databaseService.executeQuery<any>(
//         async (db: SQLiteDBConnection) => {

         
//           let ret: any =  db.run(sqlcmd).then(() => {

       

//           })
//           .catch((error) => {
//             console.log(error)
//             // console.log(Error at ${this.constructor.name} :- ${error});
//           });
       
      
//             console.log(ret);
            
       
//             return ret.changes as number;
          
//         }
//       );

//     } else {
   
//       return this.sqlQuery.sendQuery(sqlcmd)
//         .then((ress: any) => {
//           console.log('IN postInvoice SQL SERVER', ress)
         
//           return ress;
//         });
//     }
//   }

//   async AccountStatement(clientVendorNo:number,fromDate:string,toDate:string,isFromLastOpenBalance:any){
//     let sqlcmd: string = EXEC dbo.stp_ClientVendor_RunningBalance @clientVendorNo = ${clientVendorNo},@fromDate='${fromDate}',@toDate='${toDate}',@isFromLastOpenBalance=${isFromLastOpenBalance};
//     if (this.queryService.databaseStatus) {
     
// console.log(sqlcmd);
//       return this._databaseService.executeQuery<any>(
//         async (db: SQLiteDBConnection) => {

         
//           let ret: any =  db.run(sqlcmd).then(() => {

       

//           })
//           .catch((error) => {
//             console.log(error)
//             // console.log(Error at ${this.constructor.name} :- ${error});
//           });
       
      
//             console.log(ret);
            
       
//             return ret.changes as number;
          
//         }
//       );

//     } else {
   
//       return this.sqlQuery.sendQuery(sqlcmd)
//         .then((ress: any) => {
//           console.log('IN postInvoice SQL SERVER', ress)
         
//           return ress;
//         });
//     }
//   }
// }