import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../src/src.dart';
import '../../../../utils/utils.dart' as utils;
import 'controller.dart';

class HomeTab extends utils.Page<HomeTabController> {
  HomeTab({Key? key}) : super(controller: HomeTabController(), key: key);

  @override
  HomeTabController get controller => super.controller!;

  @override
  Widget buildBody(BuildContext context) => Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: UIThemeColors.text1,
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          const Gap(20),
          Text(
            'First name: ${controller.mainService.currentUser?.firstName}',
            style: TextStyle(color: UIThemeColors.text2),
          ),
          Text(
            'Last name: ${controller.mainService.currentUser?.lastName}',
            style: TextStyle(color: UIThemeColors.text2),
          ),
          Text(
            'Full name: ${controller.mainService.currentUser?.fullName}',
            style: TextStyle(color: UIThemeColors.text2),
          ),
          Text(
            'Email: ${controller.mainService.currentUser?.email}',
            style: TextStyle(color: UIThemeColors.text2),
          ),
          Text(
            'Password: ${controller.mainService.currentUser?.password}',
            style: TextStyle(color: UIThemeColors.text2),
          ),
        ],
      );
}
