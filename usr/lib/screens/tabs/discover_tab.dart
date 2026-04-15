import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/user_profile.dart';
import 'package:couldai_user_app/screens/paywall_screen.dart';
import 'package:couldai_user_app/services/matching_engine.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  final PageController _pageController = PageController();
  int _connectsRemaining = 3; // Mock limit
  List<UserProfile> _sortedProfiles = [];

  @override
  void initState() {
    super.initState();
    // Create a mock current user to test matching
    final currentUser = UserProfile(
      id: 'me',
      name: 'Me',
      age: 28,
      city: 'New York',
      photos: [],
      matchHighlights: [],
      bio: '',
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
    );
    _sortedProfiles = MatchingEngine.getSortedMatches(currentUser, mockProfiles);
  }

  void _onConnect(UserProfile profile) {
    if (_connectsRemaining > 0) {
      setState(() {
        _connectsRemaining--;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connect sent to ${profile.name}!')),
      );
      _nextProfile();
    } else {
      _showPaywall();
    }
  }

  void _onSkip() {
    _nextProfile();
  }

  void _nextProfile() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _showPaywall() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaywallScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: _sortedProfiles.length,
            itemBuilder: (context, index) {
              return _buildProfileCard(_sortedProfiles[index]);
            },
          ),
          // Connects Counter
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$_connectsRemaining Connects left',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(UserProfile profile) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Photo
        Image.network(
          profile.photos.first,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey.shade300,
            child: const Icon(Icons.person, size: 100, color: Colors.white),
          ),
        ),
        // Gradient overlay for text readability
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.8),
              ],
              stops: const [0.5, 0.7, 1.0],
            ),
          ),
        ),
        // Profile Info
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${profile.name}, ${profile.age}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white70, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    profile.city,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Highlights
              ...profile.matchHighlights.map((highlight) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 14),
                          const SizedBox(width: 6),
                          Text(
                            highlight,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 24),
              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.close,
                    color: Colors.white,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    onPressed: _onSkip,
                  ),
                  _buildActionButton(
                    icon: Icons.favorite,
                    color: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () => _onConnect(profile),
                    size: 64,
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onPressed,
    double size = 56,
  }) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
        ),
        child: Icon(icon, color: color, size: size * 0.5),
      ),
    );
  }
}
