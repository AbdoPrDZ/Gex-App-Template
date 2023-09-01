import '../pages/pages.dart';
import '../utils/utils.dart';

class PagesInfo {
  static Map<String, PageInfo> get pages => {
        '/loading': PageInfo("/loading", () => LoadingPage(), isUnAuth: true),
        '/start': PageInfo("/start", () => const StartPage(), isUnAuth: true),
        '/login': PageInfo("/login", () => LoginPage(), isUnAuth: true),
        '/register':
            PageInfo("/register", () => RegisterPage(), isUnAuth: true),
        '/home': PageInfo("/home", () => HomePage()),
      };

  static List<String> get unAuthPages => [
        for (PageInfo page in pages.values)
          if (page.isUnAuth) page.route,
      ];

  static PageInfo get loading => pages['/loading']!;
  static PageInfo get start => pages['/start']!;
  static PageInfo get login => pages['/login']!;
  static PageInfo get register => pages['/register']!;
  static PageInfo get home => pages['/home']!;

  static PageInfo initialPage = loading;
  static PageInfo onAuthPage = home;
  static PageInfo onUnAuthPage = start;
}