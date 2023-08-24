import 'package:gap/gap.dart';

import '../../src/src.dart';
import '../../utils/utils.dart' as utils;
import '../../utils/utils.dart';
import '../../views/views.dart';

class StartPage extends utils.Page {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) => Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Consts.logo,
            width: 200,
            height: 200,
          ),
          const Gap(30),
          Text(
            Consts.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: UIThemeColors.text1,
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          const Gap(30),
          ButtonView.text(
            width: SizeConfig(context).percentOfScreenWidth(0.8),
            onPressed: () => RouteManager.to(PagesInfo.login),
            text: 'Login',
          ),
          ButtonView.text(
            width: SizeConfig(context).percentOfScreenWidth(0.8),
            onPressed: () => RouteManager.to(PagesInfo.register),
            text: 'Register',
          ),
        ],
      );
}
