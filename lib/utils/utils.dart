class Utils {
  static String? getPrettyDate(DateTime d) {
    final difference = DateTime.now().difference(d);
    int dayDiff = difference.inDays;
    int secDiff = difference.inSeconds;

    if (dayDiff < 0 || dayDiff >= 31) {
      return null;
    }

    if (dayDiff == 0) {
      if (secDiff < 60) {
        return "Just now";
      }

      if (secDiff < 120) {
        return "1 minute ago";
      }

      if (secDiff < 3600) {
        return "${(secDiff / 60).floor()} minutes ago";
      }

      if (secDiff < 7200) {
        return "1 hour ago";
      }

      if (secDiff < 86400) {
        return "${(secDiff / 3600).floor()} hours ago";
      }
    }

    if (dayDiff == 1) {
      return "Yesterday";
    }
    if (dayDiff < 7) {
      return "$dayDiff days ago";
    }
    if (dayDiff < 31) {
      return "Over ${(dayDiff / 7).floor()} weeks ago";
    }
    return null;
  }
}