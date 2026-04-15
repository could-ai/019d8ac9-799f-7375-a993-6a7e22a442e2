import 'package:couldai_user_app/models/user_profile.dart';

class MatchResult {
  final UserProfile profile;
  final int score;
  final String matchType; // 'Strong Match', 'Good Match', 'Reject'

  MatchResult(this.profile, this.score, this.matchType);
}

class MatchingEngine {
  static List<UserProfile> getSortedMatches(
      UserProfile currentUser, List<UserProfile> otherUsers) {
    List<MatchResult> matched = [];
    List<UserProfile> sameCityOthers = [];

    for (var user in otherUsers) {
      // Hard Filter: City (q2)
      // Compare normalized city values
      String currentCity = _getCity(currentUser);
      String otherCity = _getCity(user);

      if (currentCity.isEmpty || otherCity.isEmpty || currentCity != otherCity) {
        // Reject immediately, do not continue scoring
        continue;
      }

      int score = calculateScore(currentUser, user);

      if (score >= 52) {
        String matchType = score >= 60 ? 'Strong Match' : 'Good Match';
        matched.add(MatchResult(user, score, matchType));
      } else {
        sameCityOthers.add(user);
      }
    }

    // Sort matched by score descending
    matched.sort((a, b) => b.score.compareTo(a.score));

    // UI must display users in this strict order:
    // 1. First — matched users (based on this algorithm)
    // 2. Then — all other users from the same city (even if they did not pass matching threshold)
    List<UserProfile> finalSortedList = [];
    finalSortedList.addAll(matched.map((m) => m.profile));
    finalSortedList.addAll(sameCityOthers);

    return finalSortedList;
  }

  static String _getCity(UserProfile user) {
    if (user.answers != null && user.answers!['q2'] != null) {
      // q2 is countryCity type, usually stored as "Country, City" or similar.
      // We'll just normalize the whole string for comparison.
      return user.answers!['q2'].toString().trim().toLowerCase();
    }
    return user.city.trim().toLowerCase();
  }

  static int calculateScore(UserProfile currentUser, UserProfile otherUser) {
    int totalScore = 0;
    final currentAnswers = currentUser.answers ?? {};
    final otherAnswers = otherUser.answers ?? {};

    // 1) HOBBIES (q12) — 25 points
    List<String> currentHobbies = _getStringList(currentAnswers['q12']);
    List<String> otherHobbies = _getStringList(otherAnswers['q12']);
    int sharedHobbies = currentHobbies.where((h) => otherHobbies.contains(h)).length;
    if (sharedHobbies >= 5) totalScore += 25;
    else if (sharedHobbies == 4) totalScore += 20;
    else if (sharedHobbies == 3) totalScore += 15;
    else if (sharedHobbies == 2) totalScore += 10;
    else if (sharedHobbies == 1) totalScore += 5;

    // 2) AGE (q3) — 20 points
    int? currentAge = _parseAge(currentAnswers['q3']);
    int? otherAge = _parseAge(otherAnswers['q3']);
    if (currentAge != null && otherAge != null) {
      int diff = (currentAge - otherAge).abs();
      if (diff <= 2) totalScore += 20;
      else if (diff >= 3 && diff <= 5) totalScore += 16;
      else if (diff >= 6 && diff <= 8) totalScore += 10;
      else if (diff >= 9 && diff <= 12) totalScore += 5;
    }

    // 3) CONFLICT BEHAVIOR (q9) — 15 points
    String currentConflict = _getString(currentAnswers['q9']);
    String otherConflict = _getString(otherAnswers['q9']);
    if (currentConflict.isNotEmpty && otherConflict.isNotEmpty) {
      if (currentConflict == otherConflict) {
        totalScore += 15;
      } else {
        List<String> pair = [currentConflict, otherConflict]..sort();
        String pairStr = pair.join(' | ');
        bool hasAvoid = pairStr.contains('Try to avoid conflicts') || pairStr.contains('Стараюсь избегать');
        bool hasKind = pairStr.contains('Kind but can stand my ground') || pairStr.contains('Сглаживаю углы');
        bool hasDirect = pairStr.contains('Direct, sometimes blunt') || pairStr.contains('Я прямая');

        if (hasAvoid && hasKind) totalScore += 10;
        else if (hasKind && hasDirect) totalScore += 10;
        else if (hasAvoid && hasDirect) totalScore += 4;
      }
    }

    // 4) UNCERTAINTY TOLERANCE (q10) — 15 points
    int? currentUncertainty = _parseInt(currentAnswers['q10']);
    int? otherUncertainty = _parseInt(otherAnswers['q10']);
    if (currentUncertainty != null && otherUncertainty != null) {
      int diff = (currentUncertainty - otherUncertainty).abs();
      if (diff == 0) totalScore += 15;
      else if (diff == 1) totalScore += 11;
      else if (diff == 2) totalScore += 7;
      else if (diff == 3) totalScore += 3;
      else if (diff == 4) totalScore += 0;
    }

    // 5) EMOTIONAL SUPPORT IMPORTANCE (q5) — 10 points
    int? currentSupport = _parseInt(currentAnswers['q5']);
    int? otherSupport = _parseInt(otherAnswers['q5']);
    if (currentSupport != null && otherSupport != null) {
      int diff = (currentSupport - otherSupport).abs();
      if (diff == 0) totalScore += 10;
      else if (diff == 1) totalScore += 8;
      else if (diff == 2) totalScore += 5;
      else if (diff == 3) totalScore += 2;
      else if (diff == 4) totalScore += 0;
    }

    // 6) EMOTIONAL OPENNESS (q7) — 5 points
    int? currentOpenness = _parseInt(currentAnswers['q7']);
    int? otherOpenness = _parseInt(otherAnswers['q7']);
    if (currentOpenness != null && otherOpenness != null) {
      int diff = (currentOpenness - otherOpenness).abs();
      if (diff == 0) totalScore += 5;
      else if (diff == 1) totalScore += 4;
      else if (diff == 2) totalScore += 2;
    }

    // 7) PERSONALITY TYPE (q6) — 5 points
    String currentPersonality = _getString(currentAnswers['q6']).toLowerCase();
    String otherPersonality = _getString(otherAnswers['q6']).toLowerCase();
    if (currentPersonality.isNotEmpty && otherPersonality.isNotEmpty) {
      if (currentPersonality == otherPersonality) {
        totalScore += 5;
      } else {
        bool hasAmbivert = currentPersonality.contains('ambivert') || otherPersonality.contains('ambivert') || currentPersonality.contains('амбиверт') || otherPersonality.contains('амбиверт');
        bool hasExtrovert = currentPersonality.contains('extrovert') || otherPersonality.contains('extrovert') || currentPersonality.contains('экстраверт') || otherPersonality.contains('экстраверт');
        bool hasIntrovert = currentPersonality.contains('introvert') || otherPersonality.contains('introvert') || currentPersonality.contains('интроверт') || otherPersonality.contains('интроверт');

        if (hasAmbivert) {
          totalScore += 3;
        } else if (hasExtrovert && hasIntrovert) {
          totalScore += 1;
        }
      }
    }

    // 8) COMMUNICATION STYLE (q4) — 3 points
    String currentStyle = _getString(currentAnswers['q4']);
    String otherStyle = _getString(otherAnswers['q4']);
    if (currentStyle.isNotEmpty && otherStyle.isNotEmpty) {
      if (currentStyle == otherStyle) {
        totalScore += 3;
      } else {
        List<String> pair = [currentStyle, otherStyle]..sort();
        String pairStr = pair.join(' | ');
        bool hasDeep = pairStr.contains('Deep one-on-one') || pairStr.contains('Глубокие разговоры');
        bool hasFun = pairStr.contains('Fun group hangouts') || pairStr.contains('Весёлые посиделки');
        bool hasMix = pairStr.contains('Mix of both') || pairStr.contains('Готова к любому');
        bool hasTexting = pairStr.contains('Mostly texting') || pairStr.contains('Больше переписка');

        if (hasDeep && hasMix) totalScore += 2;
        else if (hasFun && hasMix) totalScore += 2;
        else if (hasTexting && hasMix) totalScore += 2;
        else if (hasDeep && hasFun) totalScore += 0;
        else if (hasDeep && hasTexting) totalScore += 0;
        else if (hasFun && hasTexting) totalScore += 0;
      }
    }

    // 9) COMMUNICATION FORMATS (q11) — 2 points
    List<String> currentFormats = _getStringList(currentAnswers['q11']);
    List<String> otherFormats = _getStringList(otherAnswers['q11']);
    int sharedFormats = currentFormats.where((f) => otherFormats.contains(f)).length;
    if (sharedFormats >= 2) totalScore += 2;
    else if (sharedFormats == 1) totalScore += 1;

    return totalScore > 100 ? 100 : totalScore;
  }

  static int? _parseAge(dynamic value) {
    if (value == null) return null;
    int? age = int.tryParse(value.toString());
    if (age == null || age <= 0 || age >= 120) return null;
    return age;
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    String str = value.toString();
    Match? match = RegExp(r'^\d+').firstMatch(str);
    if (match != null) {
      return int.tryParse(match.group(0)!);
    }
    return int.tryParse(str);
  }

  static String _getString(dynamic value) {
    if (value == null) return '';
    return value.toString();
  }

  static List<String> _getStringList(dynamic value) {
    if (value == null) return [];
    if (value is List) return value.map((e) => e.toString()).toList();
    return [value.toString()];
  }
}
