import 'package:flutter/material.dart';
import 'package:flutter_dashboard_responsive/feature/config/responsive.dart';
import 'package:flutter_dashboard_responsive/feature/config/size_config.dart';
import 'package:flutter_dashboard_responsive/feature/models/models.dart';
import 'package:flutter_dashboard_responsive/feature/utils/color.dart';
import 'package:flutter_dashboard_responsive/feature/widget/header_parts.dart';
import 'package:flutter_dashboard_responsive/feature/widget/transfer_info_cart.dart';

import '../widget/side_drawer_menu.dart';

class MyDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      key: drawerKey,
      drawer: SizedBox(
        width: 100,
        child: SideDrawerMenu(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  drawerKey.currentState?.openDrawer(); // Opens the drawer
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            Expanded(flex: 1, child: SideDrawerMenu()),
          Expanded(
            flex: 10,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal:
                Responsive.isMobile(context) ? 20 : 40, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      HeaderParts(),
                    SizedBox(height: SizeConfig.blockSizeVertical*4,),

                    SizedBox(width: SizeConfig.screenWidth,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.spaceBetween,
                      children: infoCardData.map((info){
                        return TransferInfoCard(infoCardModel: info);
                      }).toList()
                    ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (Responsive.isDesktop(context))
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.amber,
            ),
          ),
        ],
      )),
    );
  }
}
