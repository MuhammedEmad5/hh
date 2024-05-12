//
// class ReadAllBankAccountUseCase {
//   final BeginningBalanceRepo beginningBalanceRepo;
//
//   ReadAllBankAccountUseCase(this.beginningBalanceRepo);
//
//   Future<List<BeginningBalanceEntity>> execute() async {
//
//     final List<dynamic> clientVendorBeginningBalanceJsonArr =
//     await beginningBalanceRepo.getAll<ClientVendorBeginningBalance>();
//     final clientVendorBeginningBalanceObjects =
//     clientVendorBeginningBalanceJsonArr.map((clientVendorBeginningBalance) => ClientVendorBeginningBalance.fromJson(clientVendorBeginningBalance)).toList();
//     List<BeginningBalanceEntity> beginningBalanceList = [];
//     for (ClientVendorBeginningBalance clientVendorBeginningBalance in clientVendorBeginningBalanceObjects) {
//       beginningBalanceList.add(ClientVendorBeginningBalanceMapper().convert(clientVendorBeginningBalance));
//     }
//
//     return beginningBalanceList;
//   }
// }
