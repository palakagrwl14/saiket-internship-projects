import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App with Levels',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CategorySelectionScreen(),
    );
  }
}

// Question Model
class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

// Quiz Data by Category and Level
class QuizData {
  static Map<String, Map<String, List<Question>>> categories = {
    "Geography": {
      "Easy": [
        Question(
          question: "What is the capital of France?",
          answers: ["Paris", "London", "Berlin"],
          correctAnswer: "Paris",
        ),
        Question(
          question: "Which continent is Egypt in?",
          answers: ["Asia", "Africa", "Europe"],
          correctAnswer: "Africa",
        ),
        Question(
          question: "What is the largest country by area?",
          answers: ["China", "Canada", "Russia"],
          correctAnswer: "Russia",
        ),
      ],
      "Medium": [
        Question(
          question: "What is the capital of Australia?",
          answers: ["Sydney", "Canberra", "Melbourne"],
          correctAnswer: "Canberra",
        ),
        Question(
          question: "Which is the longest river in the world?",
          answers: ["Amazon", "Nile", "Yangtze"],
          correctAnswer: "Nile",
        ),
        Question(
          question: "How many countries are in Africa?",
          answers: ["45", "54", "62"],
          correctAnswer: "54",
        ),
      ],
      "Hard": [
        Question(
          question: "What is the smallest country in the world?",
          answers: ["Monaco", "Vatican City", "San Marino"],
          correctAnswer: "Vatican City",
        ),
        Question(
          question: "Which ocean is the deepest?",
          answers: ["Atlantic", "Pacific", "Indian"],
          correctAnswer: "Pacific",
        ),
        Question(
          question: "What is the capital of Bhutan?",
          answers: ["Thimphu", "Kathmandu", "Dhaka"],
          correctAnswer: "Thimphu",
        ),
      ],
    },
    "Science": {
      "Easy": [
        Question(
          question: "How many planets are in our solar system?",
          answers: ["7", "8", "9"],
          correctAnswer: "8",
        ),
        Question(
          question: "What gas do plants absorb from the air?",
          answers: ["Oxygen", "Carbon Dioxide", "Nitrogen"],
          correctAnswer: "Carbon Dioxide",
        ),
        Question(
          question: "What is H2O commonly known as?",
          answers: ["Water", "Hydrogen", "Oxygen"],
          correctAnswer: "Water",
        ),
      ],
      "Medium": [
        Question(
          question: "What is the chemical symbol for gold?",
          answers: ["Go", "Au", "Gd"],
          correctAnswer: "Au",
        ),
        Question(
          question: "What is the speed of light?",
          answers: ["300,000 km/s", "150,000 km/s", "450,000 km/s"],
          correctAnswer: "300,000 km/s",
        ),
        Question(
          question: "What is the powerhouse of the cell?",
          answers: ["Nucleus", "Mitochondria", "Ribosome"],
          correctAnswer: "Mitochondria",
        ),
      ],
      "Hard": [
        Question(
          question: "What is the atomic number of Carbon?",
          answers: ["4", "6", "8"],
          correctAnswer: "6",
        ),
        Question(
          question: "What particle has no electric charge?",
          answers: ["Proton", "Electron", "Neutron"],
          correctAnswer: "Neutron",
        ),
        Question(
          question: "What is the most abundant gas in Earth's atmosphere?",
          answers: ["Oxygen", "Nitrogen", "Carbon Dioxide"],
          correctAnswer: "Nitrogen",
        ),
      ],
    },
    "History": {
      "Easy": [
        Question(
          question: "Who was the first President of the USA?",
          answers: ["Thomas Jefferson", "George Washington", "Abraham Lincoln"],
          correctAnswer: "George Washington",
        ),
        Question(
          question: "In which year did World War II end?",
          answers: ["1943", "1945", "1947"],
          correctAnswer: "1945",
        ),
        Question(
          question: "Who discovered America?",
          answers: ["Christopher Columbus", "Marco Polo", "Vasco da Gama"],
          correctAnswer: "Christopher Columbus",
        ),
      ],
      "Medium": [
        Question(
          question: "Who was the first man on the moon?",
          answers: ["Buzz Aldrin", "Neil Armstrong", "Yuri Gagarin"],
          correctAnswer: "Neil Armstrong",
        ),
        Question(
          question: "In which year did the Berlin Wall fall?",
          answers: ["1987", "1989", "1991"],
          correctAnswer: "1989",
        ),
        Question(
          question: "Who wrote the Declaration of Independence?",
          answers: ["George Washington", "Benjamin Franklin", "Thomas Jefferson"],
          correctAnswer: "Thomas Jefferson",
        ),
      ],
      "Hard": [
        Question(
          question: "What year was the Magna Carta signed?",
          answers: ["1215", "1315", "1415"],
          correctAnswer: "1215",
        ),
        Question(
          question: "Who was the longest-reigning British monarch before Elizabeth II?",
          answers: ["Queen Victoria", "King George III", "King Henry VIII"],
          correctAnswer: "Queen Victoria",
        ),
        Question(
          question: "What ancient civilization built Machu Picchu?",
          answers: ["Aztecs", "Incas", "Mayans"],
          correctAnswer: "Incas",
        ),
      ],
    },
    "Current Affairs":{
      "Easy":[
        Question(question: "Where was the 2025 G20 Summit held?", answers: ["Tokyo,New York,Johannesburg"], correctAnswer: "Johannesburg"),
        Question(question: "International Day of Older Persons is observed on which date?", answers: ["October 1,November 1,Octopber 4"], correctAnswer: "October 1"),
        Question(question: "Which tiger reserve's locaton was asked in a recent current affairs quiz?", answers: ["Ranthambore,Kaziranga,Satkosia"], correctAnswer: "Satkosia"),
      ],
      "Medium":[
        Question(question: "Which country hosted the BRICS Summit 2025?", answers: ["Russia,China,South Africa"], correctAnswer: "Russia"),
        Question(question: "World Economic Forum(WEF) 2025 was held in which city?", answers: ["Geneva,London,Davos"], correctAnswer: "Davos"),
        Question(question: "Which Indian mission is related to the study of the Sun?", answers: ["Chandrayaan-3,Mangalyaan,Aditya-L1"], correctAnswer: "Aditya-L1"),
      ],
      "Hard":[
        Question(question: "Who is the current UN Secretary-General(2025)?", answers: ["Antonio Costa,Antonio Guterres,Jens Stoltenberg"], correctAnswer: "Antonio Guterres"),
        Question(question: "Which country became the newqest member of BRICS in 2024-25 expansion?", answers: ["Argentina,Mexico,Saudi Arabia"], correctAnswer: "Saudi Arabia"),
        Question(question: "What is the name of India's first human spaceflight mission?", answers: ["Gaganyaan,Mangalyaan,Aditya-L1"], correctAnswer: "Gaganyaan"),
      ],
    },
  };
}

// Category Selection Screen
class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizVerse',style: TextStyle(fontSize: 30,color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Column(
              children: [
                const Text('Choose Your Quiz Category',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: Colors.blueGrey,
                ),),
                const SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Column(
                children: QuizData.categories.keys.map((category) {
                  return Expanded(
                      child: Padding(
                          padding: const
                      EdgeInsets.only(bottom: 16.0),
                      child: CategoryCard(
                          category: category,
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)
                                    =>
                                        LevelSelectionScreen(
                                            category: category),
                            ),);




                      },
                    ),
                  ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Card Widget
class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  IconData getCategoryIcon() {
    switch (category) {
      case "Geography":
        return Icons.public;
      case "Science":
        return Icons.science;
      case "History":
        return Icons.history_edu;
      case "Current Affairs":
        return Icons.person_2_rounded;
      default:
        return Icons.quiz;
    }
  }

  Color getCategoryColor() {
    switch (category) {
      case "Geography":
        return Colors.green;
      case "Science":
        return Colors.purple;
      case "History":
        return Colors.indigoAccent;
      case "Current Affairs":
        return Colors.deepOrangeAccent;
      default:
        return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                getCategoryColor().withOpacity(0.7),
                getCategoryColor(),
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                getCategoryIcon(),
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '3 Difficulty Levels',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Level Selection Screen
class LevelSelectionScreen extends StatelessWidget {
  final String category;

  const LevelSelectionScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category - Select Level'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Choose Difficulty Level',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                children: [
                  LevelCard(
                    level: 'Easy',
                    description: 'Perfect for beginners',
                    color: Colors.green,
                    icon: Icons.sentiment_satisfied,
                    questionCount: QuizData.categories[category]!['Easy']!.length,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            category: category,
                            level: 'Easy',
                            questions: QuizData.categories[category]!['Easy']!,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  LevelCard(
                    level: 'Medium',
                    description: 'Test your knowledge',
                    color: Colors.orange,
                    icon: Icons.sentiment_neutral,
                    questionCount: QuizData.categories[category]!['Medium']!.length,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            category: category,
                            level: 'Medium',
                            questions: QuizData.categories[category]!['Medium']!,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  LevelCard(
                    level: 'Hard',
                    description: 'For experts only',
                    color: Colors.red,
                    icon: Icons.sentiment_very_dissatisfied,
                    questionCount: QuizData.categories[category]!['Hard']!.length,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            category: category,
                            level: 'Hard',
                            questions: QuizData.categories[category]!['Hard']!,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Level Card Widget
class LevelCard extends StatelessWidget {
  final String level;
  final String description;
  final Color color;
  final IconData icon;
  final int questionCount;
  final VoidCallback onTap;

  const LevelCard({
    Key? key,
    required this.level,
    required this.description,
    required this.color,
    required this.icon,
    required this.questionCount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$questionCount Questions',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quiz Screen
class QuizScreen extends StatefulWidget {
  final String category;
  final String level;
  final List<Question> questions;

  const QuizScreen({
    Key? key,
    required this.category,
    required this.level,
    required this.questions,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool isAnswered = false;
  int score = 0;
  bool quizCompleted = false;

  void handleSubmit() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an answer first!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      isAnswered = true;
      if (selectedAnswer == widget.questions[currentQuestionIndex].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        isAnswered = false;
      });
    } else {
      setState(() {
        quizCompleted = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswer = null;
      isAnswered = false;
      score = 0;
      quizCompleted = false;
    });
  }

  Color getLevelColor() {
    switch (widget.level) {
      case 'Easy':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Hard':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (quizCompleted) {
      double percentage = (score / widget.questions.length) * 100;
      String grade = percentage >= 80
          ? 'Excellent!'
          : percentage >= 60
          ? 'Good Job!'
          : percentage >= 40
          ? 'Not Bad!'
          : 'Keep Trying!';

      return Scaffold(
        appBar: AppBar(
          title: Text('${widget.category} - ${widget.level}'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events,
                  size: 100,
                  color: Colors.amber,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Quiz Completed!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  grade,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: getLevelColor(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Score: $score / ${widget.questions.length}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: percentage >= 60 ? Colors.green : Colors.orange,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: restartQuiz,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    backgroundColor: getLevelColor(),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back to Levels'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    side: BorderSide(color: getLevelColor(), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Back to Categories'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    side: const BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Question currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} - ${widget.level}'),
        backgroundColor: getLevelColor(),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Score: $score',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.questions.length,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(getLevelColor()),
              minHeight: 8,
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.question,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ...currentQuestion.answers.map((answer) {
              bool isCorrect = answer == currentQuestion.correctAnswer;
              bool isSelected = answer == selectedAnswer;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: RadioListTile<String>(
                  title: Text(
                    answer,
                    style: const TextStyle(fontSize: 18),
                  ),
                  value: answer,
                  groupValue: selectedAnswer,
                  onChanged: isAnswered
                      ? null
                      : (value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                  },
                  activeColor: isAnswered
                      ? (isCorrect ? Colors.green : Colors.red)
                      : getLevelColor(),
                  tileColor: isAnswered
                      ? (isCorrect
                      ? Colors.green.shade50
                      : isSelected
                      ? Colors.red.shade50
                      : null)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: isAnswered
                          ? (isCorrect
                          ? Colors.green
                          : isSelected
                          ? Colors.red
                          : Colors.grey.shade300)
                          : (isSelected
                          ? getLevelColor()
                          : Colors.grey.shade300),
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 30),
            if (!isAnswered)
              ElevatedButton(
                onPressed: handleSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: getLevelColor(),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit Answer',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            if (isAnswered) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedAnswer == currentQuestion.correctAnswer
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectedAnswer == currentQuestion.correctAnswer
                        ? Colors.green
                        : Colors.red,
                    width: 2,
                  ),
                ),
                child: Text(
                  selectedAnswer == currentQuestion.correctAnswer
                      ? "Correct! 🎉"
                      : "Incorrect! The correct answer is ${currentQuestion.correctAnswer}.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: selectedAnswer == currentQuestion.correctAnswer
                        ? Colors.green.shade800
                        : Colors.red.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: nextQuestion,style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: getLevelColor(),
              foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
                  child: Text(
    currentQuestionIndex<widget.questions.length - 1?'Next Question':'View Results',
    style: const TextStyle(fontSize: 18),
    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}