import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:event_manager/event/event_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets('MyApp khởi chạy và hiển thị EventView',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('vi'),
      ],
      locale: Locale("vi"),
      home: EventView(),
    ));

    // Tải AppLocalizations cho locale 'vi'
    final al = await AppLocalizations.delegate.load(const Locale('vi'));

    // Kiểm tra xem tiêu đề ứng dụng được hiển thị
    expect(find.text(al.appTitle), findsOneWidget);

    // Kiểm tra xem EventView được hiển thị
    expect(find.byType(EventView), findsOneWidget);
  });
}
