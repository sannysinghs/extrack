import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDarkBlue,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          ListTile(
            trailing: SvgPicture.asset("assets/images/bell.svg"),
            title: Text(
              "Hi, Sanny",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Sanomat'),
            ),
            subtitle: Text(
              "How are you today !",
              style: TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: 'Sanomat'),
            ),
          )
        ],
      ),
    );
  }
}
