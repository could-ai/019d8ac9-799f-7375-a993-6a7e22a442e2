class UserProfile {
  final String id;
  final String name;
  final int age;
  final String city;
  final List<String> photos;
  final List<String> matchHighlights;
  final String bio;

  UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.city,
    required this.photos,
    required this.matchHighlights,
    required this.bio,
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
  ),
  UserProfile(
    id: '2',
    name: 'Elena',
    age: 26,
    city: 'New York',
    photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=800&q=80'],
    matchHighlights: ['Introverts', 'Love reading sci-fi'],
    bio: 'Bookworm and amateur baker. Let\'s swap recipes and book recommendations!',
  ),
  UserProfile(
    id: '3',
    name: 'Maya',
    age: 30,
    city: 'New York',
    photos: ['https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=800&q=80'],
    matchHighlights: ['Yoga practitioners', 'Vegetarian'],
    bio: 'Yoga teacher and plant mom. Always down for a matcha latte.',
  ),
];
