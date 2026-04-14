import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/main_navigation_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Mock questions for the questionnaire
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What are you looking for in a friend?',
      'options': ['Deep conversations', 'Activity partner', 'Casual hangouts', 'Emotional support'],
    },
    {
      'question': 'How do you prefer to spend your weekends?',
      'options': ['Outdoors/Nature', 'Cozy at home', 'Exploring the city', 'Partying/Events'],
    },
    {
      'question': 'What is your communication style?',
      'options': ['Texting all day', 'Occasional calls', 'Meetups only', 'Voice notes'],
    },
    {
      'question': 'Are you an introvert or extrovert?',
      'options': ['Introvert', 'Extrovert', 'Ambivert', 'Depends on the day'],
    },
    {
      'question': 'What is your favorite type of movie?',
      'options': ['Comedy', 'Drama', 'Sci-Fi/Fantasy', 'Documentary'],
    },
    {
      'question': 'How do you handle stress?',
      'options': ['Talk it out', 'Need alone time', 'Exercise', 'Creative hobbies'],
    },
    {
      'question': 'What is your ideal vacation?',
      'options': ['Beach resort', 'City exploration', 'Mountain hiking', 'Cultural tour'],
    },
    {
      'question': 'Do you have pets?',
      'options': ['Dog person', 'Cat person', 'Other pets', 'No pets'],
    },
    {
      'question': 'What is your relationship with fitness?',
      'options': ['Gym rat', 'Casual workouts', 'Yoga/Pilates', 'Not my thing'],
    },
    {
      'question': 'How important is career to you?',
      'options': ['Very important', 'Balanced', 'Just a job', 'Currently studying'],
    },
    {
      'question': 'What is your favorite cuisine?',
      'options': ['Italian', 'Asian', 'Mexican', 'Local food'],
    },
    {
      'question': 'Do you enjoy reading?',
      'options': ['Avid reader', 'Occasionally', 'Audiobooks', 'Not really'],
    },
    {
      'question': 'What is your morning routine?',
      'options': ['Early bird', 'Hit snooze', 'Coffee first', 'Workout'],
    },
    {
      'question': 'How do you feel about spontaneous plans?',
      'options': ['Love them', 'Sometimes', 'Need notice', 'Hate them'],
    },
    {
      'question': 'What is your primary goal here?',
      'options': ['Find a best friend', 'Expand social circle', 'Find a hobby buddy', 'Just chatting'],
    },
  ];

  final Map<int, String> _answers = {};

  void _nextQuestion(String answer) {
    setState(() {
      _answers[_currentIndex] = answer;
    });

    if (_currentIndex < _questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    // Here we would save _answers to the backend
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _currentIndex > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : null,
        title: Text('Question ${_currentIndex + 1} of ${_questions.length}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swipe to force answering
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  final question = _questions[index];
                  final options = question['options'] as List<String>;

                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 32),
                        Text(
                          question['question'],
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 48),
                        ...options.map((option) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: OutlinedButton(
                                onPressed: () => _nextQuestion(option),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(20),
                                  side: BorderSide(
                                    color: _answers[index] == option
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  backgroundColor: _answers[index] == option
                                      ? Theme.of(context).primaryColor.withOpacity(0.05)
                                      : Colors.transparent,
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    color: _answers[index] == option
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).colorScheme.onSurface,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
