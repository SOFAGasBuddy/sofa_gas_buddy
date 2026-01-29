import 'package:flutter_test/flutter_test.dart';
import 'package:sofa_gas_buddy/utils/utils.dart';

void main() {
  group('getPrettyDate', () {
    test('returns "Just now" for recent timestamps', () {
      final now = DateTime.now();
      expect(Utils.getPrettyDate(now), 'Just now');
    });

    test('returns "1 minute ago" for a timestamp 1 minute ago', () {
      final oneMinuteAgo = DateTime.now().subtract(const Duration(minutes: 1));
      expect(Utils.getPrettyDate(oneMinuteAgo), '1 minute ago');
    });

    test('returns "x minutes ago" for a timestamp x minutes ago', () {
      final fiveMinutesAgo =
          DateTime.now().subtract(const Duration(minutes: 5));
      expect(Utils.getPrettyDate(fiveMinutesAgo), '5 minutes ago');
    });

    test('returns "1 hour ago" for a timestamp 1 hour ago', () {
      final oneHourAgo = DateTime.now().subtract(const Duration(hours: 1));
      expect(Utils.getPrettyDate(oneHourAgo), '1 hour ago');
    });

    test('returns "x hours ago" for a timestamp x hours ago', () {
      final threeHoursAgo = DateTime.now().subtract(const Duration(hours: 3));
      expect(Utils.getPrettyDate(threeHoursAgo), '3 hours ago');
    });

    test('returns "Yesterday" for a timestamp from yesterday', () {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      expect(Utils.getPrettyDate(yesterday), 'Yesterday');
    });

    test('returns "x days ago" for a timestamp from x days ago', () {
      final threeDaysAgo = DateTime.now().subtract(const Duration(days: 3));
      expect(Utils.getPrettyDate(threeDaysAgo), '3 days ago');
    });

    test('returns "Over x weeks ago" for a timestamp from x weeks ago', () {
      final twoWeeksAgo = DateTime.now().subtract(const Duration(days: 14));
      expect(Utils.getPrettyDate(twoWeeksAgo), 'Over 2 weeks ago');
    });

    test('returns null for a timestamp from over 31 days ago', () {
      final thirtyTwoDaysAgo =
          DateTime.now().subtract(const Duration(days: 32));
      expect(Utils.getPrettyDate(thirtyTwoDaysAgo), isNull);
    });
  });
}
