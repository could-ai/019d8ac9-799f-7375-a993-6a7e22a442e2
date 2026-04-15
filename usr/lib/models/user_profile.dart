class UserProfile {
  final String id;
  final String name;
  final int age;
  final String city;
  final List<String> photos;
  final List<String> matchHighlights;
  final String bio;
  final Map<String, dynamic>? answers;

  UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.city,
    required this.photos,
    required this.matchHighlights,
    required this.bio,
    this.answers,
  });
}

// Mock Data
final List<UserProfile> mockProfiles = [
  UserProfile(
    id: '1',
    name: 'Sarah',
    age: 28,
    city: 'New York',
    photos: ['https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=800&q=80'],
    matchHighlights: ['Both love hiking', 'Coffee enthusiasts'],
    bio: 'Looking for someone to explore new coffee shops with and go on weekend hikes.',
    answers: {
      'q2': 'USA, New York',
      'q3': '28',
      'q4': 'Deep one-on-one conversations',
      'q5': '4 — Very important',
      'q6': 'Ambivert — comfortable in both quiet and active settings',
      'q7': '4 — Quite open',
      'q9': 'Kind but can stand my ground',
      'q10': '2 — Bothers me slightly but passes quickly',
      'q11': ['Coffee', 'Walk'],
      'q12': ['Hiking', 'Coffee', 'Reading', 'Photography', 'Travel'],
    },
  ),
  UserProfile(
    id: '2',
    name: 'Elena',
    age: 26,
    city: 'New York',
    photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=800&q=80'],
    matchHighlights: ['Introverts', 'Love reading sci-fi'],
    bio: 'Bookworm and amateur baker. Let\'s swap recipes and book recommendations!',
    answers: {
      'q2': 'USA, New York',
      'q3': '26',
      'q4': 'Mostly texting/voice messages',
      'q5': '3 — Important',
      'q6': 'Introvert — I prefer calm and deep formats',
      'q7': '2 — Reserved, but can open up',
      'q9': 'Try to avoid conflicts',
      'q10': '4 — Often unsettles me, hard to ignore',
      'q11': ['Texting', 'Coffee'],
      'q12': ['Reading', 'Baking', 'Movies', 'Board Games', 'Writing'],
    },
  ),
  UserProfile(
    id: '3',
    name: 'Maya',
    age: 30,
    city: 'New York',
    photos: ['https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=800&q=80'],
    matchHighlights: ['Yoga practitioners', 'Vegetarian'],
    bio: 'Yoga teacher and plant mom. Always down for a matcha latte.',
    answers: {
      'q2': 'USA, New York',
      'q3': '30',
      'q4': 'Mix of both',
      'q5': '5 — Critically important',
      'q6': 'Extrovert — I love activity and new acquaintances',
      'q7': '5 — Easily share feelings',
      'q9': 'Direct, sometimes blunt when something is wrong',
      'q10': '1 — Doesn\'t affect me at all',
      'q11': ['Yoga', 'Coffee', 'Walk'],
      'q12': ['Yoga', 'Plants', 'Coffee', 'Travel', 'Music'],
    },
  ),
];
