import 'package:flutter_test/flutter_test.dart';
import 'package:todo/utils/utils.dart';

void main() {
  group('Convert Time To String', () {
    test('Long time', () {
      expect(
        convertTimeToString(DateTime.fromMillisecondsSinceEpoch(1649731272000)),
        '12 Apr 2022 09:41 AM',
      );

      expect(
        convertTimeToString(DateTime.fromMillisecondsSinceEpoch(1676434976000)),
        '15 Feb 2023 11:22 AM',
      );
    });

    test('Short time', () {
      expect(
        convertShortTimeToString(DateTime.fromMillisecondsSinceEpoch(1649731272000)),
        '12 Apr 2022',
      );

      expect(
        convertShortTimeToString(DateTime.fromMillisecondsSinceEpoch(1676434976000)),
        '15 Feb 2023',
      );
    });
  });
  
  group('Compare date', () { 
    final date_1 = DateTime.fromMillisecondsSinceEpoch(1676434976000);
    final date_2 = DateTime.now();
    
    test('isTrue', () {
      expect(compareDate(date_2, date_1), isTrue);
    });

    test('isFalse', () {
      expect(compareDate(date_1, date_2), isFalse);
    });
  });
}
