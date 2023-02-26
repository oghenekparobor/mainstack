import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/constant/strings.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

GlobalKey<NavigatorState> navKey = GlobalKey();
final nav = Navigator.of(navKey.currentContext!);
final size = MediaQuery.of(navKey.currentContext!).size;
const uuid = Uuid();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HeaderNotifer()),
        ChangeNotifierProvider.value(value: ElementNotifer()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => MaterialApp(
          title: kAppName,
          theme: theme,
          home: child,
          navigatorKey: navKey,
          builder: (context, child) {
            final query = MediaQuery.of(context);
            final scale = query.textScaleFactor.clamp(0.99, 1.0);

            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
              child: child!,
            );
          },
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        ),
      ),
    );
  }
}
