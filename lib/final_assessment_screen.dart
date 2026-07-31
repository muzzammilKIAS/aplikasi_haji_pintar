import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'certificate_screen.dart';
import 'islamic_icons.dart';

class FinalAssessmentScreen extends StatefulWidget {
  const FinalAssessmentScreen({
    required this.assessmentBox,
    required this.certificatesBox,
    super.key,
  });

  final Box<dynamic> assessmentBox;
  final Box<dynamic> certificatesBox;

  @override
  State<FinalAssessmentScreen> createState() => _FinalAssessmentScreenState();
}

class _FinalAssessmentScreenState extends State<FinalAssessmentScreen> {
  static const int passingScore = 80;

  /// Pulangkan salinan soalan dengan susunan pilihan (A/B/C/D) diacak,
  /// dan `correctIndex` diselaraskan supaya masih menunjuk jawapan yang
  /// betul selepas diacak. Ini menghalang corak "jawapan betul sentiasa
  /// pilihan A" yang wujud dalam questionBank asal.
  static AssessmentQuestion _acakPilihan(
    AssessmentQuestion soalan,
    math.Random random,
  ) {
    final List<int> susunan = List<int>.generate(
      soalan.options.length,
      (int i) => i,
    );
    susunan.shuffle(random);

    return AssessmentQuestion(
      topic: soalan.topic,
      question: soalan.question,
      options: susunan.map((int i) => soalan.options[i]).toList(),
      correctIndex: susunan.indexOf(soalan.correctIndex),
      explanation: soalan.explanation,
    );
  }

  static const List<AssessmentQuestion> questionBank = <AssessmentQuestion>[
    AssessmentQuestion(
      topic: 'Asas Haji',
      question: 'Apakah maksud ibadah Haji?',
      options: <String>[
        'Mengunjungi Baitullah pada masa tertentu untuk melaksanakan ibadah tertentu',
        'Mengunjungi mana-mana masjid pada setiap bulan',
        'Melakukan perjalanan untuk tujuan perniagaan',
        'Berpuasa sepanjang berada di Makkah',
      ],
      correctIndex: 0,
      explanation:
          'Haji ialah mengunjungi Baitullah al-Haram pada masa tertentu untuk melaksanakan ibadah tertentu.',
    ),
    AssessmentQuestion(
      topic: 'Syarat Wajib Haji',
      question: 'Antara berikut, yang manakah termasuk syarat wajib Haji?',
      options: <String>[
        'Islam, baligh, berakal dan berkemampuan',
        'Mesti sudah berkahwin',
        'Mesti mempunyai rumah sendiri',
        'Mesti boleh berbahasa Arab',
      ],
      correctIndex: 0,
      explanation:
          'Antara syarat wajib Haji ialah Islam, baligh, berakal, merdeka dan berkemampuan.',
    ),
    AssessmentQuestion(
      topic: 'Ihram',
      question:
          'Di manakah jemaah perlu berniat ihram sebelum melepasi sempadannya?',
      options: <String>['Miqat', 'Mina', 'Muzdalifah', 'Arafah'],
      correctIndex: 0,
      explanation:
          'Niat ihram hendaklah dilakukan di miqat atau sebelum melepasi sempadan miqat yang berkenaan.',
    ),
    AssessmentQuestion(
      topic: 'Rukun Haji',
      question: 'Apakah ibadah utama yang dilaksanakan di Arafah?',
      options: <String>['Wukuf', 'Tawaf Wada’', 'Melontar Jamrah', 'Sa’i'],
      correctIndex: 0,
      explanation: 'Wukuf di Arafah ialah salah satu rukun utama Haji.',
    ),
    AssessmentQuestion(
      topic: 'Rukun Haji',
      question: 'Antara berikut, yang manakah merupakan rukun Haji?',
      options: <String>[
        'Tawaf Ifadah',
        'Membeli batu di Mina',
        'Menukar hotel di Makkah',
        'Memakai kasut baharu',
      ],
      correctIndex: 0,
      explanation: 'Tawaf Ifadah merupakan salah satu rukun Haji.',
    ),
    AssessmentQuestion(
      topic: 'Wajib Haji',
      question: 'Antara berikut, yang manakah termasuk wajib Haji?',
      options: <String>[
        'Bermalam di Muzdalifah',
        'Makan bersama kumpulan',
        'Mengunjungi pasar di Makkah',
        'Membawa beg berwarna putih',
      ],
      correctIndex: 0,
      explanation: 'Bermalam di Muzdalifah termasuk dalam perkara wajib Haji.',
    ),
    AssessmentQuestion(
      topic: 'Larangan Ihram',
      question: 'Apakah yang perlu dijaga selepas seseorang berniat ihram?',
      options: <String>[
        'Larangan ihram',
        'Warna beg perjalanan',
        'Bilangan gambar yang diambil',
        'Jenis makanan hotel',
      ],
      correctIndex: 0,
      explanation:
          'Selepas berniat, jemaah perlu menjaga semua larangan ihram.',
    ),
    AssessmentQuestion(
      topic: 'Larangan Ihram',
      question:
          'Antara berikut, yang manakah perlu dielakkan selepas berniat ihram?',
      options: <String>[
        'Memakai wangi-wangian',
        'Minum air kosong',
        'Membaca doa',
        'Berjalan bersama kumpulan',
      ],
      correctIndex: 0,
      explanation:
          'Memakai wangi-wangian selepas berniat ihram termasuk perkara yang perlu dielakkan.',
    ),
    AssessmentQuestion(
      topic: 'Larangan Ihram',
      question:
          'Apakah tindakan yang perlu dielakkan tanpa keperluan yang dibenarkan ketika ihram?',
      options: <String>[
        'Memotong kuku atau mencabut rambut',
        'Membawa botol air',
        'Memakai gelang pengenalan',
        'Membaca buku panduan',
      ],
      correctIndex: 0,
      explanation:
          'Memotong kuku atau mencabut rambut tanpa sebab yang dibenarkan perlu dielakkan ketika ihram.',
    ),
    AssessmentQuestion(
      topic: 'Dam',
      question: 'Apakah maksud dam dalam ibadah Haji?',
      options: <String>[
        'Bayaran atau sembelihan tertentu dalam keadaan tertentu',
        'Nama tempat bermalam',
        'Pakaian khas untuk jemaah',
        'Doa yang dibaca selepas solat',
      ],
      correctIndex: 0,
      explanation:
          'Dam ialah bayaran atau sembelihan tertentu yang dikenakan dalam keadaan tertentu.',
    ),
    AssessmentQuestion(
      topic: 'Dam',
      question:
          'Apakah tindakan terbaik jika jemaah tidak pasti tentang kewajipan dam?',
      options: <String>[
        'Catat keadaan dan rujuk pembimbing Haji yang berautoriti',
        'Tentukan sendiri tanpa bertanya',
        'Abaikan perkara tersebut',
        'Tunggu sehingga pulang ke rumah',
      ],
      correctIndex: 0,
      explanation:
          'Jemaah perlu mencatat keadaan yang berlaku dan mendapatkan penjelasan daripada pembimbing atau pegawai bertauliah.',
    ),
    AssessmentQuestion(
      topic: 'Tawaf',
      question: 'Berapakah jumlah pusingan bagi satu ibadah Tawaf?',
      options: <String>[
        'Tujuh pusingan',
        'Lima pusingan',
        'Enam pusingan',
        'Lapan pusingan',
      ],
      correctIndex: 0,
      explanation: 'Satu ibadah Tawaf dilaksanakan sebanyak tujuh pusingan.',
    ),
    AssessmentQuestion(
      topic: 'Sa’i',
      question: 'Berapakah jumlah perjalanan Sa’i antara Safa dan Marwah?',
      options: <String>[
        'Tujuh perjalanan',
        'Dua perjalanan',
        'Lima perjalanan',
        'Sepuluh perjalanan',
      ],
      correctIndex: 0,
      explanation:
          'Sa’i dilakukan sebanyak tujuh perjalanan, bermula di Safa dan berakhir di Marwah.',
    ),
    AssessmentQuestion(
      topic: 'Sa’i',
      question: 'Di manakah perjalanan Sa’i yang pertama bermula?',
      options: <String>['Safa', 'Marwah', 'Mina', 'Muzdalifah'],
      correctIndex: 0,
      explanation: 'Perjalanan Sa’i bermula di Safa dan berakhir di Marwah.',
    ),
    AssessmentQuestion(
      topic: 'Muzdalifah',
      question:
          'Selepas berwukuf di Arafah, jemaah bergerak untuk bermalam di mana?',
      options: <String>['Muzdalifah', 'Madinah', 'Jeddah', 'Taif'],
      correctIndex: 0,
      explanation: 'Selepas wukuf di Arafah, jemaah bergerak ke Muzdalifah.',
    ),
    AssessmentQuestion(
      topic: 'Mina',
      question: 'Apakah ibadah yang berkait rapat dengan kawasan Mina?',
      options: <String>[
        'Melontar jamrah dan bermalam',
        'Sa’i antara Safa dan Marwah',
        'Tawaf mengelilingi Kaabah',
        'Solat di Masjid Nabawi',
      ],
      correctIndex: 0,
      explanation:
          'Mina ialah lokasi melontar jamrah dan bermalam dalam perjalanan Haji.',
    ),
    AssessmentQuestion(
      topic: 'Tahallul',
      question:
          'Apakah perbuatan yang dilaksanakan sebagai sebahagian daripada tahallul?',
      options: <String>[
        'Bercukur atau bergunting',
        'Menukar beg perjalanan',
        'Membeli pakaian baharu',
        'Membaca peta Mina',
      ],
      correctIndex: 0,
      explanation:
          'Bercukur atau bergunting merupakan sebahagian daripada proses tahallul.',
    ),
    AssessmentQuestion(
      topic: 'Tawaf Wada’',
      question:
          'Bilakah Tawaf Wada’ dilaksanakan bagi jemaah yang diwajibkan melakukannya?',
      options: <String>[
        'Sebelum meninggalkan Makkah',
        'Sebelum memasuki Arafah',
        'Sebelum berniat ihram',
        'Sebelum tiba di Madinah',
      ],
      correctIndex: 0,
      explanation:
          'Tawaf Wada’ dilaksanakan sebelum meninggalkan Makkah bagi mereka yang diwajibkan.',
    ),
    AssessmentQuestion(
      topic: 'Talbiyah',
      question: 'Apakah amalan yang dimulakan selepas berniat ihram?',
      options: <String>[
        'Membaca talbiyah',
        'Melontar jamrah',
        'Tawaf Wada’',
        'Bercukur',
      ],
      correctIndex: 0,
      explanation: 'Talbiyah dimulakan selepas seseorang berniat ihram.',
    ),
    AssessmentQuestion(
      topic: 'Doa & Zikir',
      question: 'Bagaimanakah jemaah boleh berdoa sepanjang ibadah Haji?',
      options: <String>[
        'Berdoa dengan bahasa yang difahami serta penuh penghayatan',
        'Hanya menggunakan satu doa sahaja',
        'Tidak perlu memahami maksud doa',
        'Hanya berdoa ketika berada di hotel',
      ],
      correctIndex: 0,
      explanation:
          'Jemaah boleh berdoa menggunakan bahasa yang difahami dengan ikhlas dan penuh penghayatan.',
    ),
  ];

  late List<AssessmentQuestion> questions;

  final Map<int, int> selectedAnswers = <int, int>{};

  int currentIndex = 0;
  bool showResult = false;
  bool showReview = false;
  int correctAnswers = 0;
  int score = 0;

  int get requiredCorrect => (questions.length * passingScore / 100).ceil();

  bool get passed => score >= passingScore;

  int get bestScore {
    final dynamic value = widget.assessmentBox.get(
      'best_score',
      defaultValue: 0,
    );

    return value is int ? value : 0;
  }

  int get attempts {
    final dynamic value = widget.assessmentBox.get('attempts', defaultValue: 0);

    return value is int ? value : 0;
  }

  @override
  void initState() {
    super.initState();
    _prepareQuestions();
  }

  void _prepareQuestions() {
    final math.Random random = math.Random();

    questions = questionBank
        .map((AssessmentQuestion soalan) => _acakPilihan(soalan, random))
        .toList();

    questions.shuffle(random);

    selectedAnswers.clear();
    currentIndex = 0;
    showResult = false;
    showReview = false;
    correctAnswers = 0;
    score = 0;
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      selectedAnswers[currentIndex] = answerIndex;
    });
  }

  void _previousQuestion() {
    if (currentIndex <= 0) {
      return;
    }

    setState(() {
      currentIndex--;
    });
  }

  void _nextQuestion() {
    if (!selectedAnswers.containsKey(currentIndex)) {
      return;
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
      return;
    }

    _submitAssessment();
  }

  Future<void> _submitAssessment() async {
    int totalCorrect = 0;

    for (int index = 0; index < questions.length; index++) {
      if (selectedAnswers[index] == questions[index].correctIndex) {
        totalCorrect++;
      }
    }

    final int finalScore = ((totalCorrect / questions.length) * 100).round();

    final int previousBest = bestScore;
    final int newAttempts = attempts + 1;
    final bool finalPassed = finalScore >= passingScore;
    final String achievementLevel = _kenalTahapPencapaian(finalScore);
    final String examCompletedAt = DateTime.now().toIso8601String();

    final Map<String, dynamic> dataToSave = <String, dynamic>{
      'last_score': finalScore,
      'best_score': math.max(previousBest, finalScore),
      'attempts': newAttempts,
      'passed':
          finalPassed ||
          widget.assessmentBox.get('passed', defaultValue: false) == true,
      'completed_at': examCompletedAt,
      'achievement_level': achievementLevel,
      'exam_completed_at': examCompletedAt,
    };

    if (finalPassed) {
      final dynamic existingCertificate =
          widget.assessmentBox.get('certificate_number');

      if (existingCertificate == null || (existingCertificate as String).isEmpty) {
        final String certificateNumber = await _janaNomborSijil();
        final String certificateUuid =
            '${DateTime.now().millisecondsSinceEpoch}-${math.Random().nextInt(9999).toString().padLeft(4, '0')}';

        dataToSave['certificate_number'] = certificateNumber;
        dataToSave['certificate_uuid'] = certificateUuid;
        dataToSave['certificate_issued_at'] = examCompletedAt;

        await widget.certificatesBox.put(
          certificateUuid,
          <String, dynamic>{
            'uuid': certificateUuid,
            'certificate_number': certificateNumber,
            'participant_name': '',
            'score': finalScore,
            'achievement_level': achievementLevel,
            'exam_completed_at': examCompletedAt,
            'issued_at': examCompletedAt,
          },
        );
      }
    }

    await widget.assessmentBox.putAll(dataToSave);

    if (!mounted) {
      return;
    }

    setState(() {
      correctAnswers = totalCorrect;
      score = finalScore;
      showResult = true;
    });
  }

  Future<String> _janaNomborSijil() async {
    final String tahun = DateTime.now().year.toString();
    final String kunciAkaun = 'certificate_counter_$tahun';

    final dynamic nilaiSediaAda = await widget.certificatesBox.get(kunciAkaun);
    final int bilSediaAda = nilaiSediaAda is int ? nilaiSediaAda : 0;
    final int bilSeterusnya = bilSediaAda + 1;

    await widget.certificatesBox.put(kunciAkaun, bilSeterusnya);

    return 'HP-$tahun-${bilSeterusnya.toString().padLeft(4, '0')}';
  }

  String _kenalTahapPencapaian(int score) {
    if (score >= 95) {
      return 'CEMERLANG';
    } else if (score >= 90) {
      return 'SANGAT BAIK';
    } else if (score >= 80) {
      return 'LULUS';
    }
    return 'TIDAK LULUS';
  }

  void _retryAssessment() {
    setState(_prepareQuestions);
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
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
          child: showResult ? _buildResult(context) : _buildQuestion(context),
        ),
      ),
    );
  }

  Widget _buildQuestion(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final AssessmentQuestion question = questions[currentIndex];

    final double progress = (currentIndex + 1) / questions.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  HajjIconButton(
                    tooltip: 'Kembali',
                    icon: Icons.arrow_back_rounded,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'PENILAIAN AKHIR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Markah lulus: $passingScore%',
                          style: TextStyle(
                            color: palette.mutedText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 46),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: palette.glassSurface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: palette.glassBorder),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: palette.shadow,
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: palette.emerald.withValues(alpha: 0.11),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: HajjIcon(
                              type: HajjIconType.quiz,
                              color: palette.emerald,
                              size: 25,
                            ),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Soalan ${currentIndex + 1} '
                                'daripada ${questions.length}',
                                style: TextStyle(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                question.topic,
                                style: TextStyle(
                                  color: palette.emerald,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: palette.softSurface,
                        color: palette.emerald,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: palette.glassSurface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: palette.glassBorder),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: palette.shadow,
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      question.question,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 20,
                        height: 1.4,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List<Widget>.generate(question.options.length, (
                      int optionIndex,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 11),
                        child: _AssessmentOption(
                          label: String.fromCharCode(65 + optionIndex),
                          text: question.options[optionIndex],
                          selected:
                              selectedAnswers[currentIndex] == optionIndex,
                          onTap: () {
                            _selectAnswer(optionIndex);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: currentIndex > 0 ? _previousQuestion : null,
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Sebelumnya'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: selectedAnswers.containsKey(currentIndex)
                          ? _nextQuestion
                          : null,
                      icon: Icon(
                        currentIndex == questions.length - 1
                            ? Icons.task_alt_rounded
                            : Icons.arrow_forward_rounded,
                      ),
                      label: Text(
                        currentIndex == questions.length - 1
                            ? 'Hantar Jawapan'
                            : 'Seterusnya',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _AssessmentNotice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResult(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final Color resultColor = passed ? palette.emerald : palette.danger;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  HajjIconButton(
                    tooltip: 'Kembali',
                    icon: Icons.arrow_back_rounded,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      'KEPUTUSAN PENILAIAN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 46),
                ],
              ),
              const SizedBox(height: 26),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: palette.glassSurface,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: resultColor.withValues(alpha: 0.32),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: palette.shadow,
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        color: resultColor.withValues(alpha: 0.11),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: resultColor.withValues(alpha: 0.28),
                        ),
                      ),
                      child: Icon(
                        passed
                            ? Icons.workspace_premium_rounded
                            : Icons.menu_book_rounded,
                        color: resultColor,
                        size: 44,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      passed
                          ? 'Tahniah, anda lulus!'
                          : 'Belum mencapai markah lulus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      passed
                          ? 'Anda layak menerima Sijil Pencapaian Pembelajaran Kendiri Haji.'
                          : 'Ulang kaji topik yang tersilap dan cuba semula.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: palette.mutedText, height: 1.5),
                    ),
                    if (passed) ...<Widget>[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: palette.gold.withValues(alpha: 0.11),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: palette.gold.withValues(alpha: 0.28),
                          ),
                        ),
                        child: Text(
                          'Tahap Pencapaian: '
                          '${widget.assessmentBox.get('achievement_level', defaultValue: 'LULUS')}',
                          style: TextStyle(
                            color: palette.gold,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    Text(
                      '$score%',
                      style: TextStyle(
                        color: resultColor,
                        fontSize: 68,
                        height: 1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$correctAnswers / '
                      '${questions.length} jawapan betul',
                      style: TextStyle(
                        color: palette.mutedText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 21),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: score / 100,
                        minHeight: 10,
                        backgroundColor: palette.softSurface,
                        color: resultColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Anda memerlukan sekurang-kurangnya '
                      '$requiredCorrect jawapan betul '
                      'untuk lulus.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: palette.mutedText, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: _ResultStat(
                      label: 'Markah terbaik',
                      value: '$bestScore%',
                      icon: Icons.emoji_events_rounded,
                      accent: palette.gold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ResultStat(
                      label: 'Jumlah cubaan',
                      value: '$attempts',
                      icon: Icons.replay_rounded,
                      accent: palette.emerald,
                    ),
                  ),
                ],
              ),
              if (passed) ...<Widget>[
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: palette.gold.withValues(alpha: 0.09),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: palette.gold.withValues(alpha: 0.24),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.verified_rounded, color: palette.gold),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Status sijil: Layak. '
                          'Sijil yang akan dijana ialah '
                          'sijil pencapaian aplikasi dan '
                          'bukan sijil rasmi pihak berkuasa.',
                          style: TextStyle(
                            color: palette.mutedText,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) {
                            return CertificateScreen(
                              assessmentBox: widget.assessmentBox,
                              certificatesBox: widget.certificatesBox,
                              score: score,
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.visibility_rounded),
                    label: const Text('Lihat Sijil'),
                  ),
                ),
                if (passed) ...<Widget>[
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) {
                              return CertificateScreen(
                                assessmentBox: widget.assessmentBox,
                                certificatesBox: widget.certificatesBox,
                                score: score,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.download_rounded),
                      label: const Text('Muat Turun Sijil'),
                    ),
                  ),
                ],
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      showReview = !showReview;
                    });
                  },
                  icon: Icon(
                    showReview
                        ? Icons.visibility_off_rounded
                        : Icons.rate_review_rounded,
                  ),
                  label: Text(
                    showReview ? 'Tutup Ulang Kaji' : 'Semak Jawapan',
                  ),
                ),
              ),
              if (showReview) ...<Widget>[
                const SizedBox(height: 16),
                _buildReview(context),
              ],
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.home_rounded),
                      label: const Text('Kembali'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _retryAssessment,
                      icon: const Icon(Icons.replay_rounded),
                      label: const Text('Cuba Semula'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _AssessmentNotice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReview(BuildContext context) {
    final List<int> incorrectIndexes = <int>[];

    for (int index = 0; index < questions.length; index++) {
      if (selectedAnswers[index] != questions[index].correctIndex) {
        incorrectIndexes.add(index);
      }
    }

    if (incorrectIndexes.isEmpty) {
      final HajjColors palette = context.hajjColors;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: palette.emerald.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: palette.emerald.withValues(alpha: 0.22)),
        ),
        child: Text(
          'Semua jawapan anda betul. Syabas!',
          textAlign: TextAlign.center,
          style: TextStyle(color: palette.emerald, fontWeight: FontWeight.w900),
        ),
      );
    }

    return Column(
      children: incorrectIndexes.map((int index) {
        final AssessmentQuestion question = questions[index];

        final int? selected = selectedAnswers[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _ReviewCard(
            number: index + 1,
            question: question,
            selectedAnswer: selected == null
                ? 'Tidak dijawab'
                : question.options[selected],
          ),
        );
      }).toList(),
    );
  }
}

class AssessmentQuestion {
  const AssessmentQuestion({
    required this.topic,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  final String topic;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
}

class _AssessmentOption extends StatelessWidget {
  const _AssessmentOption({
    required this.label,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: selected
                ? palette.emerald.withValues(alpha: 0.10)
                : palette.glassSurface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? palette.emerald.withValues(alpha: 0.48)
                  : palette.glassBorder,
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? palette.emerald : palette.softSurface,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: selected ? palette.onAccent : colors.onSurface,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: colors.onSurface,
                    height: 1.45,
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
              ),
              if (selected)
                Icon(Icons.check_circle_rounded, color: palette.emerald),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultStat extends StatelessWidget {
  const _ResultStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.accent,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palette.glassBorder),
      ),
      child: Column(
        children: <Widget>[
          Icon(icon, color: accent),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: palette.mutedText, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({
    required this.number,
    required this.question,
    required this.selectedAnswer,
  });

  final int number;
  final AssessmentQuestion question;
  final String selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palette.danger.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Soalan $number • ${question.topic}',
            style: TextStyle(
              color: palette.danger,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.question,
            style: TextStyle(
              color: colors.onSurface,
              fontWeight: FontWeight.w900,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Jawapan anda: $selectedAnswer',
            style: TextStyle(color: palette.danger, height: 1.4),
          ),
          const SizedBox(height: 6),
          Text(
            'Jawapan betul: '
            '${question.options[question.correctIndex]}',
            style: TextStyle(
              color: palette.emerald,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.explanation,
            style: TextStyle(
              color: palette.mutedText,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _AssessmentNotice extends StatelessWidget {
  const _AssessmentNotice();

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: palette.gold.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.gold.withValues(alpha: 0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.info_outline_rounded, color: palette.gold, size: 20),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              'Soalan ini ialah kandungan prototaip. '
              'Semak kandungan akhir bersama pembimbing '
              'Haji atau panel syariah yang berautoriti.',
              style: TextStyle(
                color: palette.mutedText,
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
