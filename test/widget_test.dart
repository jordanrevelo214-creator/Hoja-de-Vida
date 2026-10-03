import 'package:flutter_test/flutter_test.dart';
import 'package:hoja_de_vida/main.dart';

void main() {
  testWidgets('Carga la pantalla de hoja de vida', (WidgetTester tester) async {
    await tester.pumpWidget(const MiHojaDeVidaApp());

    expect(find.text('Mi Hoja de Vida'), findsOneWidget);
    expect(find.text('Jordan Desarrollador'), findsOneWidget);
  });
}
