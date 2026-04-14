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
  final String enTitle;
  final List<Option> items;
  Section(this.ruTitle, this.enTitle, this.items);
}

class Question {
  final String id;
  final QuestionType type;
  final String ruText;
  final String enText;
  final String? ruHelperText;
  final String? enHelperText;
  final List<Option>? options;
  final int? minSelections;
  final int? maxSelections;
  final List<Section>? sections;

  Question({
    required this.id,
    required this.type,
    required this.ruText,
    required this.enText,
    this.ruHelperText,
    this.enHelperText,
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
    id: 'q14',
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
    id: 'q15',
    type: QuestionType.multiSelect,
    ruText: 'Какие форматы общения предпочитаешь?',
    enText: 'Which communication formats do you prefer?',
    ruHelperText: 'Выбери 2',
    enHelperText: 'Choose 2',
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
    id: 'q16',
    type: QuestionType.multiSelectSectioned,
    ruText: 'Твои хобби',
    enText: 'Your hobbies',
    ruHelperText: 'Выбери минимум 5',
    enHelperText: 'Choose minimum 5',
    minSelections: 5,
    maxSelections: null,
    sections: [
      Section('Креативные хобби', 'Creative hobbies', [
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
      Section('Спорт и фитнес', 'Sports and fitness', [
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
      Section('Гастрономия', 'Gastronomy', [
        Option('🍽️ Гурман', 'Foodie'),
        Option('🧁 Выпечка', 'Baking'),
        Option('👩‍🍳 Готовка', 'Cooking'),
        Option('☕ Кофе', 'Coffee'),
        Option('🥗 Здоровое питание', 'Healthy eating'),
        Option('🌱 Вегетарианство', 'Vegetarianism'),
        Option('🍷 Вино', 'Wine'),
        Option('🍸 Коктейли', 'Cocktails'),
      ]),
      Section('Развлечения', 'Entertainment', [
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
      Section('Животные', 'Animals', [
        Option('🐱 Кошки', 'Cats'),
        Option('🐶 Собаки', 'Dogs'),
        Option('🐦 Птицы', 'Birds'),
      ]),
      Section('Путешествия', 'Travel', [
        Option('🥾 Походы', 'Hiking'),
        Option('🏖️ Пляжи', 'Beaches'),
        Option('🏔️ Горы', 'Mountains'),
        Option('🗺️ Экскурсии', 'Sightseeing'),
        Option('🚗 Роудтрип', 'Road trip'),
        Option('⛺ Кемпинг', 'Camping'),
      ]),
      Section('Забота о себе', 'Self-care', [
        Option('📖 Саморазвитие', 'Self-development'),
        Option('💅 Бьюти', 'Beauty'),
        Option('🧠 Психология', 'Psychology'),
        Option('🎯 Коучинг', 'Coaching'),
        Option('⚡ Биохакинг', 'Biohacking'),
      ]),
    ],
  ),
  Question(
    id: 'q17',
    type: QuestionType.photoUpload,
    ruText: 'Добавь свое фото',
    enText: 'Add your photo',
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
        final List<String> selected = (_answers[q.id] as List<dynamic>?)?.cast<String>() ?? <String>[];
        return selected.length == q.minSelections;
      case QuestionType.multiSelectSectioned:
        final List<String> selected = (_answers[q.id] as List<dynamic>?)?.cast<String>() ?? <String>[];
        if (q.maxSelections == null) {
          return selected.length >= (q.minSelections ?? 1);
        }
        return selected.length >= (q.minSelections ?? 1) && selected.length <= q.maxSelections!;
      case QuestionType.photoUpload:
        return _uploadedPhotos.length == 3;
    }
  }

  void _nextPage() {
    if (!_isCurrentQuestionValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.language == 'RU' 
              ? 'Пожалуйста, ответьте на вопрос корректно' 
              : 'Please answer the question correctly'
          ),
        ),
      );
      return;
    }

    if (_currentIndex < onboardingQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
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

  String _getSectionTitle(Section s) {
    return widget.language == 'RU' ? s.ruTitle : s.enTitle;
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
          items: countries.map((c) {
            return DropdownMenuItem(
              value: c,
              child: Text(c),
            );
          }).toList(),
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
              hintText: widget.language == 'RU' ? 'Введите вашу страну' : 'Enter your country',
              border: const OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
        ],
        TextField(
          controller: _cityController,
          decoration: InputDecoration(
            hintText: widget.language == 'RU' ? 'Введите город' : 'Enter your city',
            border: const OutlineInputBorder(),
          ),
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }

  Widget _buildSingleSelect(Question q) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: q.options!.length,
      itemBuilder: (context, index) {
        final option = q.options![index];
        return RadioListTile<String>(
          title: Text(_getOptionText(option)),
          value: option.en,
          groupValue: _answers[q.id],
          onChanged: (val) {
            setState(() {
              _answers[q.id] = val;
            });
          },
        );
      },
    );
  }

  Widget _buildMultiSelect(Question q) {
    final List<String> selected = (_answers[q.id] as List<dynamic>?)?.cast<String>() ?? <String>[];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: q.options!.length,
      itemBuilder: (context, index) {
        final option = q.options![index];
        final isSelected = selected.contains(option.en);
        return CheckboxListTile(
          title: Text(_getOptionText(option)),
          value: isSelected,
          onChanged: (val) {
            setState(() {
              if (val == true) {
                if (selected.length < (q.maxSelections ?? 999)) {
                  selected.add(option.en);
                }
              } else {
                selected.remove(option.en);
              }
              _answers[q.id] = selected;
            });
          },
        );
      },
    );
  }

  Widget _buildMultiSelectSectioned(Question q) {
    final List<String> selected = (_answers[q.id] as List<dynamic>?)?.cast<String>() ?? <String>[];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: q.sections!.length,
      itemBuilder: (context, sectionIndex) {
        final section = q.sections![sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                _getSectionTitle(section),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: section.items.map((option) {
                final isSelected = selected.contains(option.en);
                return FilterChip(
                  label: Text(_getOptionText(option)),
                  selected: isSelected,
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        if (selected.length < (q.maxSelections ?? 999)) {
                          selected.add(option.en);
                        }
                      } else {
                        selected.remove(option.en);
                      }
                      _answers[q.id] = selected;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildPhotoUpload(Question q) {
    return Column(
      children: [
        Text(
          widget.language == 'RU' 
            ? 'Загружено: ${_uploadedPhotos.length}/3' 
            : 'Uploaded: ${_uploadedPhotos.length}/3',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(3, (index) {
            final hasPhoto = index < _uploadedPhotos.length;
            return GestureDetector(
              onTap: () {
                if (!hasPhoto) {
                  setState(() {
                    _uploadedPhotos.add('photo_path_$index');
                  });
                } else {
                  setState(() {
                    _uploadedPhotos.removeAt(index);
                  });
                }
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: hasPhoto
                    ? const Icon(Icons.check_circle, color: Colors.green, size: 40)
                    : const Icon(Icons.add_a_photo, color: Colors.grey, size: 40),
              ),
            );
          }),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _previousPage,
        ),
        title: Text(
          widget.language == 'RU' ? 'Анкета' : 'Questionnaire',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (onboardingQuestions[_currentIndex].type != QuestionType.photoUpload)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  widget.language == 'RU'
                      ? 'Вопрос ${_currentIndex + 1} из 15'
                      : 'Question ${_currentIndex + 1} of 15',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            LinearProgressIndicator(
              value: (_currentIndex + 1) / onboardingQuestions.length,
              backgroundColor: Colors.grey[200],
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
                  final q = onboardingQuestions[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getQuestionText(q),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (q.ruHelperText != null && q.enHelperText != null)
                          Text(
                            widget.language == 'RU' ? q.ruHelperText! : q.enHelperText!,
                            style: const TextStyle(color: Colors.grey),
                          )
                        else if (q.minSelections != null && q.maxSelections != null)
                          Text(
                            widget.language == 'RU'
                                ? 'Выберите от ${q.minSelections} до ${q.maxSelections} вариантов'
                                : 'Select between ${q.minSelections} and ${q.maxSelections} options',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        const SizedBox(height: 24),
                        _buildQuestionContent(q),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isCurrentQuestionValid() ? _nextPage : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    _currentIndex == onboardingQuestions.length - 1
                        ? (widget.language == 'RU' ? 'Завершить' : 'Finish')
                        : (widget.language == 'RU' ? 'Далее' : 'Next'),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
