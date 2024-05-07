import 'package:InvoiceF/core/data/datasources/connection.dart';
import 'package:InvoiceF/core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import 'package:get_it/get_it.dart';

class TaxDeclarationQueries {
  static String getBranches() {
    return 'SELECT aName, eName, buildingNo FROM building';
  }

  static String getData() {
    return 'SELECT * FROM [StoreDB_505_NadaB2].[dbo].[qryGAZT_Final_B]';
  }

  static String getDataFiltered(
      String dateTo, String dateFrom, String buildingNo) {
    String query;
    String querySQLite;
    if (buildingNo == '-1') {
      query = """
     
declare @dateFROM datetime;declare @dateTo datetime; declare @buildingNo int;
select @dateFROM = '$dateFrom 00:00:00', @dateTo = '$dateTo 23:59:59', @buildingNo=-1;

With Tmp_No_VAT_Group As (select VATGroupNo, eName from dbo.Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)),
     Tmp_VAT_Group As (select VATGroupNo, eName	from dbo.Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)), 
	 Tmp_GAZT_Data As (
 		
	 Select VATTypeNo, sum(PurchaseAmount) as PurchaseAmount, sum(PurchaseAmount_Tax_Total) as PurchaseAmount_Tax_Total
			, sum(SalesAmount) as SalesAmount, sum(SalesAmount_Tax_Total) as SalesAmount_Tax_Total, sum(countBills) as countBills
		From
		(
			SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
							 , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total = 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 1
				
			group by VATTypeNo

			Union All
			--Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
			SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
							 , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total = 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 2
				
			group by VATTypeNo

			Union All
			-- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
			SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
							 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total = 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 3
				
			group by VATTypeNo

			Union All
			-- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
			SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
							 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total = 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 4
				
			group by VATTypeNo

			-------------------
			--The VAT Group
			-------------------
			Union All
			SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
							 , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total <> 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 1
				
			group by VATTypeNo

			Union All
			--Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
			SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
							 , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total <> 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 2
				
			group by VATTypeNo

			Union All
			-- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
			SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
							 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total <> 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 3
				
			group by VATTypeNo

			Union All
			-- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
			SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
							 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
			FROM  dbo.BillTypeTransaction billTbl
					inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
			where taxRate1_Total <> 0.0000 -- isPosted = 1 
				and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
				and mainTypeNo = 4
				
			group by VATTypeNo
		) taxData
		group by VATTypeNo
)

		SELECT VGrp.VATTypeNo, VGrp.VATBillType, VGrp.aName, VGrp.eName
				, isNull(gazt.PurchaseAmount, 0.0000) as PurchaseAmount, isNull(gazt.PurchaseAmount_Tax_Total, 0.0000) as PurchaseAmount_Tax_Total
				, isNull(gazt.SalesAmount, 0.0000) as SalesAmount, isNull(gazt.SalesAmount_Tax_Total, 0.0000) as SalesAmount_Tax_Total
				, isNull(gazt.countBills, 0) as countBills
		FROM  dbo.Met_VATType VGrp left join Tmp_GAZT_Data gazt on (VGrp.VATTypeNo = gazt.VATTypeNo)
		order by VGrp.VATTypeNo, VGrp.VATBillType
	
          """;
//////////////////////
      querySQLite =
          """SELECT VGrp.VATTypeNo, VGrp.VATBillType, VGrp.aName, VGrp.eName
          , ifNull(gazt.PurchaseAmount, 0.0000) as PurchaseAmount, ifNull(gazt.PurchaseAmount_Tax_Total, 0.0000) as PurchaseAmount_Tax_Total
          , ifNull(gazt.SalesAmount, 0.0000) as SalesAmount, ifNull(gazt.SalesAmount_Tax_Total, 0.0000) as SalesAmount_Tax_Total
          , ifNull(gazt.countBills, 0) as countBills
      FROM  Met_VATType VGrp left join (
     Select VATTypeNo, sum(PurchaseAmount) as PurchaseAmount, sum(PurchaseAmount_Tax_Total) as PurchaseAmount_Tax_Total
        , sum(SalesAmount) as SalesAmount, sum(SalesAmount_Tax_Total) as SalesAmount_Tax_Total, sum(countBills) as countBills
      From
      (
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
          and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
          and mainTypeNo = 1
          
        group by VATTypeNo
  
        Union All
        --Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 2
          
        group by VATTypeNo
  
        Union All
        -- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
        SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 3
          
        group by VATTypeNo
  
        Union All
        -- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
        SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 4
          
        group by VATTypeNo
  
        -------------------
        --The VAT Group
        -------------------
        Union All
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 1
          
        group by VATTypeNo
  
        Union All
        --Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 2
          
        group by VATTypeNo
  
        Union All
        -- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
        SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 3
          
        group by VATTypeNo
  
        Union All
        -- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
        SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 4
          
        group by VATTypeNo
      ) taxData
      group by VATTypeNo
  ) gazt on (VGrp.VATTypeNo = gazt.VATTypeNo)
      order by VGrp.VATTypeNo, VGrp.VATBillType""";
    } else {
      ////////////////////////////
      query = """
      declare @dateFROM datetime;declare @dateTo datetime; declare @buildingNo int;
      select @dateFROM = '$dateFrom 00:00:00', @dateTo = '$dateTo 23:59:59', @buildingNo='$buildingNo';
      
      With Tmp_No_VAT_Group As (select VATGroupNo, eName from dbo.Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)),
           Tmp_VAT_Group As (select VATGroupNo, eName	from dbo.Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)), 
         Tmp_GAZT_Data As (
           
         Select VATTypeNo, sum(PurchaseAmount) as PurchaseAmount, sum(PurchaseAmount_Tax_Total) as PurchaseAmount_Tax_Total
            , sum(SalesAmount) as SalesAmount, sum(SalesAmount_Tax_Total) as SalesAmount_Tax_Total, sum(countBills) as countBills
          From
          (
            SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                     , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total = 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 1
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            Union All
            --Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
            SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                     , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total = 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 2
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            Union All
            -- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
            SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
                     , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total = 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 3
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            Union All
            -- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
            SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
                     , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_No_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total = 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 4
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            -------------------
            --The VAT Group
            -------------------
            Union All
            SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                     , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total <> 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 1
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            Union All
            --Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
            SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                     , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total <> 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 2
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            Union All
            -- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
            SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
                     , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total <> 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 3
              and buildingNo ='$buildingNo'
            group by VATTypeNo
      
            Union All
            -- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
            SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
                     , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
            FROM  dbo.BillTypeTransaction billTbl
                inner join Tmp_VAT_Group VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
            where taxRate1_Total <> 0.0000 -- isPosted = 1 
              and dateG_PerDay >= @dateFrom and dateG_PerDay <= @dateTo
              and mainTypeNo = 4
              and buildingNo ='$buildingNo'
            group by VATTypeNo
          ) taxData
          group by VATTypeNo
      )
      
          SELECT VGrp.VATTypeNo, VGrp.VATBillType, VGrp.aName, VGrp.eName
              , isNull(gazt.PurchaseAmount, 0.0000) as PurchaseAmount, isNull(gazt.PurchaseAmount_Tax_Total, 0.0000) as PurchaseAmount_Tax_Total
              , isNull(gazt.SalesAmount, 0.0000) as SalesAmount, isNull(gazt.SalesAmount_Tax_Total, 0.0000) as SalesAmount_Tax_Total
              , isNull(gazt.countBills, 0) as countBills
          FROM  dbo.Met_VATType VGrp left join Tmp_GAZT_Data gazt on (VGrp.VATTypeNo = gazt.VATTypeNo)
          order by VGrp.VATTypeNo, VGrp.VATBillType
          
      
      
          """;
///////////////////////
      querySQLite =
          """SELECT VGrp.VATTypeNo, VGrp.VATBillType, VGrp.aName, VGrp.eName
          , ifNull(gazt.PurchaseAmount, 0.0000) as PurchaseAmount, ifNull(gazt.PurchaseAmount_Tax_Total, 0.0000) as PurchaseAmount_Tax_Total
          , ifNull(gazt.SalesAmount, 0.0000) as SalesAmount, ifNull(gazt.SalesAmount_Tax_Total, 0.0000) as SalesAmount_Tax_Total
          , ifNull(gazt.countBills, 0) as countBills
      FROM  Met_VATType VGrp left join (
     Select VATTypeNo, sum(PurchaseAmount) as PurchaseAmount, sum(PurchaseAmount_Tax_Total) as PurchaseAmount_Tax_Total
        , sum(SalesAmount) as SalesAmount, sum(SalesAmount_Tax_Total) as SalesAmount_Tax_Total, sum(countBills) as countBills
      From
      (
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
          and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
          and mainTypeNo = 1
          and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        Union All
        --Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 2
        and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        Union All
        -- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
        SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 3
        and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        Union All
        -- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
        SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName from Met_VATGroup where VATGroupNo in (2, 3, 5, 9, 10)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total = 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 4
        and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        -------------------
        --The VAT Group
        -------------------
        Union All
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) as SalesAmount, sum(billTbl.taxRate1_Total) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 1
        and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        Union All
        --Sale Return qryGAZT_0_No_VAT_Invoices_SellReturn
        SELECT VATTypeNo, cast(0.0000 as decimal(18, 6)) as PurchaseAmount, cast(0.0000 as decimal(18, 6)) as PurchaseAmount_Tax_Total
                 , sum(billTbl.amount) * -1.000000 as SalesAmount, sum(billTbl.taxRate1_Total) * -1.000000 as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 2
        and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        Union All
        -- Purchase  [qryGAZT_0_No_VAT_Invoices_Buy]
        SELECT VATTypeNo, sum(billTbl.amount) as PurchaseAmount, sum(billTbl.taxRate1_Total) as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 3
        and buildingNo ='$buildingNo'

        group by VATTypeNo
  
        Union All
        -- Purchase Return [qryGAZT_0_No_VAT_Invoices_BuyReturn]
        SELECT VATTypeNo, sum(billTbl.amount) * -1.000000 as PurchaseAmount, sum(billTbl.taxRate1_Total) * -1.000000 as PurchaseAmount_Tax_Total
                 , cast(0.0000 as decimal(18, 6)) as SalesAmount, cast(0.0000 as decimal(18, 6)) as SalesAmount_Tax_Total, count(billTbl.transactionNo) as countBills
        FROM  BillTypeTransaction billTbl
            inner join (select VATGroupNo, eName	from Met_VATGroup where VATGroupNo in (1, 4, 6, 7, 8)) VATGrp on (billTbl.VATGroupNo = VATGrp.VATGroupNo)
        where taxRate1_Total <> 0.0000 -- isPosted = 1 
        and dateG_PerDay >= '$dateFrom 00:00:00' and dateG_PerDay <= '$dateTo 00:00:00'
        and mainTypeNo = 4
        and buildingNo ='$buildingNo'

        group by VATTypeNo
      ) taxData
      group by VATTypeNo
  ) gazt on (VGrp.VATTypeNo = gazt.VATTypeNo)
      order by VGrp.VATTypeNo, VGrp.VATBillType""";
    }
    var connection = GetIt.I<IConnection>();
    return connection is LocalConnection
        ? querySQLite.replaceAll('isNull', 'ifnull')
        : query;
  }
}
