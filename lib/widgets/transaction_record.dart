import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/widgets/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransactionRecord extends StatelessWidget {
  const TransactionRecord({this.note, this.amount, this.date});

  final String note;
  final double amount;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListTile(
        title: Text("\$$amount",
            style: AppTextStyle.medium.copyWith(
              fontSize: 14,
              color: Color(0xFF1c1c1c),
            )),
        subtitle: Text(
          note,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.regular
              .copyWith(fontSize: 12, color: Color(0xFF707070)),
        ),
        leading: Container(
            child: SvgPicture.asset("assets/images/outgoing.svg"),
            width: 40,
            height: 40),
        trailing: Text(
          DateFormat.yMMMd().format(date),
          style: AppTextStyle.regular
              .copyWith(fontSize: 12, color: Color(0xFF707070)),
        ),
      ),
    );
  }
}
