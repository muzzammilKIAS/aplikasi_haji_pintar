// Modul kuiz & "latih tubi pantas" interaktif — versi generik.
//
// Fail ini mengikut corak reka bentuk yang sama seperti
// `interactive_ihram_module.dart` (menu → mod kuiz → mod latih tubi →
// keputusan), tetapi dibina supaya boleh diguna semula untuk pelbagai
// topik pembelajaran (Asas Haji, Rukun & Wajib, Dam, Doa & Zikir) tanpa
// perlu menyalin seluruh kod bagi setiap topik. Data soalan/kad untuk
// setiap topik diletakkan di bahagian bawah fail ini sebagai senarai
// `const` berasingan.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'islamic_icons.dart';
import 'shared_widgets.dart';

// --- DATA MODELS (generik, digunakan oleh semua topik) ---

class LearningQuizQuestion {
  const LearningQuizQuestion({
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

/// Kad untuk mod "latih tubi pantas". `isCategoryA` menentukan kad ini
/// tergolong dalam kategori kiri (contoh: BENAR / RUKUN / PERLU DAM) atau
/// kategori kanan (contoh: SALAH / WAJIB / TIDAK PERLU DAM), bergantung
/// kepada label yang ditetapkan pada `LearningGameScreen`.
class LearningGameCard {
  const LearningGameCard({
    required this.text,
    required this.isCategoryA,
    required this.explanation,
  });

  final String text;
  final bool isCategoryA;
  final String explanation;
}

// --- MENU UTAMA (generik) ---

class InteractiveLearningMenu extends StatelessWidget {
  const InteractiveLearningMenu({
    required this.topicTitle,
    required this.topicIcon,
    required this.accent,
    required this.quizData,
    required this.gameData,
    required this.categoryALabel,
    required this.categoryBLabel,
    this.categoryAIcon = Icons.check_rounded,
    this.categoryBIcon = Icons.close_rounded,
    super.key,
  });

  final String topicTitle;
  final HajjIconType topicIcon;
  final Color accent;
  final List<LearningQuizQuestion> quizData;
  final List<LearningGameCard> gameData;
  final String categoryALabel;
  final String categoryBLabel;
  final IconData categoryAIcon;
  final IconData categoryBIcon;

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
              _buildHeader(context, subtitle: topicTitle),
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
                              color: accent.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: accent.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Center(
                              child: HajjIcon(
                                type: topicIcon,
                                color: accent,
                                size: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Pilih Mod Uji Kefahaman',
                            style: GoogleFonts.playfairDisplay(
                              color: colors.onSurface,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Pilih sama ada anda mahu menjawab Kuiz santai '
                            'atau Latih Tubi Pantas.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: palette.mutedText,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 36),
                          _MenuOptionCard(
                            title: 'Mod Kuiz',
                            subtitle:
                                'Jawab soalan aneka pilihan dengan penerangan lengkap.',
                            hajjIconType: HajjIconType.quiz,
                            accent: const Color(0xFF4B8CCB),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) =>
                                      LearningQuizScreen(quizData: quizData),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          _MenuOptionCard(
                            title: 'Latih Tubi Pantas',
                            subtitle:
                                'Asingkan $categoryALabel atau $categoryBLabel dengan pantas.',
                            hajjIconType: HajjIconType.rukun,
                            accent: palette.emerald,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) => LearningGameScreen(
                                    gameData: gameData,
                                    categoryALabel: categoryALabel,
                                    categoryBLabel: categoryBLabel,
                                    categoryAIcon: categoryAIcon,
                                    categoryBIcon: categoryBIcon,
                                  ),
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

  Widget _buildHeader(BuildContext context, {required String subtitle}) {
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
                  'UJI KEFAHAMAN',
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

// --- MOD KUIZ (generik) ---

class LearningQuizScreen extends StatefulWidget {
  const LearningQuizScreen({required this.quizData, super.key});

  final List<LearningQuizQuestion> quizData;

  @override
  State<LearningQuizScreen> createState() => _LearningQuizScreenState();
}

class _LearningQuizScreenState extends State<LearningQuizScreen> {
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
      if (index == widget.quizData[currentIndex].correctIndex) {
        score += (100 / widget.quizData.length).round();
      }
    });
  }

  void _nextQuestion() {
    if (currentIndex < widget.quizData.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswerIndex = null;
        isAnswered = false;
      });
    } else {
      setState(() {
        isFinished = true;
        if (score > 100) score = 100;
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
    final LearningQuizQuestion question = widget.quizData[currentIndex];

    return Column(
      children: <Widget>[
        _buildHeader(
          context,
          '${currentIndex + 1} / ${widget.quizData.length}',
        ),
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
                      value: (currentIndex + 1) / widget.quizData.length,
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
                                      ? 'Tepat!'
                                      : 'Penerangan',
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
                          currentIndex == widget.quizData.length - 1
                              ? 'Selesai'
                              : 'Seterusnya',
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
                'Kuiz Tamat',
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Alhamdulillah, anda telah menyelesaikan kuiz ini.',
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
                      'MARKAH ANDA',
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$score%',
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
                      child: const Text('Ulang'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 56),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Kembali'),
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
              'Soalan $progress',
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

// --- MOD LATIH TUBI PANTAS (generik) ---

class LearningGameScreen extends StatefulWidget {
  const LearningGameScreen({
    required this.gameData,
    required this.categoryALabel,
    required this.categoryBLabel,
    this.categoryAIcon = Icons.check_rounded,
    this.categoryBIcon = Icons.close_rounded,
    super.key,
  });

  final List<LearningGameCard> gameData;
  final String categoryALabel;
  final String categoryBLabel;
  final IconData categoryAIcon;
  final IconData categoryBIcon;

  @override
  State<LearningGameScreen> createState() => _LearningGameScreenState();
}

class _LearningGameScreenState extends State<LearningGameScreen>
    with SingleTickerProviderStateMixin {
  late List<LearningGameCard> deck;
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
    deck = List<LearningGameCard>.from(widget.gameData)..shuffle();
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

  Future<void> _handleAnswer(bool userSelectedCategoryA) async {
    if (showFeedback || isGameOver) return;

    final LearningGameCard card = deck[currentIndex];
    final bool isCorrect = userSelectedCategoryA == card.isCategoryA;

    setState(() {
      _slideAnimation =
          Tween<Offset>(
            begin: Offset.zero,
            end: Offset(userSelectedCategoryA ? 1.5 : -1.5, 0),
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
                              fontSize: 22,
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
                            'Tersilap!',
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
                            child: const Text('Teruskan'),
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
                    title: widget.categoryALabel,
                    icon: widget.categoryAIcon,
                    color: palette.emerald,
                    onTap: () => _handleAnswer(true),
                    disabled: showFeedback,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _ActionButton(
                    title: widget.categoryBLabel,
                    icon: widget.categoryBIcon,
                    color: palette.gold,
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
              'Skor: $score',
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
                isWin ? 'Tahniah!' : 'Cuba Lagi',
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isWin
                    ? 'Anda berjaya menjawab dengan cemerlang.'
                    : 'Kehabisan nyawa. Ulang kaji semula dan cuba lagi.',
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
                      'SKOR AKHIR',
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$score',
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
                      child: const Text('Main Semula'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 56),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Kembali'),
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
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================================
// DATA TOPIK 1: ASAS HAJI
// =====================================================================

const List<LearningQuizQuestion> asasHajiQuizData = <LearningQuizQuestion>[
  LearningQuizQuestion(
    question: 'Apakah maksud Haji dari segi istilah syarak?',
    options: <String>[
      'Melawat sebarang tempat suci bila-bila masa',
      'Mengunjungi Baitullah pada waktu tertentu untuk melaksanakan ibadah tertentu',
      'Berpuasa sepanjang bulan Zulhijjah',
      'Menghantar wakil untuk beribadah di Makkah',
    ],
    correctIndex: 1,
    explanation:
        'Haji ialah mengunjungi Baitullah al-Haram pada masa tertentu untuk melaksanakan ibadah tertentu mengikut tatacara yang ditetapkan syarak.',
  ),
  LearningQuizQuestion(
    question: 'Antara berikut, yang manakah BUKAN syarat wajib Haji?',
    options: <String>[
      'Islam',
      'Baligh dan berakal',
      'Bujang (belum berkahwin)',
      'Berkemampuan (istita\u2019ah)',
    ],
    correctIndex: 2,
    explanation:
        'Status bujang atau berkahwin bukan syarat wajib Haji. Syarat wajib ialah Islam, baligh, berakal, merdeka dan berkemampuan.',
  ),
  LearningQuizQuestion(
    question: 'Apakah maksud "istita\u2019ah" dalam konteks syarat wajib Haji?',
    options: <String>[
      'Kemampuan dari sudut kewangan, kesihatan dan keselamatan perjalanan',
      'Kelulusan kursus Haji sahaja',
      'Umur melebihi 40 tahun',
      'Memiliki pasport antarabangsa',
    ],
    correctIndex: 0,
    explanation:
        'Istita\u2019ah merangkumi kemampuan kewangan, kesihatan fizikal, dan keselamatan sepanjang perjalanan Haji.',
  ),
  LearningQuizQuestion(
    question:
        'Susunan manakah yang PALING TEPAT menggambarkan perjalanan umum ibadah Haji?',
    options: <String>[
      'Tawaf \u2192 Miqat \u2192 Arafah \u2192 Mina',
      'Miqat \u2192 Arafah \u2192 Muzdalifah \u2192 Mina',
      'Mina \u2192 Miqat \u2192 Tawaf \u2192 Arafah',
      'Arafah \u2192 Miqat \u2192 Mina \u2192 Tawaf',
    ],
    correctIndex: 1,
    explanation:
        'Susunan umum: berihram di Miqat, Wukuf di Arafah, bermalam di Muzdalifah, kemudian ke Mina untuk melontar dan seterusnya.',
  ),
  LearningQuizQuestion(
    question: 'Wukuf di Arafah dianggap sebagai...?',
    options: <String>[
      'Sunat Haji',
      'Rukun paling utama Haji',
      'Wajib yang boleh diganti dengan dam',
      'Adat tempatan sahaja',
    ],
    correctIndex: 1,
    explanation:
        'Rasulullah SAW bersabda maksudnya "Haji itu adalah Arafah", menunjukkan Wukuf di Arafah ialah rukun paling utama.',
  ),
];

const List<LearningGameCard> asasHajiGameData = <LearningGameCard>[
  LearningGameCard(
    text: 'Haji hanya wajib sekali seumur hidup bagi yang mampu.',
    isCategoryA: true,
    explanation:
        'Haji wajib sekali seumur hidup; pelaksanaan seterusnya adalah sunat.',
  ),
  LearningGameCard(
    text: 'Kanak-kanak yang belum baligh wajib menunaikan Haji.',
    isCategoryA: false,
    explanation:
        'Baligh adalah salah satu syarat wajib Haji; kanak-kanak tidak diwajibkan, walaupun sah jika dilaksanakan.',
  ),
  LearningGameCard(
    text: 'Wukuf di Arafah adalah rukun Haji yang paling utama.',
    isCategoryA: true,
    explanation:
        'Wukuf di Arafah ialah rukun paling utama, tanpanya Haji tidak sah.',
  ),
  LearningGameCard(
    text: 'Umrah dan Haji adalah ibadah yang sama dari segi rukun dan waktu.',
    isCategoryA: false,
    explanation:
        'Umrah boleh dilakukan bila-bila masa dan rukunnya berbeza; Haji terikat dengan waktu tertentu (bulan Haji).',
  ),
  LearningGameCard(
    text:
        'Kemampuan kewangan yang mencukupi adalah sebahagian daripada syarat istita\u2019ah.',
    isCategoryA: true,
    explanation:
        'Istita\u2019ah merangkumi kemampuan kewangan, kesihatan dan keselamatan perjalanan.',
  ),
  LearningGameCard(
    text:
        'Seseorang yang tidak berkemampuan dari segi kesihatan tetap wajib memaksa diri menunaikan Haji.',
    isCategoryA: false,
    explanation:
        'Jika tiada kemampuan kesihatan, kewajipan Haji gugur atau boleh dirujuk kepada hukum badal Haji.',
  ),
  LearningGameCard(
    text: 'Miqat ialah tempat atau waktu yang ditetapkan untuk berniat ihram.',
    isCategoryA: true,
    explanation:
        'Miqat menentukan lokasi/waktu jemaah wajib berniat ihram sebelum memasuki kawasan tertentu.',
  ),
  LearningGameCard(
    text: 'Tawaf Ifadah adalah salah satu daripada rukun Haji.',
    isCategoryA: true,
    explanation: 'Tawaf Ifadah ialah salah satu daripada rukun Haji.',
  ),
];

// =====================================================================
// DATA TOPIK 2: RUKUN & WAJIB HAJI
// =====================================================================

const List<LearningQuizQuestion> rukunWajibQuizData = <LearningQuizQuestion>[
  LearningQuizQuestion(
    question:
        'Apakah perbezaan utama antara Rukun dan Wajib Haji jika ditinggalkan?',
    options: <String>[
      'Kedua-duanya boleh diganti dengan dam',
      'Rukun yang ditinggal menyebabkan Haji tidak sah sehingga dilaksanakan, manakala Wajib boleh diganti dengan dam',
      'Wajib yang ditinggal membatalkan Haji terus',
      'Tiada perbezaan antara kedua-duanya',
    ],
    correctIndex: 1,
    explanation:
        'Rukun yang ditinggalkan menyebabkan Haji tidak sempurna sehingga rukun itu dilaksanakan. Wajib yang ditinggal boleh diganti dengan dam.',
  ),
  LearningQuizQuestion(
    question: 'Manakah antara berikut adalah RUKUN Haji?',
    options: <String>[
      'Bermalam di Muzdalifah',
      'Melontar Jamrah Kubra',
      'Sa\u2019i antara Safa dan Marwah',
      'Tawaf Wada\u2019',
    ],
    correctIndex: 2,
    explanation:
        'Sa\u2019i antara Safa dan Marwah adalah salah satu rukun Haji.',
  ),
  LearningQuizQuestion(
    question: 'Manakah antara berikut adalah WAJIB Haji (bukan rukun)?',
    options: <String>[
      'Niat ihram Haji',
      'Wukuf di Arafah',
      'Bermalam di Mina',
      'Tawaf Ifadah',
    ],
    correctIndex: 2,
    explanation: 'Bermalam di Mina adalah salah satu Wajib Haji.',
  ),
  LearningQuizQuestion(
    question:
        'Jika seseorang meninggalkan salah satu Wajib Haji tanpa uzur, apakah tindakan yang perlu diambil?',
    options: <String>[
      'Hajinya batal terus',
      'Tiada apa-apa tindakan diperlukan',
      'Perlu membayar dam mengikut hukum berkaitan',
      'Perlu mengulang seluruh ibadah Haji',
    ],
    correctIndex: 2,
    explanation:
        'Wajib Haji yang ditinggalkan boleh menyebabkan kewajipan dam, tertakluk kepada keadaan dan hukum.',
  ),
  LearningQuizQuestion(
    question: '"Tertib" sebagai salah satu rukun Haji bermaksud...?',
    options: <String>[
      'Melakukan rukun mengikut turutan yang betul',
      'Membayar semua kos Haji terlebih dahulu',
      'Mendaftar lebih awal sebelum musim Haji',
      'Berkumpul dalam kumpulan yang sama',
    ],
    correctIndex: 0,
    explanation:
        'Tertib bermaksud melaksanakan kebanyakan rukun Haji mengikut turutan yang betul.',
  ),
];

const List<LearningGameCard> rukunWajibGameData = <LearningGameCard>[
  LearningGameCard(
    text: 'Niat ihram Haji',
    isCategoryA: true,
    explanation: 'Niat ihram Haji ialah salah satu rukun Haji.',
  ),
  LearningGameCard(
    text: 'Bermalam di Muzdalifah',
    isCategoryA: false,
    explanation: 'Bermalam di Muzdalifah ialah salah satu Wajib Haji.',
  ),
  LearningGameCard(
    text: 'Wukuf di Arafah',
    isCategoryA: true,
    explanation: 'Wukuf di Arafah ialah rukun Haji yang paling utama.',
  ),
  LearningGameCard(
    text: 'Melontar Jamrah Kubra',
    isCategoryA: false,
    explanation: 'Melontar Jamrah Kubra ialah salah satu Wajib Haji.',
  ),
  LearningGameCard(
    text: 'Tawaf Ifadah',
    isCategoryA: true,
    explanation: 'Tawaf Ifadah ialah salah satu daripada rukun Haji.',
  ),
  LearningGameCard(
    text: 'Bermalam di Mina',
    isCategoryA: false,
    explanation: 'Bermalam di Mina ialah salah satu Wajib Haji.',
  ),
  LearningGameCard(
    text: 'Sa\u2019i antara Safa dan Marwah',
    isCategoryA: true,
    explanation:
        'Sa\u2019i antara Safa dan Marwah ialah salah satu rukun Haji.',
  ),
  LearningGameCard(
    text: 'Tawaf Wada\u2019',
    isCategoryA: false,
    explanation: 'Tawaf Wada\u2019 ialah salah satu Wajib Haji.',
  ),
];

// =====================================================================
// DATA TOPIK 3: PENGENALAN DAM
// =====================================================================

const List<LearningQuizQuestion> damQuizData = <LearningQuizQuestion>[
  LearningQuizQuestion(
    question: 'Apakah maksud "dam" dalam konteks ibadah Haji?',
    options: <String>[
      'Bayaran atau sembelihan tertentu yang dikenakan dalam keadaan tertentu',
      'Sejenis pakaian ihram',
      'Nama lain bagi Tawaf Wada\u2019',
      'Denda kewangan tetap yang sama bagi semua kesalahan',
    ],
    correctIndex: 0,
    explanation:
        'Dam ialah bayaran atau sembelihan tertentu yang dikenakan dalam keadaan tertentu ketika Haji atau Umrah.',
  ),
  LearningQuizQuestion(
    question: 'Antara berikut, yang manakah BOLEH menjadi sebab dikenakan dam?',
    options: <String>[
      'Melaksanakan semua rukun mengikut tertib',
      'Meninggalkan salah satu Wajib Haji',
      'Membaca Al-Quran semasa ihram',
      'Berdoa selepas solat',
    ],
    correctIndex: 1,
    explanation:
        'Meninggalkan Wajib Haji adalah salah satu sebab umum dikenakan dam.',
  ),
  LearningQuizQuestion(
    question:
        'Apakah tindakan yang WAJAR diambil oleh jemaah jika keliru sama ada perlu membayar dam?',
    options: <String>[
      'Menentukan sendiri berdasarkan andaian',
      'Mengabaikan sahaja perkara tersebut',
      'Rujuk pembimbing Haji atau pegawai bertauliah',
      'Menunggu sehingga pulang ke tanah air',
    ],
    correctIndex: 2,
    explanation:
        'Jangan menentukan dam sendiri hanya berdasarkan andaian. Catat perkara yang berlaku dan rujuk pembimbing Haji.',
  ),
  LearningQuizQuestion(
    question:
        'Melakukan Haji Tamattu\u2019 atau Qiran boleh dikaitkan dengan...?',
    options: <String>[
      'Kewajipan membayar dam dalam keadaan tertentu',
      'Pengecualian automatik daripada semua rukun',
      'Larangan menunaikan Haji pada tahun berikutnya',
      'Kewajipan mengulang niat ihram setiap hari',
    ],
    correctIndex: 0,
    explanation:
        'Haji Tamattu\u2019 atau Qiran dalam keadaan tertentu boleh mewajibkan dam ke atas jemaah.',
  ),
  LearningQuizQuestion(
    question: 'Sikap manakah yang PALING SESUAI berkaitan isu dam?',
    options: <String>[
      'Catat kejadian dan rujuk pihak berautoriti untuk kepastian hukum',
      'Elakkan bertanya kerana ia perkara peribadi',
      'Anggap semua kesilapan tidak memerlukan dam',
      'Anggap semua kesilapan mesti dikenakan dam berat',
    ],
    correctIndex: 0,
    explanation:
        'Catat perkara yang berlaku dan rujuk pembimbing Haji atau pegawai bertauliah bagi kepastian hukum.',
  ),
];

const List<LearningGameCard> damGameData = <LearningGameCard>[
  LearningGameCard(
    text: 'Sengaja meninggalkan bermalam di Muzdalifah tanpa uzur',
    isCategoryA: true,
    explanation:
        'Meninggalkan Wajib Haji seperti ini tanpa uzur boleh mewajibkan dam.',
  ),
  LearningGameCard(
    text: 'Terlupa dan tidak sengaja memotong kuku ketika ihram',
    isCategoryA: false,
    explanation:
        'Jika terlupa atau tidak sengaja, ia dimaafkan dan tidak diwajibkan dam — tetapi mesti berhenti sebaik teringat.',
  ),
  LearningGameCard(
    text:
        'Melaksanakan Haji Tamattu\u2019 tanpa menyembelih atau berpuasa ganti',
    isCategoryA: true,
    explanation:
        'Haji Tamattu\u2019 mewajibkan dam, iaitu sembelihan atau puasa ganti jika tidak mampu.',
  ),
  LearningGameCard(
    text: 'Melontar jamrah mengikut jadual yang ditetapkan',
    isCategoryA: false,
    explanation:
        'Melaksanakan Wajib Haji mengikut ketetapan tidak memerlukan dam.',
  ),
  LearningGameCard(
    text: 'Meninggalkan Tawaf Wada\u2019 tanpa uzur syarie ketika diwajibkan',
    isCategoryA: true,
    explanation:
        'Meninggalkan Tawaf Wada\u2019 tanpa uzur ketika diwajibkan boleh mengenakan dam.',
  ),
  LearningGameCard(
    text: 'Menjaga semua larangan ihram sepanjang ibadah',
    isCategoryA: false,
    explanation: 'Menjaga larangan ihram dengan sempurna tidak mengenakan dam.',
  ),
  LearningGameCard(
    text: 'Tidak melontar walaupun satu daripada tiga jamrah tanpa uzur',
    isCategoryA: true,
    explanation:
        'Meninggalkan mana-mana bahagian Wajib Haji tanpa uzur boleh mengenakan dam.',
  ),
  LearningGameCard(
    text: 'Berihram dari Miqat yang betul mengikut jadual',
    isCategoryA: false,
    explanation: 'Berniat ihram di Miqat yang betul tidak mengenakan dam.',
  ),
];

// =====================================================================
// DATA TOPIK 4: DOA & ZIKIR
// =====================================================================

const List<LearningQuizQuestion> doaZikirQuizData = <LearningQuizQuestion>[
  LearningQuizQuestion(
    question: 'Bilakah masa yang digalakkan untuk memperbanyakkan talbiyah?',
    options: <String>[
      'Hanya semasa Tawaf sahaja',
      'Selepas berniat ihram sehingga tiba waktu yang berkaitan dengan ibadah',
      'Hanya pada waktu malam',
      'Selepas Tawaf Wada\u2019 sahaja',
    ],
    correctIndex: 1,
    explanation:
        'Talbiyah digalakkan diperbanyakkan selepas berniat ihram sehingga tiba waktu yang berkaitan.',
  ),
  LearningQuizQuestion(
    question: 'Apakah adab yang dianjurkan ketika berdoa semasa ibadah Haji?',
    options: <String>[
      'Berdoa dalam bahasa yang difahami dengan penuh khusyuk',
      'Menghafal doa tanpa memahami maksudnya',
      'Berdoa dengan tergesa-gesa supaya cepat selesai',
      'Berdoa hanya menggunakan bahasa Arab walaupun tidak faham',
    ],
    correctIndex: 0,
    explanation:
        'Berdoa menggunakan bahasa yang difahami dengan penuh khusyuk lebih menghayati maksud doa.',
  ),
  LearningQuizQuestion(
    question:
        'Antara berikut manakah amalan zikir yang digalakkan diperbanyakkan sepanjang Haji?',
    options: <String>[
      'Istighfar, selawat, tasbih, tahmid dan takbir',
      'Berbual perkara duniawi semata-mata',
      'Berdiam diri tanpa berzikir langsung',
      'Zikir hanya pada hari terakhir sahaja',
    ],
    correctIndex: 0,
    explanation:
        'Jemaah digalakkan memperbanyakkan istighfar, selawat, tasbih, tahmid dan takbir sepanjang Haji.',
  ),
  LearningQuizQuestion(
    question: 'Apakah maksud umum doa "Rabbana atina fid dunya hasanah..."?',
    options: <String>[
      'Memohon kebaikan dunia dan akhirat serta perlindungan daripada azab neraka',
      'Memohon kekayaan semata-mata',
      'Memohon supaya cepat pulang ke tanah air',
      'Memohon supaya cuaca sentiasa baik',
    ],
    correctIndex: 0,
    explanation:
        'Doa ini bermaksud memohon kebaikan dunia dan akhirat serta perlindungan daripada azab neraka.',
  ),
  LearningQuizQuestion(
    question:
        'Apakah sikap yang PALING SESUAI diamalkan berkaitan doa dan zikir sepanjang Haji?',
    options: <String>[
      'Utamakan keikhlasan dan kefahaman berbanding sekadar menghafal',
      'Berdoa sekali sahaja sepanjang perjalanan',
      'Berzikir hanya jika ada masa lapang',
      'Doa tidak penting berbanding rukun fizikal',
    ],
    correctIndex: 0,
    explanation:
        'Utamakan keikhlasan dan kefahaman berbanding menghafal tanpa menghayati.',
  ),
];

const List<LearningGameCard> doaZikirGameData = <LearningGameCard>[
  LearningGameCard(
    text: 'Berdoa dengan penuh khusyuk dan memahami maksudnya',
    isCategoryA: true,
    explanation: 'Ini adalah adab doa yang digalakkan.',
  ),
  LearningGameCard(
    text: 'Tergesa-gesa berdoa semata-mata untuk menghabiskan senarai doa',
    isCategoryA: false,
    explanation: 'Doa yang tergesa-gesa tanpa penghayatan tidak digalakkan.',
  ),
  LearningGameCard(
    text: 'Memperbanyakkan istighfar dan selawat sepanjang perjalanan',
    isCategoryA: true,
    explanation: 'Ini adalah amalan zikir yang sangat digalakkan.',
  ),
  LearningGameCard(
    text: 'Berdoa hanya dalam bahasa Arab walaupun tidak faham maksudnya',
    isCategoryA: false,
    explanation:
        'Doa digalakkan menggunakan bahasa yang difahami supaya lebih menghayati maksudnya, walaupun doa dalam bahasa Arab tetap sah.',
  ),
  LearningGameCard(
    text: 'Membaca talbiyah selepas berniat ihram',
    isCategoryA: true,
    explanation: 'Talbiyah digalakkan diperbanyakkan selepas berniat ihram.',
  ),
  LearningGameCard(
    text: 'Mengabaikan zikir kerana sibuk berbual perkara duniawi',
    isCategoryA: false,
    explanation: 'Mengabaikan zikir kerana berbual duniawi tidak digalakkan.',
  ),
  LearningGameCard(
    text: 'Berdoa dengan rendah diri dan penuh pengharapan kepada Allah',
    isCategoryA: true,
    explanation: 'Ini adalah adab berdoa yang dianjurkan.',
  ),
  LearningGameCard(
    text: 'Menghafal doa tanpa langsung memahami maksudnya',
    isCategoryA: false,
    explanation:
        'Utamakan keikhlasan dan kefahaman berbanding menghafal tanpa menghayati.',
  ),
];
