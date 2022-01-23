import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletBar extends StatefulWidget {
  final double totalBalance;

  WalletBar({this.totalBalance});

  @override
  _WalletBartState createState() => _WalletBartState();
}

class _WalletBartState extends State<WalletBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      width: double.infinity,
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        elevation: 4,
        child: InkWell(
          onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Snack"),
          )),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white)),
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 24,
                child: SvgPicture.asset("assets/images/primary_wallet.svg"),
              ),
            ),
            title: Text(
              "Primary Wallet",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 14,
                  fontFamily: 'Sanomat'),
            ),
            subtitle: Row(
              children: [
                Text(
                  "\$",
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 14,
                      fontFamily: 'Sanomat'),
                ),
                Text(
                  "${widget.totalBalance}",
                  style: TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Sanomat'),
                ),
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xFFC4C4C4),
                  borderRadius: BorderRadius.circular(16)),
              child: SvgPicture.asset("assets/images/chevron.svg"),
            ),
          ),
        ),
      ),
    );
  }
}
