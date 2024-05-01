import 'package:InvoiceF_Sales/core/presentation/widgets/card.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/label.dart';
import 'package:InvoiceF_Sales/core/presentation/widgets/nubmer_box.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:flutter/material.dart';

class SellItemCard extends StatefulWidget {
  final InvoiceSellUnitEntity data;
  final Function onDelete;
  final Function(String)? onQuantityChanged;
  const SellItemCard({
    super.key,
    required this.data,
    required this.onDelete,
    this.onQuantityChanged,
  });

  @override
  State<SellItemCard> createState() => _SellItemCardState();
}

class _SellItemCardState extends State<SellItemCard> {
  TextEditingController quantity = TextEditingController();
  TextEditingController total = TextEditingController();
  num totalPlusTax = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity.text = '${widget.data.quantity}';
    // total.text = '${int.parse(quantity.text) * widget.data.price}';
    total.text = '${widget.data.totalPlusTax}';
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Label(
                    text: '${widget.data.itemNo}',
                    textAlign: TextAlign.center,
                  )),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text(
                  widget.data.aName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.center,
                  child: NumberBox(
                    width: 70,
                    controller: quantity,
                    onChanged: (value) {
                      if (value == '') {
                        Future.delayed(Duration(seconds: 3), () {
                          if (quantity.text == '') {
                            quantity.text = '1';
                          }
                        });
                      } else {
                        widget.onQuantityChanged!(value);
                      }
                      setState(() {
                        total.text =
                            '${int.parse(quantity.text) * widget.data.price}';
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Label(
                  text: widget.data.price.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Label(
                  text: 'Total Plus Tax',
                  weight: FontWeight.w600,
                  textAlign: TextAlign.end,
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.center,
                  child: NumberBox(
                    width: 70,
                    controller: total,
                    isEnabled: false,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        widget.onDelete();
                      },
                    ),
                    const SizedBox(width: 10),
                    // IconButton(
                    //   icon: const Icon(
                    //     Icons.edit,
                    //     color: AppColors.primaryColor,
                    //   ),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
