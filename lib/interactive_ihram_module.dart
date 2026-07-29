import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'islamic_icons.dart';
import 'shared_widgets.dart';

// --- DATA MODELS ---

class IhramQuizQuestion {
  const IhramQuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}

class IhramGameCard {
  const IhramGameCard({
    required this.text,
    required this.isAllowed,
    required this.explanation,
  });

  final String text;
  final bool isAllowed;
  final String explanation;
}

// --- DATA SOURCES ---

const List<IhramQuizQuestion> quizData = [
  IhramQuizQuestion(
    question:
        "Antara berikut, manakah pakaian yang HARAM dipakai oleh jemaah LELAKI semasa dalam ihram?",
    options: [
      "Tali pinggang tanpa jahitan",
      "Kain ihram jenis tuala",
      "Kopiah atau songkok",
      "Cincin perak",
    ],
    correctIndex: 2,
    explanation:
        "Lelaki dilarang menutup kepala dengan pakaian yang melekat seperti kopiah, songkok, topi atau serban.",
  ),
  IhramQuizQuestion(
    question:
        "Apakah hukum memakai sabun mandi yang mengandungi pewangi kuat ketika di dalam ihram?",
    options: [
      "Harus, jika badan berbau",
      "Haram dan dikenakan dam",
      "Makruh",
      "Sunat untuk kebersihan",
    ],
    correctIndex: 1,
    explanation:
        "Menggunakan sebarang wangian sama ada pada badan, pakaian, makanan, atau sabun mandian adalah dilarang semasa ihram.",
  ),
  IhramQuizQuestion(
    question:
        "Seorang jemaah wanita memakai sarung tangan (glove) semasa tawaf dalam keadaan berihram. Apakah hukum perbuatannya?",
    options: [
      "Sah, kerana menutup aurat",
      "Haram dan melanggar larangan ihram",
      "Makruh",
      "Bergantung kepada cuaca",
    ],
    correctIndex: 1,
    explanation:
        "Khusus untuk wanita, larangan ihram bagi mereka adalah menutup muka (purdah/niqab) dan memakai sarung tangan.",
  ),
  IhramQuizQuestion(
    question:
        "Apakah tindakan yang perlu dilakukan jika jemaah secara TIDAK SENGAJA memotong kuku (terlupa sedang berihram)?",
    options: [
      "Tidak berdosa dan tidak wajib dam",
      "Berdosa besar",
      "Wajib membayar dam",
      "Batal hajinya",
    ],
    correctIndex: 0,
    explanation:
        "Jika terlupa (tidak sengaja) atau tidak tahu hukum, ia dimaafkan dan tidak diwajibkan dam. Namun mesti berhenti sebaik sahaja teringat.",
  ),
  IhramQuizQuestion(
    question: "Berikut adalah perkara yang DIBENARKAN ketika ihram, KECUALI...",
    options: [
      "Membunuh semut yang menggigit",
      "Memakai cermin mata hitam",
      "Menyikat rambut sehingga luruh",
      "Mandi menggunakan air biasa",
    ],
    correctIndex: 2,
    explanation:
        "Menanggalkan rambut atau bulu di badan secara sengaja (seperti menyikat kuat hingga gugur atau mencabutnya) adalah salah satu larangan ihram.",
  ),
];

const List<IhramGameCard> gameData = [
  IhramGameCard(
    text: "Memakai minyak wangi di badan atau pakaian",
    isAllowed: false,
    explanation: "Wangian dilarang sama sekali pada badan atau pakaian ihram.",
  ),
  IhramGameCard(
    text: "Mandi menggunakan air paip biasa",
    isAllowed: true,
    explanation:
        "Mandi untuk kebersihan dibenarkan asalkan tidak menggunakan sabun yang wangi.",
  ),
  IhramGameCard(
    text: "Jemaah lelaki memakai seluar dalam atau kemeja",
    isAllowed: false,
    explanation:
        "Lelaki dilarang memakai sebarang pakaian bersarung, berjahit, atau bercantum.",
  ),
  IhramGameCard(
    text: "Memakai cermin mata atau jam tangan",
    isAllowed: true,
    explanation:
        "Cermin mata, jam tangan, dan tali pinggang tidak termasuk dalam kategori pakaian dilarang.",
  ),
  IhramGameCard(
    text: "Wanita memakai stoking kaki",
    isAllowed: true,
    explanation:
        "Wanita wajib menutup seluruh aurat termasuk kaki. Maka ia dibenarkan dan dituntut.",
  ),
  IhramGameCard(
    text: "Mencabut pokok di Tanah Haram Mekah",
    isAllowed: false,
    explanation:
        "Menebang pokok atau mencabut tumbuhan di Tanah Haram adalah larangan keras ihram.",
  ),
  IhramGameCard(
    text: "Memotong kuku tangan atau kaki",
    isAllowed: false,
    explanation:
        "Dilarang memotong kuku. Jika dilakukan secara sengaja, jemaah wajib membayar dam.",
  ),
  IhramGameCard(
    text: "Lelaki menggunakan payung untuk berteduh",
    isAllowed: true,
    explanation:
        "Payung dibenarkan asalkan ia tidak diletakkan / melekat terus pada kepala.",
  ),
  IhramGameCard(
    text: "Wanita memakai niqab (purdah)",
    isAllowed: false,
    explanation:
        "Wanita dilarang menutup wajah (muka) dan memakai sarung tangan semasa dalam ihram.",
  ),
  IhramGameCard(
    text: "Membunuh nyamuk atau kala jengking",
    isAllowed: true,
    explanation:
        "Binatang buas atau serangga yang menyakiti/membahayakan dibenarkan untuk dibunuh.",
  ),
];

// --- MAIN MENU SCREEN ---

class InteractiveIhramMenu extends StatelessWidget {
  const InteractiveIhramMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              palette.gradientStart,
              palette.gradientMiddle,
              palette.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildHeader(
                context,
                title: "Uji Kefahaman",
                subtitle: "Larangan Ihram",
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: palette.gold.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: palette.gold.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Center(
                              child: HajjIcon(
                                type: HajjIconType.ihram,
                                color: palette.gold,
                                size: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Pilih Mod Uji Kefahaman",
                            style: GoogleFonts.playfairDisplay(
                              color: colors.onSurface,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Pilih sama ada anda mahu menjawab Kuiz santai atau Latih Tubi Pantas.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: palette.mutedText,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 36),
                          _MenuOptionCard(
                            title: "Mod Kuiz",
                            subtitle:
                                "Jawab soalan aneka pilihan dengan penerangan lengkap.",
                            hajjIconType: HajjIconType.quiz,
                            accent: const Color(0xFF4B8CCB),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) => const IhramQuizScreen(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          _MenuOptionCard(
                            title: "Latih Tubi Pantas",
                            subtitle:
                                "Asingkan perbuatan dibenarkan atau larangan dengan pantas.",
                            hajjIconType: HajjIconType.rukun,
                            accent: palette.emerald,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) => const IhramGameScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    final ColorScheme colors = context.appColorScheme;
    final HajjColors palette = context.hajjColors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Row(
        children: <Widget>[
          HajjIconButton(
            tooltip: 'Kembali',
            icon: Icons.arrow_back_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(color: palette.mutedText, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _MenuOptionCard extends StatelessWidget {
  const _MenuOptionCard({
    required this.title,
    required this.subtitle,
    required this.hajjIconType,
    required this.accent,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final HajjIconType hajjIconType;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: palette.glassSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: palette.glassBorder),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: HajjIcon(type: hajjIconType, color: accent, size: 26),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: palette.mutedText,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: palette.mutedText),
            ],
          ),
        ),
      ),
    );
  }
}

// --- QUIZ MODE ---

class IhramQuizScreen extends StatefulWidget {
  const IhramQuizScreen({super.key});

  @override
  State<IhramQuizScreen> createState() => _IhramQuizScreenState();
}

class _IhramQuizScreenState extends State<IhramQuizScreen> {
  int currentIndex = 0;
  int? selectedAnswerIndex;
  bool isAnswered = false;
  int score = 0;
  bool isFinished = false;

  void _submitAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedAnswerIndex = index;
      isAnswered = true;
      if (index == quizData[currentIndex].correctIndex) {
        score += 20;
      }
    });
  }

  void _nextQuestion() {
    if (currentIndex < quizData.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswerIndex = null;
        isAnswered = false;
      });
    } else {
      setState(() {
        isFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              palette.gradientStart,
              palette.gradientMiddle,
              palette.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: isFinished
              ? _buildResult(context)
              : _buildQuizContent(context),
        ),
      ),
    );
  }

  Widget _buildQuizContent(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final IhramQuizQuestion question = quizData[currentIndex];

    return Column(
      children: <Widget>[
        _buildHeader(context, "${currentIndex + 1} / ${quizData.length}"),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LinearProgressIndicator(
                      value: (currentIndex + 1) / quizData.length,
                      backgroundColor: palette.softSurface,
                      color: const Color(0xFF4B8CCB),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: palette.glassSurface,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: palette.glassBorder),
                      ),
                      child: Text(
                        question.question,
                        style: GoogleFonts.playfairDisplay(
                          color: colors.onSurface,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...List<Widget>.generate(question.options.length, (
                      int index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _QuizOptionTile(
                          text: question.options[index],
                          label: String.fromCharCode(65 + index),
                          isSelected: selectedAnswerIndex == index,
                          isCorrect: index == question.correctIndex,
                          showResult: isAnswered,
                          onTap: () => _submitAnswer(index),
                        ),
                      );
                    }),
                    if (isAnswered) ...<Widget>[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              (selectedAnswerIndex == question.correctIndex
                                      ? palette.emerald
                                      : palette.gold)
                                  .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                (selectedAnswerIndex == question.correctIndex
                                        ? palette.emerald
                                        : palette.gold)
                                    .withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  selectedAnswerIndex == question.correctIndex
                                      ? Icons.check_circle_rounded
                                      : Icons.info_outline_rounded,
                                  color:
                                      selectedAnswerIndex ==
                                          question.correctIndex
                                      ? palette.emerald
                                      : palette.gold,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  selectedAnswerIndex == question.correctIndex
                                      ? "Tepat!"
                                      : "Penerangan",
                                  style: TextStyle(
                                    color:
                                        selectedAnswerIndex ==
                                            question.correctIndex
                                        ? palette.emerald
                                        : palette.gold,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              question.explanation,
                              style: TextStyle(
                                color: colors.onSurface,
                                height: 1.5,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF4B8CCB),
                          minimumSize: const Size(double.infinity, 56),
                        ),
                        onPressed: _nextQuestion,
                        child: Text(
                          currentIndex == quizData.length - 1
                              ? "Selesai"
                              : "Seterusnya",
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResult(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.workspace_premium_rounded,
                size: 80,
                color: palette.gold,
              ),
              const SizedBox(height: 24),
              Text(
                "Kuiz Tamat",
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Alhamdulillah, anda telah menyelesaikan kuiz ini.",
                style: TextStyle(color: palette.mutedText),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 40,
                ),
                decoration: BoxDecoration(
                  color: palette.glassSurface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: palette.glassBorder),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "MARKAH ANDA",
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$score%",
                      style: TextStyle(
                        color: const Color(0xFF4B8CCB),
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 56),
                      ),
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                          score = 0;
                          isFinished = false;
                          isAnswered = false;
                          selectedAnswerIndex = null;
                        });
                      },
                      child: const Text("Ulang"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 56),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Kembali"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String progress) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          HajjIconButton(
            tooltip: 'Kembali',
            icon: Icons.arrow_back_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: context.hajjColors.glassSurface,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: context.hajjColors.glassBorder),
            ),
            child: Text(
              "Soalan $progress",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: context.appColorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _QuizOptionTile extends StatelessWidget {
  const _QuizOptionTile({
    required this.text,
    required this.label,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  final String text;
  final String label;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    Color bgColor = palette.glassSurface;
    Color borderColor = palette.glassBorder;
    Color textColor = colors.onSurface;
    IconData? icon;

    if (showResult) {
      if (isCorrect) {
        bgColor = palette.emerald.withValues(alpha: 0.15);
        borderColor = palette.emerald;
        textColor = palette.emerald;
        icon = Icons.check_circle_rounded;
      } else if (isSelected && !isCorrect) {
        bgColor = palette.danger.withValues(alpha: 0.1);
        borderColor = palette.danger.withValues(alpha: 0.5);
        textColor = palette.danger;
        icon = Icons.cancel_rounded;
      } else {
        textColor = palette.mutedText.withValues(alpha: 0.5);
      }
    } else if (isSelected) {
      bgColor = const Color(0xFF4B8CCB).withValues(alpha: 0.1);
      borderColor = const Color(0xFF4B8CCB);
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: showResult ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: isSelected || (showResult && isCorrect) ? 2 : 1,
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: showResult && isCorrect
                      ? palette.emerald
                      : palette.softSurface,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: showResult && isCorrect
                          ? palette.onAccent
                          : colors.onSurface,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
              if (icon != null) Icon(icon, color: textColor),
            ],
          ),
        ),
      ),
    );
  }
}

// --- GAME MODE (LATIH TUBI PANTAS) ---

class IhramGameScreen extends StatefulWidget {
  const IhramGameScreen({super.key});

  @override
  State<IhramGameScreen> createState() => _IhramGameScreenState();
}

class _IhramGameScreenState extends State<IhramGameScreen>
    with SingleTickerProviderStateMixin {
  late List<IhramGameCard> deck;
  int currentIndex = 0;
  int lives = 3;
  int score = 0;
  bool showFeedback = false;
  bool isGameOver = false;
  bool isWin = false;

  late AnimationController _animController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initGame();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(_animController);
  }

  void _initGame() {
    deck = List<IhramGameCard>.from(gameData)..shuffle();
    currentIndex = 0;
    lives = 3;
    score = 0;
    showFeedback = false;
    isGameOver = false;
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _handleAnswer(bool userSelectedAllowed) async {
    if (showFeedback || isGameOver) return;

    final IhramGameCard card = deck[currentIndex];
    final bool isCorrect = userSelectedAllowed == card.isAllowed;

    setState(() {
      _slideAnimation =
          Tween<Offset>(
            begin: Offset.zero,
            end: Offset(userSelectedAllowed ? 1.5 : -1.5, 0),
          ).animate(
            CurvedAnimation(parent: _animController, curve: Curves.easeOut),
          );
    });

    await _animController.forward();

    if (isCorrect) {
      setState(() {
        score += 10;
        _advanceCard();
      });
    } else {
      setState(() {
        lives--;
        showFeedback = true;
        if (lives <= 0) {
          isGameOver = true;
          isWin = false;
        }
      });
    }
  }

  void _advanceCard() {
    _animController.reset();
    showFeedback = false;

    if (currentIndex < deck.length - 1) {
      currentIndex++;
    } else {
      isGameOver = true;
      isWin = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              palette.gradientStart,
              palette.gradientMiddle,
              palette.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: isGameOver ? _buildResult(context) : _buildGameArea(context),
        ),
      ),
    );
  }

  Widget _buildGameArea(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Column(
      children: <Widget>[
        _buildHeader(context),
        const SizedBox(height: 20),

        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  if (currentIndex < deck.length - 2)
                    Transform.translate(
                      offset: const Offset(0, 24),
                      child: Transform.scale(
                        scale: 0.85,
                        child: _buildStaticCard(palette),
                      ),
                    ),
                  if (currentIndex < deck.length - 1)
                    Transform.translate(
                      offset: const Offset(0, 12),
                      child: Transform.scale(
                        scale: 0.92,
                        child: _buildStaticCard(palette),
                      ),
                    ),

                  if (!showFeedback)
                    SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        width: double.infinity,
                        height: 280,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: palette.glassSurface,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: palette.glassBorder),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: palette.shadow,
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            deck[currentIndex].text,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              color: colors.onSurface,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ),
                    ),

                  if (showFeedback && !isGameOver)
                    Container(
                      width: double.infinity,
                      height: 280,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: palette.danger.withValues(alpha: 0.5),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.heart_broken_rounded,
                            color: palette.danger,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Tersilap!",
                            style: TextStyle(
                              color: palette.danger,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            deck[currentIndex].explanation,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.onSurface,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: palette.danger,
                            ),
                            onPressed: () {
                              setState(() {
                                _advanceCard();
                              });
                            },
                            child: const Text("Teruskan"),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _ActionButton(
                    title: "DIBENARKAN",
                    icon: Icons.check_rounded,
                    color: palette.emerald,
                    onTap: () => _handleAnswer(true),
                    disabled: showFeedback,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _ActionButton(
                    title: "LARANGAN",
                    icon: Icons.close_rounded,
                    color: palette.danger,
                    onTap: () => _handleAnswer(false),
                    disabled: showFeedback,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStaticCard(HajjColors palette) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        color: palette.softSurface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: palette.glassBorder),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          HajjIconButton(
            tooltip: 'Kembali',
            icon: Icons.arrow_back_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: List<Widget>.generate(
              3,
              (int index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  index < lives
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: palette.danger,
                  size: 28,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: palette.gold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: palette.gold.withValues(alpha: 0.3)),
            ),
            child: Text(
              "Skor: $score",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: palette.gold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                isWin
                    ? Icons.emoji_events_rounded
                    : Icons.sentiment_dissatisfied_rounded,
                size: 80,
                color: isWin ? palette.emerald : palette.danger,
              ),
              const SizedBox(height: 24),
              Text(
                isWin ? "Tahniah!" : "Cuba Lagi",
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isWin
                    ? "Anda berjaya membezakan larangan ihram dengan cemerlang."
                    : "Kehabisan nyawa. Ulangkaji semula dan cuba lagi.",
                textAlign: TextAlign.center,
                style: TextStyle(color: palette.mutedText),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                decoration: BoxDecoration(
                  color: palette.glassSurface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: palette.glassBorder),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "SKOR AKHIR",
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$score",
                      style: TextStyle(
                        color: palette.gold,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 56),
                      ),
                      onPressed: () {
                        setState(() {
                          _initGame();
                        });
                      },
                      child: const Text("Main Semula"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 56),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Kembali"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.disabled,
  });

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: disabled ? null : onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
