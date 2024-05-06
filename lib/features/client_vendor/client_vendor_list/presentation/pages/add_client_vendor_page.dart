import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../../../../../core/enums/connection_enum.dart';
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
import '../../domain/use_cases/client_vendor_use_cases/create_client_vendor_use_case.dart';
import '../../domain/use_cases/client_vendor_use_cases/update_client_vendor_use_case.dart';
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
  late IConnection connection;
  //General Controllers
  TextEditingController clientVendorNo = TextEditingController();
  TextEditingController typeOfClientOrVendor = TextEditingController();
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
  TextEditingController secondBusinessIDType = TextEditingController();

  List<String> clientVendorTypes = ['Client / Vendor', 'Client', 'Vendor'];
  List<String> secondBusinessIDTypes = [
    'National Identity',
    'Residency Number',
    'Passport',
    'No. 700',
    'TIN Special Tax No.',
    'Commercial Resister CR',
    'Ministry of Municipal and Rural Affairs license',
    'License of the Ministry of Human Resources and Social Development',
    'General Investment Authority license',
    'The Gulf identity of the customer'
  ];

  late TabController tabController;
  late ClientVendorEntity data;
  @override
  void initState() {
    super.initState();
    connection = context.read<ConnectionTypeBloc>().state.connection ==
            ConnectionEnum.local
        ? LocalConnection()
        : RemoteConnection();
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
      typeOfClientOrVendor.text =
          clientVendorTypes[(data.typeOfClientOrVendor ?? 1) - 1];
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
      secondBusinessIDType.text =
          secondBusinessIDTypes[(data.secondBusinessIDType ?? 1) - 1];
    } else {
      typeOfClientOrVendor.text = 'Client / Vendor';
      secondBusinessIDType.text = 'National Identity';
      warnMaxBalance.text = '0';
      warnMinBalance.text = '0';
      maxBalanceAllowed.text = '0';
      minBalanceAllowed.text = '0';
    }
  }

  @override
  void dispose() {
    clientVendorNo.dispose();
    typeOfClientOrVendor.dispose();
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
    return Scaffold(
      appBar: CustomAppBar(
        title:
            '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.client_vendor}',
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        onSavePressed: () {
          ClientVendorEntity clientVendor = ClientVendorEntity(
            clientVendorNo: widget.newIndex == 0 ? 1 : widget.newIndex,
            typeOfClientOrVendor:
                clientVendorTypes.indexOf(typeOfClientOrVendor.text) + 1,
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
            secondBusinessIDType:
                secondBusinessIDTypes.indexOf(secondBusinessIDType.text) + 1,
          );
          print(connection);
          widget.isEdit
              ? UpdateClientVendorUseCase(
                      clientVendorRepo: ClientVendorRepo(connection))
                  .execute(clientVendor, id: clientVendor.clientVendorNo)
              : CreateClientVendorUseCase(
                      clientVendorRepo: ClientVendorRepo(connection))
                  .execute(clientVendor);
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
                child2: DropDown(
                  label: AppLocalizations.of(context)!.type,
                  items: clientVendorTypes,
                  onChanged: (value) {
                    typeOfClientOrVendor.text = value;
                  },
                  initialValue: typeOfClientOrVendor.text,
                ),
              ),
              TextBox(
                label: AppLocalizations.of(context)!.arabic_name,
                controller: aName,
              ),
              TextBox(
                label: AppLocalizations.of(context)!.arabic_description,
                maxLines: 4,
                controller: aDescription,
              ),
              TextBox(
                label: AppLocalizations.of(context)!.english_name,
                controller: eName,
              ),
              TextBox(
                label: AppLocalizations.of(context)!.english_description,
                maxLines: 4,
                controller: eDescription,
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
                label: AppLocalizations.of(context)!.warn_balance_reach_max,
                isNumberBox: true,
                controller: warnMaxBalance,
              ),
              TextBox(
                label: AppLocalizations.of(context)!.warn_balance_reach_min,
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
                    text: 'Re Calc Transaction Balances', onPressed: () {}),
                CustomButton(
                    text: 'Re Calc All Transaction Balances (This Client)',
                    onPressed: () {}),
                CustomButton(text: 'Re Calc Balances', onPressed: () {}),
                CustomButton(text: 'Account Statement', onPressed: () {}),
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
                      label: AppLocalizations.of(context)!.building_number,
                      controller: apartmentNum,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: TextBox(
                      label: AppLocalizations.of(context)!.additional_number,
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
                ),
                child2: TextBox(
                  label: AppLocalizations.of(context)!.street_Arb,
                  controller: streetArb,
                ),
              ),
              SplitScreenWidget(
                child1: TextBox(
                  label: AppLocalizations.of(context)!.district_Eng,
                  controller: districtEng,
                ),
                child2: TextBox(
                  label: AppLocalizations.of(context)!.district_Arb,
                  controller: districtArb,
                ),
              ),
              SplitScreenWidget(
                child1: TextBox(
                  label: AppLocalizations.of(context)!.country_Eng,
                  controller: countryEng,
                ),
                child2: TextBox(
                  label: AppLocalizations.of(context)!.country_Arb,
                  controller: countryArb,
                ),
              ),
              SplitScreenWidget(
                child1: TextBox(
                  label: AppLocalizations.of(context)!.second_business_id,
                  controller: secondBusinessID,
                ),
                child2: DropDown(
                  label: AppLocalizations.of(context)!.second_business_id_type,
                  items: secondBusinessIDTypes,
                  onChanged: (value) {
                    secondBusinessIDType.text = value;
                  },
                  initialValue: secondBusinessIDType.text,
                ),
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