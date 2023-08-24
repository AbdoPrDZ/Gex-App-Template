import 'page.dart';

class PageInfo {
  final String route;
  final Page Function() page;
  final bool isUnAuth;

  PageInfo(this.route, this.page, {this.isUnAuth = false});
}
