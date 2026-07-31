import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'final_assessment_screen.dart';
import 'islamic_icons.dart';
import 'interactive_ihram_module.dart';
import 'interactive_learning_module.dart';

class LearningModuleScreen extends StatelessWidget {
  const LearningModuleScreen({required this.assessmentBox, super.key});

  final Box<dynamic> assessmentBox;

  static const List<LearningModuleData> modules = <LearningModuleData>[
    LearningModuleData(
      number: '01',
      title: 'Asas Haji',
      subtitle: 'Kenali maksud Haji, syarat wajib dan gambaran perjalanan.',
      icon: HajjIconType.kaaba,
      accent: Color(0xFF2F8F79),
      sections: <LearningSection>[
        LearningSection(
          title: 'Pengertian Haji',
          points: <String>[
            'Haji ialah mengunjungi Baitullah al-Haram pada masa tertentu untuk melaksanakan ibadah tertentu.',
            'Ibadah Haji dilaksanakan dengan niat dan mengikuti tatacara yang ditetapkan.',
          ],
        ),
        LearningSection(
          title: 'Syarat wajib Haji',
          points: <String>[
            'Beragama Islam.',
            'Baligh dan berakal.',
            'Merdeka.',
            'Mempunyai kemampuan dari sudut kewangan, kesihatan dan keselamatan perjalanan.',
          ],
        ),
        LearningSection(
          title: 'Gambaran perjalanan',
          points: <String>[
            'Berihram dan berniat di miqat.',
            'Wukuf di Arafah.',
            'Bermalam di Muzdalifah dan Mina.',
            'Melontar jamrah, bertahallul, Tawaf dan Sa’i.',
          ],
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Doa Haji Mabrur',
          arabic: 'اللَّهُمَّ اجْعَلْ هَـٰذَا الْحَجَّ حَجًّا مَبْرُورًا',
          translation: 'Ya Allah, jadikanlah Haji ini Haji yang mabrur.',
          source: 'Doa umum yang diajarkan dalam kitab-kitab manasik Haji',
        ),
      ],
      academicInsight:
          'Haji ialah rukun Islam kelima, difardukan ke atas setiap '
          'Muslim yang berkemampuan sekali sahaja seumur hidup — '
          'berdasarkan hadis Rasulullah SAW: "Wahai manusia, '
          'sesungguhnya Allah telah mewajibkan Haji ke atas kamu, maka '
          'tunaikanlah Haji" (riwayat Muslim). Dari sudut fiqh, terdapat '
          'tiga cara pelaksanaan Haji: Ifrad (Haji sahaja), Tamattu\u2019 '
          '(Umrah kemudian Haji dalam satu musim, dengan tahallul di '
          'antaranya), dan Qiran (Haji dan Umrah serentak dalam satu '
          'ihram). Jemaah Malaysia kebanyakannya melaksanakan Haji '
          'Tamattu\u2019, yang turut mewajibkan dam sebagai tanda '
          'kesyukuran atas kemudahan tersebut. Sejarah ibadah ini pula '
          'berakar umbi daripada peristiwa Nabi Ibrahim AS dan Nabi '
          'Ismail AS membina semula Kaabah atas perintah Allah SWT.',
      reflectionQuestions: <String>[
        'Apakah tiga jenis pelaksanaan Haji (Ifrad, Tamattu\u2019, '
            'Qiran) dan bagaimana ia mempengaruhi susunan ibadah '
            'jemaah?',
        'Mengapakah Haji digolongkan sebagai rukun Islam kelima '
            'walaupun ia hanya wajib sekali seumur hidup bagi yang '
            'berkemampuan?',
      ],
    ),
    LearningModuleData(
      number: '02',
      title: 'Rukun & Wajib Haji',
      subtitle: 'Fahami perkara yang menentukan sah atau sempurnanya Haji.',
      icon: HajjIconType.rukun,
      accent: Color(0xFFB18443),
      sections: <LearningSection>[
        LearningSection(
          title: 'Rukun Haji',
          points: <String>[
            'Niat ihram Haji.',
            'Wukuf di Arafah.',
            'Tawaf Ifadah.',
            'Sa’i antara Safa dan Marwah.',
            'Bercukur atau bergunting.',
            'Tertib pada kebanyakan rukun.',
          ],
        ),
        LearningSection(
          title: 'Wajib Haji',
          points: <String>[
            'Berniat ihram di miqat.',
            'Menjaga larangan ihram.',
            'Bermalam di Muzdalifah.',
            'Melontar Jamrah Kubra.',
            'Bermalam di Mina.',
            'Melontar ketiga-tiga jamrah.',
            'Melaksanakan Tawaf Wada’.',
          ],
        ),
        LearningSection(
          title: 'Perbezaan ringkas',
          points: <String>[
            'Rukun yang ditinggalkan menyebabkan Haji tidak sempurna sehingga rukun itu dilaksanakan.',
            'Wajib Haji yang ditinggalkan boleh menyebabkan kewajipan dam, tertakluk kepada keadaan dan hukum.',
          ],
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Doa Memulakan Tawaf',
          arabic: 'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ',
          translation: 'Dengan nama Allah, dan Allah Maha Besar.',
          source: 'Amalan yang diajar dalam kitab-kitab manasik Haji',
        ),
      ],
      academicInsight:
          'Rukun dan Wajib Haji membentuk rangka kerja fiqh yang '
          'menentukan kesahan dan kesempurnaan ibadah. Umumnya, '
          'mazhab Syafi\u2019i — yang diamalkan secara meluas di '
          'Malaysia — mengira enam rukun Haji seperti disenaraikan di '
          'atas, dengan syarat "tertib" (susunan yang betul) hanya '
          'terpakai bagi kebanyakan rukun tersebut. Wajib Haji pula '
          'berbeza daripada rukun kerana ia boleh digantikan dengan dam '
          'jika ditinggalkan tanpa uzur, sementara Hajinya tetap sah. '
          'Perbezaan pendapat kecil turut wujud antara mazhab mengenai '
          'sesetengah perkara (contoh: status Tawaf Wada\u2019 sebagai '
          'wajib atau sunat bagi golongan tertentu), justeru jemaah '
          'digalakkan merujuk pembimbing Haji bertauliah bagi isu yang '
          'lebih terperinci.',
      reflectionQuestions: <String>[
        'Kenapa "tertib" (susunan yang betul) penting dalam '
            'pelaksanaan rukun Haji, dan apakah kesannya jika susunan '
            'ini tidak dipatuhi?',
        'Bagaimana pemahaman tentang perbezaan rukun dan wajib '
            'membantu jemaah mengelakkan kekeliruan semasa berada di '
            'Tanah Suci?',
      ],
    ),
    LearningModuleData(
      number: '03',
      title: 'Larangan Ihram',
      subtitle:
          'Kenali perkara yang perlu dijaga sepanjang berada dalam ihram.',
      icon: HajjIconType.ihram,
      accent: Color(0xFFC05C65),
      sections: <LearningSection>[
        LearningSection(
          title: 'Penjagaan diri',
          points: <String>[
            'Tidak memakai wangi-wangian selepas berniat ihram.',
            'Tidak memotong kuku atau mencabut rambut tanpa keperluan yang dibenarkan.',
            'Menjaga pakaian ihram mengikut ketetapan bagi lelaki dan wanita.',
          ],
        ),
        LearningSection(
          title: 'Hubungan dan akhlak',
          points: <String>[
            'Menjauhi hubungan suami isteri dan perkara yang membangkitkan syahwat.',
            'Tidak melakukan akad nikah semasa dalam ihram.',
            'Menjaga percakapan, kesabaran dan adab sepanjang ibadah.',
          ],
        ),
        LearningSection(
          title: 'Alam sekitar',
          points: <String>[
            'Tidak memburu binatang buruan darat ketika dalam ihram.',
            'Menjaga kebersihan dan tidak merosakkan kawasan suci.',
          ],
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Doa Perlindungan Daripada Bisikan Syaitan',
          arabic:
              'رَبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ، وَأَعُوذُ '
              'بِكَ رَبِّ أَنْ يَحْضُرُونِ',
          translation:
              'Ya Tuhanku, aku berlindung kepada-Mu daripada bisikan '
              'syaitan, dan aku berlindung kepada-Mu ya Tuhanku, '
              'daripada kehadiran mereka di sisiku.',
          source: 'Al-Mu\u2019minun 23:97\u201398',
        ),
      ],
      academicInsight:
          'Larangan-larangan ihram yang pelbagai — daripada wangian dan '
          'penjagaan rambut/kuku, hubungan suami isteri, sehingga '
          'larangan memburu — secara kolektif berfungsi sebagai latihan '
          'mujahadah (pengekangan diri) yang intensif. Jemaah dilatih '
          'meninggalkan tabiat harian demi menghayati status ihram '
          'sebagai keadaan suci yang istimewa, mengingatkan kepada '
          'keadaan fitrah manusia yang bersih daripada sebarang '
          'perhiasan duniawi. Dari sudut fiqh, jumhur ulama bersepakat '
          'bahawa kesalahan yang dilakukan secara terlupa, tidak '
          'sengaja, atau kerana jahil (tidak tahu hukum) dimaafkan dan '
          'tidak diwajibkan dam — namun jemaah wajib berhenti serta '
          'merta sebaik sahaja menyedari kesilapan tersebut.',
      reflectionQuestions: <String>[
        'Bagaimana pelbagai larangan ihram (wangian, memburu, dan '
            'lain-lain) secara kolektif melatih jemaah dalam aspek '
            'mujahadah (pengekangan diri)?',
        'Apakah hikmah pengecualian hukum bagi kesalahan yang '
            'dilakukan secara tidak sengaja atau terlupa, dan apakah '
            'tanggungjawab jemaah sebaik menyedarinya?',
      ],
    ),
    LearningModuleData(
      number: '04',
      title: 'Pengenalan Dam',
      subtitle: 'Fahami maksud dam dan keadaan yang memerlukan rujukan lanjut.',
      icon: HajjIconType.dam,
      accent: Color(0xFF7A6CB1),
      sections: <LearningSection>[
        LearningSection(
          title: 'Apakah dam?',
          points: <String>[
            'Dam ialah bayaran atau sembelihan tertentu yang dikenakan dalam keadaan tertentu ketika Haji atau Umrah.',
            'Hukum dan bentuk dam bergantung pada punca, keadaan dan kemampuan jemaah.',
          ],
        ),
        LearningSection(
          title: 'Sebab umum',
          points: <String>[
            'Meninggalkan sesuatu yang diwajibkan.',
            'Melakukan larangan ihram.',
            'Melaksanakan Haji Tamattu’ atau Qiran dalam keadaan yang berkaitan.',
          ],
        ),
        LearningSection(
          title: 'Tindakan jemaah',
          points: <String>[
            'Jangan menentukan dam sendiri hanya berdasarkan andaian.',
            'Catat perkara yang berlaku dan rujuk pembimbing Haji atau pegawai bertauliah.',
          ],
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Doa Memohon Kemaafan Atas Kesilapan',
          arabic: 'رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا',
          translation:
              'Ya Tuhan kami, janganlah Engkau hukum kami jika kami '
              'lupa atau tersalah.',
          source: 'Al-Baqarah 2:286',
        ),
      ],
      academicInsight:
          'Syariat dam mencerminkan sifat rahmat Allah SWT dalam '
          'ibadah Haji — kesilapan atau kekurangan yang berlaku tidak '
          'semestinya membatalkan seluruh ibadah, sebaliknya boleh '
          'diselesaikan melalui mekanisme tertentu. Secara umum, ulama '
          'fiqh membahagikan dam kepada beberapa kategori mengikut '
          'punca dan pilihan penyelesaiannya: sebahagian memerlukan '
          'urutan tertentu (tartib), sebahagian membenarkan pilihan '
          'antara sembelihan, puasa atau sedekah (takhyir), bergantung '
          'kepada jenis kesalahan. Asas pensyariatan dam turut '
          'disebut dalam Al-Baqarah ayat 196 berkaitan Haji '
          'Tamattu\u2019. Sikap paling bijaksana bagi jemaah ialah '
          'mencatat sebarang keraguan dan merujuk pihak berautoriti, '
          'bukan membuat kesimpulan sendiri yang mungkin tidak tepat.',
      reflectionQuestions: <String>[
        'Apakah hikmah disyariatkan dam sebagai jalan penyelesaian, '
            'berbanding terus membatalkan ibadah Haji jemaah yang '
            'melakukan kesilapan?',
        'Bagaimana sikap proaktif merujuk pembimbing Haji dapat '
            'mengelakkan kekeliruan dan kesilapan berkaitan hukum dam?',
      ],
    ),
    LearningModuleData(
      number: '05',
      title: 'Doa & Zikir',
      subtitle: 'Rujukan ringkas doa dan zikir yang mudah diamalkan.',
      icon: HajjIconType.doa,
      accent: Color(0xFF3887B6),
      sections: <LearningSection>[
        LearningSection(
          title: 'Talbiyah',
          points: <String>[
            'Perbanyakkan talbiyah selepas berniat ihram sehingga tiba waktu yang berkaitan dengan ibadah.',
            'Hayati maksud menyahut panggilan Allah dengan penuh rendah diri.',
          ],
        ),
        LearningSection(
          title: 'Doa kebaikan dunia dan akhirat',
          points: <String>[
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
            'Ya Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan di akhirat serta peliharalah kami daripada azab neraka.',
          ],
        ),
        LearningSection(
          title: 'Amalan umum',
          points: <String>[
            'Berdoa menggunakan bahasa yang difahami.',
            'Perbanyakkan istighfar, selawat, tasbih, tahmid dan takbir.',
            'Utamakan keikhlasan dan kefahaman berbanding menghafal tanpa menghayati.',
          ],
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Sayyidul Istighfar (Penghulu Segala Istighfar)',
          arabic:
              'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَـٰهَ إِلَّا أَنْتَ، '
              'خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَىٰ عَهْدِكَ '
              'وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا '
              'صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ '
              'بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ '
              'إِلَّا أَنْتَ',
          translation:
              'Ya Allah, Engkaulah Tuhanku, tiada Tuhan yang berhak '
              'disembah melainkan Engkau. Engkau telah menciptakanku '
              'dan aku adalah hamba-Mu. Aku akan berpegang teguh pada '
              'perjanjian dan janjiku kepada-Mu semampu mungkin. Aku '
              'berlindung kepada-Mu daripada kejahatan yang telah aku '
              'lakukan. Aku mengakui nikmat-Mu kepadaku dan aku '
              'mengakui dosaku, maka ampunilah aku, kerana '
              'sesungguhnya tiada yang mengampunkan dosa melainkan '
              'Engkau.',
          source: 'Riwayat al-Bukhari',
        ),
      ],
      academicInsight:
          'Rasulullah SAW bersabda maksudnya: "Doa itu adalah ibadah" '
          '(riwayat at-Tirmidhi dan Abu Dawud), menunjukkan kedudukan '
          'doa yang setaraf dengan ibadah lain seperti solat dan puasa. '
          'Ulama membahagikan doa kepada dua kategori: doa ma\u2019thur '
          '(yang bersumberkan Al-Quran dan hadis, seperti Talbiyah dan '
          'Sayyidul Istighfar di atas) dan doa peribadi dalam bahasa '
          'sendiri. Kedua-duanya digalakkan digabungkan — doa ma\u2019thur '
          'memastikan lafaz yang tepat dan pernah diamalkan Rasulullah '
          'SAW, manakala doa peribadi membolehkan jemaah meluahkan '
          'hajat khusus dengan penuh penghayatan. Zikir yang '
          'diperbanyakkan sepanjang Haji turut berfungsi sebagai '
          'peringatan berterusan (dzikrullah) yang mengukuhkan '
          'hubungan hamba dengan Penciptanya di sepanjang perjalanan '
          'yang meletihkan.',
      reflectionQuestions: <String>[
        'Mengapakah Rasulullah SAW menyatakan bahawa "doa itu adalah '
            'ibadah", dan apakah kesan pemahaman ini terhadap cara '
            'jemaah berdoa sepanjang Haji?',
        'Bagaimana jemaah dapat menggabungkan doa ma\u2019thur (yang '
            'diajar) dengan doa peribadi dalam bahasa sendiri semasa '
            'menunaikan ibadah Haji?',
      ],
    ),
    LearningModuleData(
      number: '06',
      title: 'Penilaian Akhir',
      subtitle: 'Jawab 20 soalan dan capai sekurang-kurangnya 80% untuk lulus.',
      icon: HajjIconType.quiz,
      accent: Color(0xFFCE7A38),
      sections: <LearningSection>[
        LearningSection(
          title: 'Format penilaian',
          points: <String>[
            'Penilaian mengandungi 20 soalan pilihan jawapan.',
            'Markah lulus ialah 80% atau sekurang-kurangnya 16 jawapan betul.',
          ],
        ),
        LearningSection(
          title: 'Selepas menjawab',
          points: <String>[
            'Keputusan dipaparkan serta-merta.',
            'Jawapan yang salah boleh disemak untuk ulang kaji.',
            'Pengguna yang lulus akan diberikan status layak menerima sijil pencapaian.',
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1050),
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
                                'BELAJAR HAJI',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.playfairDisplay(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Belajar, faham dan jadikan panduan',
                                textAlign: TextAlign.center,
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
                    const SizedBox(height: 26),
                    _LearningIntroCard(moduleCount: modules.length),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Modul Pembelajaran',
                                style: GoogleFonts.playfairDisplay(
                                  color: colors.onSurface,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Pilih satu modul dan belajar mengikut topik.',
                                style: TextStyle(color: palette.mutedText),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: palette.emerald.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: palette.emerald.withValues(alpha: 0.22),
                            ),
                          ),
                          child: Text(
                            '${modules.length} topik',
                            style: TextStyle(
                              color: palette.emerald,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                            final int columns = constraints.maxWidth >= 820
                                ? 3
                                : constraints.maxWidth >= 540
                                ? 2
                                : 1;

                            const double spacing = 14;

                            final double width =
                                (constraints.maxWidth -
                                    spacing * (columns - 1)) /
                                columns;

                            return Wrap(
                              spacing: spacing,
                              runSpacing: spacing,
                              children: modules.map((
                                LearningModuleData module,
                              ) {
                                return SizedBox(
                                  width: width,
                                  child: _LearningModuleCard(
                                    module: module,
                                    onTap: () {
                                      if (module.number == '06') {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) {
                                              return FinalAssessmentScreen(
                                                assessmentBox: assessmentBox,
                                              );
                                            },
                                          ),
                                        );
                                        return;
                                      }

                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (_) {
                                            return LearningDetailScreen(
                                              module: module,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            );
                          },
                    ),
                    const SizedBox(height: 22),
                    const _PrototypeNotice(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LearningDetailScreen extends StatelessWidget {
  const LearningDetailScreen({required this.module, super.key});

  final LearningModuleData module;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

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
          child: SingleChildScrollView(
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
                          child: Text(
                            module.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 26),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                            final bool compact = constraints.maxWidth < 460;
                            final Widget icon = Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: module.accent.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: HajjIcon(
                                type: module.icon,
                                color: module.accent,
                                size: 34,
                              ),
                            );
                            final Widget text = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'MODUL ${module.number}',
                                  style: TextStyle(
                                    color: module.accent,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  module.title,
                                  style: GoogleFonts.playfairDisplay(
                                    color: colors.onSurface,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  module.subtitle,
                                  style: TextStyle(
                                    color: palette.mutedText,
                                    height: 1.45,
                                  ),
                                ),
                              ],
                            );

                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: module.accent.withValues(alpha: 0.11),
                                borderRadius: BorderRadius.circular(26),
                                border: Border.all(
                                  color: module.accent.withValues(alpha: 0.28),
                                ),
                              ),
                              child: compact
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        icon,
                                        const SizedBox(height: 18),
                                        text,
                                      ],
                                    )
                                  : Row(
                                      children: <Widget>[
                                        icon,
                                        const SizedBox(width: 17),
                                        Expanded(child: text),
                                      ],
                                    ),
                            );
                          },
                    ),
                    const SizedBox(height: 18),

                    // --- BAHAGIAN NOTA PEMBELAJARAN ---
                    ...module.sections.map((LearningSection section) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _LearningSectionCard(
                          section: section,
                          accent: module.accent,
                        ),
                      );
                    }),

                    // --- DOA MA'THUR BERKAITAN TOPIK ---
                    if (module.duas.isNotEmpty) ...<Widget>[
                      _ModuleDuaCard(duas: module.duas, accent: module.accent),
                      const SizedBox(height: 14),
                    ],

                    // --- WAWASAN AKADEMIK MENDALAM ---
                    if (module.academicInsight != null) ...<Widget>[
                      _ModuleAcademicCard(
                        insight: module.academicInsight!,
                        accent: module.accent,
                      ),
                      const SizedBox(height: 14),
                    ],

                    // --- SOALAN RENUNGAN & PEMIKIRAN KRITIS ---
                    if (module.reflectionQuestions.isNotEmpty) ...<Widget>[
                      _ModuleReflectionCard(
                        questions: module.reflectionQuestions,
                        accent: module.accent,
                      ),
                    ],

                    // --- BAHAGIAN BUTANG INTERAKTIF (KUIZ/GAME) ---
                    if (_interactiveConfigFor(module.number) !=
                        null) ...<Widget>[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: module.accent.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: module.accent.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: module.accent.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: HajjIcon(
                                  type:
                                      HajjIconType.quiz, // Ikon rasmi aplikasi
                                  color: module.accent,
                                  size: 28,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'Uji Kefahaman Anda',
                              style: GoogleFonts.playfairDisplay(
                                color: colors.onSurface,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Sudah habis membaca? Mari uji kefahaman anda '
                              'tentang ${module.title.toLowerCase()} melalui '
                              'Kuiz dan Latih Tubi.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: palette.mutedText,
                                height: 1.45,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: module.accent,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => _interactiveConfigFor(
                                        module.number,
                                      )!.buildMenu(module),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.play_arrow_rounded),
                                label: const Text('Mula Latihan Interaktif'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],

                    const SizedBox(height: 8),
                    const _PrototypeNotice(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LearningModuleData {
  const LearningModuleData({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.sections,
    this.duas = const <ModuleDua>[],
    this.academicInsight,
    this.reflectionQuestions = const <String>[],
  });

  final String number;
  final String title;
  final String subtitle;
  final HajjIconType icon;
  final Color accent;
  final List<LearningSection> sections;

  /// Doa ma'thur berkaitan topik ini. Kosong bagi modul yang bukan
  /// kandungan (contoh: modul Penilaian Akhir).
  final List<ModuleDua> duas;

  /// Perbincangan akademik/teologi yang lebih mendalam mengenai topik
  /// ini. `null` bagi modul yang bukan kandungan pembelajaran.
  final String? academicInsight;

  /// Soalan kefahaman & pemikiran kritis berkaitan topik ini, terikat
  /// terus dengan `academicInsight` di atas.
  final List<String> reflectionQuestions;
}

class LearningSection {
  const LearningSection({required this.title, required this.points});

  final String title;
  final List<String> points;
}

class _LearningIntroCard extends StatelessWidget {
  const _LearningIntroCard({required this.moduleCount});

  final int moduleCount;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 580;

          final Widget icon = Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: palette.emerald.withValues(alpha: 0.11),
              shape: BoxShape.circle,
              border: Border.all(
                color: palette.emerald.withValues(alpha: 0.24),
              ),
            ),
            child: HajjIcon(
              type: HajjIconType.learning,
              color: palette.emerald,
              size: 54,
              strokeWidth: 4.2,
            ),
          );

          final Widget text = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Belajar Sebelum & Semasa Haji',
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'Modul ringkas untuk membantu jemaah '
                'memahami asas ibadah dan merujuk panduan '
                'semasa perjalanan.',
                style: TextStyle(color: palette.mutedText, height: 1.55),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: palette.gold.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: palette.gold.withValues(alpha: 0.24),
                  ),
                ),
                child: Text(
                  '$moduleCount modul pembelajaran',
                  style: TextStyle(
                    color: palette.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[icon, const SizedBox(height: 20), text],
            );
          }

          return Row(
            children: <Widget>[
              icon,
              const SizedBox(width: 24),
              Expanded(child: text),
            ],
          );
        },
      ),
    );
  }
}

class _LearningModuleCard extends StatefulWidget {
  const _LearningModuleCard({required this.module, required this.onTap});

  final LearningModuleData module;
  final VoidCallback onTap;

  @override
  State<_LearningModuleCard> createState() => _LearningModuleCardState();
}

class _LearningModuleCardState extends State<_LearningModuleCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final LearningModuleData module = widget.module;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, hovering ? -5 : 0, 0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: palette.glassSurface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: hovering
                      ? module.accent.withValues(alpha: 0.45)
                      : palette.glassBorder,
                ),
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: module.accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: module.accent.withValues(alpha: 0.28),
                          ),
                        ),
                        child: HajjIcon(
                          type: module.icon,
                          color: module.accent,
                          size: 29,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        module.number,
                        style: GoogleFonts.playfairDisplay(
                          color: module.accent.withValues(alpha: 0.80),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    module.title,
                    style: GoogleFonts.playfairDisplay(
                      color: colors.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    module.subtitle,
                    style: TextStyle(
                      color: palette.mutedText,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.menu_book_rounded,
                        color: palette.mutedText,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${module.sections.length} bahagian',
                        style: TextStyle(
                          color: palette.mutedText,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        module.number == '06' ? 'Mula penilaian' : 'Buka modul',
                        style: TextStyle(
                          color: module.accent,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: module.accent,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LearningSectionCard extends StatelessWidget {
  const _LearningSectionCard({required this.section, required this.accent});

  final LearningSection section;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 22,
            offset: const Offset(0, 11),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  section.title,
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...List<Widget>.generate(section.points.length, (int index) {
            final bool isArabicPrayer =
                section.title == 'Doa kebaikan dunia dan akhirat' && index == 0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.11),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: accent,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Text(
                      section.points[index],
                      textDirection: isArabicPrayer
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      textAlign: isArabicPrayer
                          ? TextAlign.center
                          : TextAlign.start,
                      style: isArabicPrayer
                          ? GoogleFonts.amiri(
                              color: colors.onSurface,
                              fontSize: 22,
                              height: 2.0,
                              fontWeight: FontWeight.w600,
                            )
                          : TextStyle(color: colors.onSurface, height: 1.55),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _PrototypeNotice extends StatelessWidget {
  const _PrototypeNotice();

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
              'Kandungan ini ialah ringkasan prototaip. '
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

/// Konfigurasi latihan interaktif (kuiz + latih tubi) bagi setiap modul
/// pembelajaran. Mengembalikan `null` untuk modul yang tiada latihan
/// interaktif lagi (contoh: Penilaian Akhir, modul 06).
_InteractiveModuleConfig? _interactiveConfigFor(String moduleNumber) {
  switch (moduleNumber) {
    case '01':
      return _InteractiveModuleConfig(
        categoryALabel: 'BENAR',
        categoryBLabel: 'SALAH',
        categoryAIcon: Icons.check_rounded,
        categoryBIcon: Icons.close_rounded,
        quizData: asasHajiQuizData,
        gameData: asasHajiGameData,
      );
    case '02':
      return _InteractiveModuleConfig(
        categoryALabel: 'RUKUN',
        categoryBLabel: 'WAJIB',
        categoryAIcon: Icons.verified_rounded,
        categoryBIcon: Icons.task_alt_rounded,
        quizData: rukunWajibQuizData,
        gameData: rukunWajibGameData,
      );
    case '03':
      // Modul Larangan Ihram menggunakan modul interaktif khusus sedia ada
      // (interactive_ihram_module.dart) yang lebih terperinci.
      return _InteractiveModuleConfig(
        categoryALabel: 'DIBENARKAN',
        categoryBLabel: 'LARANGAN',
        quizData: const <LearningQuizQuestion>[],
        gameData: const <LearningGameCard>[],
        buildOverride: (_) => const InteractiveIhramMenu(),
      );
    case '04':
      return _InteractiveModuleConfig(
        categoryALabel: 'PERLU DAM',
        categoryBLabel: 'TIDAK PERLU DAM',
        categoryAIcon: Icons.warning_amber_rounded,
        categoryBIcon: Icons.check_circle_outline_rounded,
        quizData: damQuizData,
        gameData: damGameData,
      );
    case '05':
      return _InteractiveModuleConfig(
        categoryALabel: 'DIGALAKKAN',
        categoryBLabel: 'TIDAK DIGALAKKAN',
        categoryAIcon: Icons.favorite_rounded,
        categoryBIcon: Icons.block_rounded,
        quizData: doaZikirQuizData,
        gameData: doaZikirGameData,
      );
    default:
      return null;
  }
}

class _InteractiveModuleConfig {
  const _InteractiveModuleConfig({
    required this.categoryALabel,
    required this.categoryBLabel,
    required this.quizData,
    required this.gameData,
    this.categoryAIcon = Icons.check_rounded,
    this.categoryBIcon = Icons.close_rounded,
    this.buildOverride,
  });

  final String categoryALabel;
  final String categoryBLabel;
  final IconData categoryAIcon;
  final IconData categoryBIcon;
  final List<LearningQuizQuestion> quizData;
  final List<LearningGameCard> gameData;

  /// Jika ditetapkan, digunakan terus sebagai skrin menu (contoh: modul
  /// Ihram guna `InteractiveIhramMenu` sedia ada, bukan menu generik).
  final Widget Function(LearningModuleData module)? buildOverride;

  Widget buildMenu(LearningModuleData module) {
    if (buildOverride != null) {
      return buildOverride!(module);
    }

    return InteractiveLearningMenu(
      topicTitle: module.title,
      topicIcon: module.icon,
      accent: module.accent,
      quizData: quizData,
      gameData: gameData,
      categoryALabel: categoryALabel,
      categoryBLabel: categoryBLabel,
      categoryAIcon: categoryAIcon,
      categoryBIcon: categoryBIcon,
    );
  }
}

/// Kad memaparkan doa ma'thur (Arab + terjemahan + sumber) berkaitan
/// topik modul semasa. Teks Arab dipaparkan besar dan lapang dengan
/// baris (tashkeel) penuh menggunakan fon Amiri.
class _ModuleDuaCard extends StatelessWidget {
  const _ModuleDuaCard({required this.duas, required this.accent});

  final List<ModuleDua> duas;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 22,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              HajjIcon(type: HajjIconType.doa, color: accent, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Doa Ma\u2019thur',
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          for (int i = 0; i < duas.length; i++) ...<Widget>[
            SizedBox(height: i == 0 ? 18 : 24),
            Text(
              duas[i].title.toUpperCase(),
              style: TextStyle(
                color: accent,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accent.withValues(alpha: 0.18)),
              ),
              child: Text(
                duas[i].arabic,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                  color: colors.onSurface,
                  fontSize: 22,
                  height: 2.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              duas[i].translation,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors.onSurface,
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.menu_book_rounded,
                  size: 13,
                  color: palette.mutedText,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    duas[i].source,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: palette.mutedText,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Kad "Wawasan Mendalam" — perbincangan akademik/teologi/sejarah lanjut
/// berkaitan topik modul semasa.
class _ModuleAcademicCard extends StatelessWidget {
  const _ModuleAcademicCard({required this.insight, required this.accent});

  final String insight;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 22,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: accent.withValues(alpha: 0.24)),
                ),
                child: Icon(
                  Icons.auto_stories_rounded,
                  color: accent,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Wawasan Mendalam',
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            insight,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: palette.mutedText,
              height: 1.7,
              fontSize: 13.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Kad soalan kefahaman & pemikiran kritis, terikat terus dengan
/// perbincangan dalam `_ModuleAcademicCard` di atasnya.
class _ModuleReflectionCard extends StatelessWidget {
  const _ModuleReflectionCard({required this.questions, required this.accent});

  final List<String> questions;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return GlassContainer(
      borderRadius: 22,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.psychology_alt_rounded, color: accent, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Renungan & Muhasabah',
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Soalan untuk membantu anda memahami hikmah di sebalik topik '
            'ini dengan lebih mendalam.',
            style: TextStyle(
              color: palette.mutedText,
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          ...List<Widget>.generate(questions.length, (int index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == questions.length - 1 ? 0 : 14,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(top: 1),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.14),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      questions[index],
                      style: TextStyle(
                        color: colors.onSurface,
                        height: 1.5,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
