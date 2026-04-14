import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/main_navigation_screen.dart';

enum QuestionType {
  text,
  countryCity,
  single,
  multiSelect,
  multiSelectSectioned,
  photoUpload,
}

class Option {
  final String ru;
  final String en;
  Option(this.ru, this.en);
}

class Section {
  final String ruTitle;
  final List<Option> items;
  Section(this.ruTitle, this.items);
}

class Question {
  final String id;
  final QuestionType type;
  final String ruText;
  final String enText;
  final List<Option>? options;
  final int? minSelections;
  final int? maxSelections;
  final List<Section>? sections;

  Question({
    required this.id,
    required this.type,
    required this.ruText,
    required this.enText,
    this.options,
    this.minSelections,
    this.maxSelections,
    this.sections,
  });
}

final List<Question> onboardingQuestions = [
  Question(
    id: 'q1',
    type: QuestionType.text,
    ruText: 'Твоё имя',
    enText: 'Your name',
  ),
  Question(
    id: 'q2',
    type: QuestionType.countryCity,
    ruText: 'Укажи страну и город, где ты живёшь',
    enText: 'Tell us the country and city where you live',
  ),
  Question(
    id: 'q3',
    type: QuestionType.single,
    ruText: 'Кого ты ищешь в данный момент?',
    enText: 'Who are you looking for right now?',
    options: [
      Option('Подруг', 'Friends'),
      Option('В первую очередь подруг, но открыта и к полезным контактам', 'Primarily friends, but open to useful contacts'),
      Option('Полезные контакты', 'Useful contacts'),
    ],
  ),
  Question(
    id: 'q4',
    type: QuestionType.single,
    ruText: 'Какой стиль общения с мэтчем тебе ближе?',
    enText: 'What is your communication style?',
    options: [
      Option('Глубокие разговоры один на один', 'Deep one-on-one conversations'),
      Option('Весёлые посиделки в компании', 'Fun group hangouts'),
      Option('Готова к любому формату', 'Mix of both'),
      Option('Больше переписка/голосовые', 'Mostly texting/voice messages'),
    ],
  ),
  Question(
    id: 'q5',
    type: QuestionType.single,
    ruText: 'Насколько важна для тебя эмоциональная поддержка и открытость в общении?',
    enText: 'How important is emotional support and openness in communication?',
    options: [
      Option('Совсем не важна', '1 — Not important at all'),
      Option('Скорее не важна', '2 — Rather not important'),
      Option('Важна', '3 — Important'),
      Option('Очень важна', '4 — Very important'),
      Option('Критически важна', '5 — Critically important'),
    ],
  ),
  Question(
    id: 'q6',
    type: QuestionType.single,
    ruText: 'Как часто ты готова встречаться с новым контактом в первые месяцы?',
    enText: 'How often are you ready to meet a new contact in the first months?',
    options: [
      Option('1–2 раза в месяц (спокойный темп)', '1-2 times a month (relaxed pace)'),
      Option('1 раз в неделю или чаще', 'Once a week or more'),
      Option('Зависит от человека и обстоятельств', 'Depends on the person and circumstances'),
    ],
  ),
  Question(
    id: 'q7',
    type: QuestionType.single,
    ruText: 'Какое слово больше тебя описывает?',
    enText: 'Which word describes you best?',
    options: [
      Option('Экстраверт — люблю активность и новые знакомства', 'Extrovert — I love activity and new acquaintances'),
      Option('Амбиверт — комфортно и в тишине, и в движении', 'Ambivert — comfortable in both quiet and active settings'),
      Option('Интроверт — предпочитаю спокойные и глубокие форматы', 'Introvert — I prefer calm and deep formats'),
    ],
  ),
  Question(
    id: 'q8',
    type: QuestionType.single,
    ruText: 'Насколько ты открыта в выражении эмоций и переживаний?',
    enText: 'How open are you in expressing emotions and feelings?',
    options: [
      Option('Всегда держу всё при себе', '1 — Always keep everything to myself'),
      Option('Сдержана, но могу открыться', '2 — Reserved, but can open up'),
      Option('Могу и так и так, зависит от ситуации', '3 — Can go either way, depends on the situation'),
      Option('Достаточно открыта', '4 — Quite open'),
      Option('Легко делюсь чувствами', '5 — Easily share feelings'),
    ],
  ),
  Question(
    id: 'q9',
    type: QuestionType.single,
    ruText: 'Что для тебя важнее всего в новом контакте?',
    enText: 'What matters most to you in a new contact?',
    options: [
      Option('Эмпатия и умение слушать', 'Empathy and listening skills'),
      Option('Честность и прямота', 'Honesty and directness'),
      Option('Позитив, юмор, лёгкость', 'Positivity, humor, lightness'),
      Option('Надёжность и последовательность', 'Reliability and consistency'),
      Option('Общие интересы / цели', 'Shared interests / goals'),
      Option('Профессиональный опыт / мотивация', 'Professional experience / motivation'),
    ],
  ),
  Question(
    id: 'q10',
    type: QuestionType.single,
    ruText: 'Как ты обычно ведешь себя во время конфликтов?',
    enText: 'How do you usually handle conflicts?',
    options: [
      Option('Стараюсь избегать конфликтов', 'Try to avoid conflicts'),
      Option('Сглаживаю углы, но отстою свою позицию, если нужно', 'Kind but can stand my ground'),
      Option('Я прямая, иногда резкая, если что-то не так', 'Direct, sometimes blunt when something is wrong'),
    ],
  ),
  Question(
    id: 'q11',
    type: QuestionType.single,
    ruText: 'Насколько тебя выбивает из равновесия неопределённость…?',
    enText: 'How much does uncertainty unsettle you…?',
    options: [
      Option('Совсем не выбивает', '1 — Doesn\'t affect me at all'),
      Option('Немного задевает, но быстро отпускает', '2 — Bothers me slightly but passes quickly'),
      Option('Зависит от ситуации', '3 — Depends on the situation'),
      Option('Часто выбивает, сложно игнорировать', '4 — Often unsettles me, hard to ignore'),
      Option('Сильно выбивает, очень переживаю', '5 — Strongly unsettles me, I worry a lot'),
    ],
  ),
  Question(
    id: 'q12',
    type: QuestionType.single,
    ruText: 'Что из перечисленного тебе ближе всего?',
    enText: 'What resonates with you most?',
    options: [
      Option('Новые идеи, психология, саморазвитие, книги', 'New ideas, psychology, self-development, books'),
      Option('Путешествия, активный отдых, приключения', 'Travel, active recreation, adventures'),
      Option('Стабильность, уют, проверенные темы', 'Stability, coziness, familiar topics'),
    ],
  ),
  Question(
    id: 'q13',
    type: QuestionType.single,
    ruText: 'Готова ли ты инициировать общение / встречи первой?',
    enText: 'Are you ready to initiate contact first?',
    options: [
      Option('Да, люблю быть инициатором', 'Yes, I love being the initiator'),
      Option('Иногда, если очень интересно', 'Sometimes, if very interesting'),
      Option('Предпочитаю, чтобы другая начинала', 'Prefer the other person to initiate'),
    ],
  ),
  Question(
    id: 'q14',
    type: QuestionType.multiSelect,
    ruText: 'Какие форматы общения предпочитаешь?',
    enText: 'Which communication formats do you prefer?',
    minSelections: 2,
    maxSelections: 2,
    options: [
      Option('Глубокие разговоры по душам', 'Deep heart-to-heart conversations'),
      Option('Активности вместе (прогулки, спорт, кофе, шопинг)', 'Activities together (walks, sports, coffee, shopping)'),
      Option('Обсуждение идей / проектов / опыта', 'Discussing ideas / projects / experience'),
      Option('Редкие встречи', 'Rare meetups'),
    ],
  ),
  Question(
    id: 'q15',
    type: QuestionType.multiSelectSectioned,
    ruText: 'Твои хобби',
    enText: 'Your hobbies',
    minSelections: 1,
    maxSelections: 5,
    sections: [
      Section('Креативные хобби', [
        Option('🎤 Вокал', 'Vocals'),
        Option('💃 Танцы', 'Dancing'),
        Option('🎨 Рисование', 'Drawing / painting'),
        Option('✂️ Хэндмейд', 'Crafts and handmade'),
        Option('🏺 Гончарное дело и керамика', 'Pottery and ceramics'),
        Option('🧶 Вязание', 'Knitting'),
        Option('📱 Блогинг', 'Blogging'),
        Option('📸 Фотография', 'Photography'),
        Option('🎸 Игра на гитаре', 'Guitar'),
        Option('🎹 Игра на фортепиано', 'Piano'),
        Option('🎭 Актерское мастерство', 'Acting'),
      ]),
      Section('Спорт и фитнес', [
        Option('🏃 Бег', 'Running'),
        Option('🏋️ Тренажерка', 'Gym'),
        Option('🧘 Йога', 'Yoga'),
        Option('🤸 Пилатес', 'Pilates'),
        Option('🎾 Падел', 'Padel'),
        Option('🤾 Стретчинг', 'Stretching'),
        Option('🩰 Барре', 'Barre'),
        Option('💪 Силовые тренировки', 'Strength training'),
        Option('🔥 Кроссфит', 'CrossFit'),
        Option('🥋 Боевые искусства', 'Martial arts'),
        Option('⛷️ Лыжи', 'Skiing'),
        Option('⛸️ Коньки', 'Ice skating'),
        Option('🎾 Теннис', 'Tennis'),
        Option('🥊 Бокс / кикбоксинг', 'Boxing / kickboxing'),
      ]),
      Section('Гастрономия', [
        Option('🍽️ Гурман', 'Foodie'),
        Option('🧁 Выпечка', 'Baking'),
        Option('👩‍🍳 Готовка', 'Cooking'),
        Option('☕ Кофе', 'Coffee'),
        Option('🥗 Здоровое питание', 'Healthy eating'),
        Option('🌱 Вегетарианство', 'Vegetarianism'),
        Option('🍷 Вино', 'Wine'),
        Option('🍸 Коктейли', 'Cocktails'),
      ]),
      Section('Развлечения', [
        Option('🍻 Бары', 'Bars'),
        Option('🎵 Концерты', 'Concerts'),
        Option('📚 Книжные клубы', 'Book clubs'),
        Option('🎙️ Караоке', 'Karaoke'),
        Option('🎬 Кино', 'Cinema'),
        Option('🏛️ Музеи', 'Museums'),
        Option('😂 Стендап', 'Stand-up'),
        Option('🎪 Театр', 'Theater'),
        Option('🎶 Опера', 'Opera'),
        Option('🩰 Балет', 'Ballet'),
        Option('🧺 Пикники', 'Picnics'),
      ]),
      Section('Животные', [
        Option('🐱 Кошки', 'Cats'),
        Option('🐶 Собаки', 'Dogs'),
        Option('🐦 Птицы', 'Birds'),
      ]),
      Section('Путешествия', [
        Option('🥾 Походы', 'Hiking'),
        Option('🏖️ Пляжи', 'Beaches'),
        Option('🏔️ Горы', 'Mountains'),
        Option('🗺️ Экскурсии', 'Sightseeing'),
        Option('🚗 Роудтрип', 'Road trip'),
        Option('⛺ Кемпинг', 'Camping'),
      ]),
      Section('Забота о себе', [
        Option('📖 Саморазвитие', 'Self-development'),
        Option('💅 Бьюти', 'Beauty'),
        Option('🧠 Психология', 'Psychology'),
        Option('🎯 Коучинг', 'Coaching'),
        Option('⚡ Биохакинг', 'Biohacking'),
      ]),
    ],
  ),
  Question(
    id: 'q16',
    type: QuestionType.photoUpload,
    ruText: 'Добавь 3 фото',
    enText: 'Add 3 photos',
  ),
];

class OnboardingScreen extends StatefulWidget {
  final String language;
  const OnboardingScreen({super.key, this.language = 'EN'});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // State for answers
  final Map<String, dynamic> _answers = {};

  // Controllers for text inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _otherCountryController = TextEditingController();
  String? _selectedCountry;
  
  // State for photos
  final List<String> _uploadedPhotos = [];

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _cityController.dispose();
    _otherCountryController.dispose();
    super.dispose();
  }

  bool _isCurrentQuestionValid() {
    final q = onboardingQuestions[_currentIndex];
    switch (q.type) {
      case QuestionType.text:
        return _nameController.text.trim().isNotEmpty;
      case QuestionType.countryCity:
        if (_selectedCountry == null) return false;
        if (_selectedCountry == 'OTHER' && _otherCountryController.text.trim().isEmpty) return false;
        if (_cityController.text.trim().isEmpty) return false;
        return true;
      case QuestionType.single:
        return _answers[q.id] != null;
      case QuestionType.multiSelect:
        final List<String> selected = _answers[q.id] ?? [];
        return selected.length == q.minSelections;
      case QuestionType.multiSelectSectioned:
        final List<String> selected = _answers[q.id] ?? [];
        return selected.length >= (q.minSelections ?? 1) && selected.length <= (q.maxSelections ?? 5);
      case QuestionType.photoUpload:
        return _uploadedPhotos.length == 3;
    }
  }

  void _nextPage() {
    if (!_isCurrentQuestionValid()) return;

    if (_currentIndex < onboardingQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
    );
  }

  String _getQuestionText(Question q) {
    return widget.language == 'RU' ? q.ruText : q.enText;
  }

  String _getOptionText(Option o) {
    return widget.language == 'RU' ? o.ru : o.en;
  }

  Widget _buildTextInput(Question q) {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        hintText: widget.language == 'RU' ? 'Введите имя' : 'Enter your name',
        border: const OutlineInputBorder(),
      ),
      onChanged: (_) => setState(() {}),
    );
  }

  Widget _buildCountryCityInput(Question q) {
    final countries = ['RU', 'BY', 'KZ', 'EE', 'LV', 'LT', 'DE', 'OTHER'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButtonFormField<String>(
          value: _selectedCountry,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          hint: Text(widget.language == 'RU' ? 'Выберите страну' : 'Select country'),
          items: countries.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
          onChanged: (val) {
            setState(() {
              _selectedCountry = val;
            });
          },
        ),
        const SizedBox(height: 16),
        if (_selectedCountry == 'OTHER') ...[
          TextField(
            controller: _otherCountryController,
            decoration: InputDecoration(
              hintText: widget.language == 'RU' ? 'Название страны' : 'Country name',
              border: const OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
        ],
        TextField(
          controller: _cityController,
          decoration: InputDecoration(
            hintText: widget.language == 'RU' ? 'Город' : 'City',
            border: const OutlineInputBorder(),
          ),
          onChanged: (_) => setState(() {}),
        ),
        if (widget.language == 'RU') ...[
          const SizedBox(height: 8),
          Text(
            'Если ты живешь в маленьком городе, но рядом есть крупный - укажи его, чтобы увеличить шанс на мэтчи',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      ],
    );
  }

  Widget _buildSingleSelect(Question q) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: q.options!.map((option) {
        final text = _getOptionText(option);
        final isSelected = _answers[q.id] == text;
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _answers[q.id] = text;
              });
              // Auto-advance for single select
              Future.delayed(const Duration(milliseconds: 200), _nextPage);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              side: BorderSide(
                color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
                width: 2,
              ),
              backgroundColor: isSelected ? Theme.of(context).primaryColor.withOpacity(0.05) : Colors.transparent,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMultiSelect(Question q) {
    final List<String> selected = _answers[q.id] ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: q.options!.map((option) {
        final text = _getOptionText(option);
        final isSelected = selected.contains(text);
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                if (isSelected) {
                  selected.remove(text);
                } else {
                  if (selected.length < (q.maxSelections ?? 999)) {
                    selected.add(text);
                  }
                }
                _answers[q.id] = selected;
              });
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              side: BorderSide(
                color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
                width: 2,
              ),
              backgroundColor: isSelected ? Theme.of(context).primaryColor.withOpacity(0.05) : Colors.transparent,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMultiSelectSectioned(Question q) {
    final List<String> selected = _answers[q.id] ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: q.sections!.map((section) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                section.ruTitle, // Using RU title as section header for both languages as per spec
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: section.items.map((option) {
                final text = _getOptionText(option);
                final isSelected = selected.contains(text);
                return FilterChip(
                  label: Text(text),
                  selected: isSelected,
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        if (selected.length < (q.maxSelections ?? 5)) {
                          selected.add(text);
                        }
                      } else {
                        selected.remove(text);
                      }
                      _answers[q.id] = selected;
                    });
                  },
                  selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                  checkmarkColor: Theme.of(context).primaryColor,
                );
              }).toList(),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildPhotoUpload(Question q) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            final hasPhoto = index < _uploadedPhotos.length;
            return GestureDetector(
              onTap: () {
                if (!hasPhoto) {
                  setState(() {
                    _uploadedPhotos.add('photo_${DateTime.now().millisecondsSinceEpoch}.jpg');
                  });
                }
              },
              child: Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: hasPhoto
                    ? const Icon(Icons.check_circle, color: Colors.green, size: 40)
                    : const Icon(Icons.add_a_photo, color: Colors.grey, size: 40),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
        Text(
          widget.language == 'RU' ? 'Загрузите 3 уникальных фото' : 'Upload 3 unique photos',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildQuestionContent(Question q) {
    switch (q.type) {
      case QuestionType.text:
        return _buildTextInput(q);
      case QuestionType.countryCity:
        return _buildCountryCityInput(q);
      case QuestionType.single:
        return _buildSingleSelect(q);
      case QuestionType.multiSelect:
        return _buildMultiSelect(q);
      case QuestionType.multiSelectSectioned:
        return _buildMultiSelectSectioned(q);
      case QuestionType.photoUpload:
        return _buildPhotoUpload(q);
    }
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
        title: Text('Question ${_currentIndex + 1} of ${onboardingQuestions.length}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (_currentIndex + 1) / onboardingQuestions.length,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: onboardingQuestions.length,
                itemBuilder: (context, index) {
                  final question = onboardingQuestions[index];

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            _getQuestionText(question),
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          _buildQuestionContent(question),
                          const SizedBox(height: 32),
                          if (question.type != QuestionType.single)
                            ElevatedButton(
                              onPressed: _isCurrentQuestionValid() ? _nextPage : null,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text(widget.language == 'RU' ? 'Продолжить' : 'Continue'),
                            ),
                        ],
                      ),
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
