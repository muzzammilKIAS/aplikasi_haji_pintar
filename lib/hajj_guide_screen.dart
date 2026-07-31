import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'islamic_icons.dart';

class HajjGuideScreen extends StatefulWidget {
  const HajjGuideScreen({required this.guideBox, super.key});

  final Box<dynamic> guideBox;

  @override
  State<HajjGuideScreen> createState() => _HajjGuideScreenState();
}

class _HajjGuideScreenState extends State<HajjGuideScreen> {
  static const String storageKey = 'completed_guide_steps';

  final Set<int> completedSteps = <int>{};

  static const List<HajjGuideStepData> steps = <HajjGuideStepData>[
    HajjGuideStepData(
      number: '01',
      title: 'Persediaan Sebelum Berangkat',
      location: 'Sebelum perjalanan',
      icon: HajjIconType.preparation,
      accent: Color(0xFF2F8F79),
      summary:
          'Sediakan ilmu, dokumen, kesihatan dan keperluan asas sebelum berangkat.',
      actions: <String>[
        'Semak pasport, visa, tiket dan dokumen perjalanan.',
        'Hadiri kursus atau taklimat Haji yang diiktiraf.',
        'Sediakan ubat peribadi dan rekod kesihatan.',
        'Simpan nombor penting dan maklumat kumpulan.',
      ],
      checklist: <String>[
        'Dokumen perjalanan lengkap.',
        'Ubat dan keperluan kesihatan dibawa.',
        'Fahami perjalanan asas Haji.',
        'Maklumkan keluarga tentang jadual perjalanan.',
      ],
      reminder:
          'Gunakan senarai semak dan simpan salinan dokumen secara selamat.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Doa Musafir',
          arabic:
              'اللَّهُمَّ إِنَّا نَسْأَلُكَ فِي سَفَرِنَا هَـٰذَا الْبِرَّ '
              'وَالتَّقْوَىٰ، وَمِنَ الْعَمَلِ مَا تَرْضَىٰ',
          translation:
              'Ya Allah, sesungguhnya kami memohon kepada-Mu dalam '
              'perjalanan kami ini kebaikan dan ketakwaan, serta amalan '
              'yang Engkau redai.',
          source: 'Riwayat Muslim',
        ),
      ],
      academicInsight:
          'Para ulama meletakkan persediaan rohani setaraf pentingnya '
          'dengan persediaan fizikal sebelum Haji. Menyelesaikan hutang, '
          'memohon kemaafan dan restu keluarga, serta bertaubat dianggap '
          'sebahagian daripada erti "tazawwud" (bekalan) yang disebut '
          'dalam Surah al-Baqarah ayat 197: "Berbekallah, dan '
          'sesungguhnya sebaik-baik bekalan ialah takwa." Dari sudut '
          'fiqh, konsep istita\u2019ah (kemampuan) yang menjadi syarat '
          'wajib Haji turut merangkumi tiga dimensi: kemampuan kewangan '
          '(termasuk nafkah keluarga yang ditinggalkan), kesihatan '
          'fizikal, dan keselamatan sepanjang perjalanan — ketiadaan '
          'mana-mana satu boleh menggugurkan kewajipan tanpa dosa.',
      reflectionQuestions: <String>[
        'Sejauh manakah persediaan rohani (seperti bertaubat dan '
            'menyelesaikan hutang) sama pentingnya dengan persediaan '
            'fizikal sebelum Haji?',
        'Bagaimana konsep istita\u2019ah (kemampuan) mempengaruhi '
            'kewajipan Haji ke atas seseorang, dan apakah kesannya jika '
            'salah satu syarat ini tidak dipenuhi?',
      ],
    ),
    HajjGuideStepData(
      number: '02',
      title: 'Ihram dan Niat di Miqat',
      location: 'Miqat',
      icon: HajjIconType.ihram,
      accent: Color(0xFFB18443),
      summary: 'Bersedia memakai ihram dan berniat Haji di sempadan miqat.',
      actions: <String>[
        'Bersihkan diri dan bersedia memakai pakaian ihram.',
        'Pastikan niat dilakukan pada tempat atau masa miqat yang betul.',
        'Mulakan talbiyah selepas berniat.',
        'Jaga larangan ihram selepas niat dilakukan.',
      ],
      checklist: <String>[
        'Pakaian ihram telah disediakan.',
        'Niat dilakukan sebelum melepasi miqat.',
        'Talbiyah dibaca.',
        'Larangan ihram difahami.',
      ],
      reminder:
          'Jangan melepasi miqat tanpa niat. Rujuk pembimbing Haji jika tidak pasti.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Talbiyah',
          arabic:
              'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ '
              'لَبَّيْكَ، إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، '
              'لَا شَرِيكَ لَكَ',
          translation:
              'Aku sahut panggilan-Mu ya Allah, aku sahut panggilan-Mu. '
              'Aku sahut panggilan-Mu, tiada sekutu bagi-Mu, aku sahut '
              'panggilan-Mu. Sesungguhnya segala puji, nikmat dan '
              'kerajaan adalah milik-Mu, tiada sekutu bagi-Mu.',
          source: 'Riwayat al-Bukhari dan Muslim',
        ),
        GuideDua(
          title: 'Lafaz Niat Haji',
          arabic: 'اللَّهُمَّ لَبَّيْكَ حَجًّا',
          translation: 'Ya Allah, aku sahut seruan-Mu untuk menunaikan Haji.',
          source: 'Lafaz yang diajarkan dalam kitab-kitab fiqh Haji',
        ),
      ],
      academicInsight:
          'Ihram membawa makna simbolik yang mendalam: dua helai kain '
          'putih tanpa jahitan menghapuskan segala tanda status sosial, '
          'bangsa dan kekayaan, menegakkan prinsip kesamarataan seluruh '
          'manusia di hadapan Allah SWT. Amalan ini turut mengingatkan '
          'jemaah tentang kain kafan dan hari kebangkitan. Dari sudut '
          'fiqh, miqat makani (had tempat) yang lima — antaranya '
          'Zulhulaifah, Juhfah dan Qarnul Manazil — ditetapkan sendiri '
          'oleh Rasulullah SAW berdasarkan arah kedatangan jemaah, dan '
          'sesiapa yang melepasinya tanpa berihram dikenakan dam '
          'melainkan kembali semula ke miqat.',
      reflectionQuestions: <String>[
        'Apakah hikmah di sebalik pemakaian ihram yang sama bagi semua '
            'jemaah tanpa mengira status sosial atau kekayaan?',
        'Mengapakah niat perlu dilaksanakan sebelum melepasi miqat, dan '
            'apakah tindakan yang wajar jika seseorang terlepas berbuat '
            'demikian?',
      ],
    ),
    HajjGuideStepData(
      number: '03',
      title: 'Ketibaan di Makkah',
      location: 'Makkah',
      icon: HajjIconType.kaaba,
      accent: Color(0xFF4B8CCB),
      summary:
          'Urus ketibaan dengan tenang dan kenal pasti laluan serta tempat penginapan.',
      actions: <String>[
        'Daftar masuk dan susun barang keperluan.',
        'Kenal pasti lokasi hotel, bas dan tempat berkumpul.',
        'Rehat secukupnya sebelum melaksanakan ibadah.',
        'Ikut arahan pembimbing bagi urutan ibadah.',
      ],
      checklist: <String>[
        'Lokasi hotel dikenal pasti.',
        'Tempat berkumpul diketahui.',
        'Nombor pembimbing disimpan.',
        'Badan cukup rehat dan air.',
      ],
      reminder:
          'Elakkan bergerak bersendirian di kawasan yang belum dikenal pasti.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Doa Memasuki Masjidil Haram',
          arabic: 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ',
          translation: 'Ya Allah, bukakanlah bagiku pintu-pintu rahmat-Mu.',
          source:
              'Riwayat Muslim (doa umum memasuki masjid, diamalkan jemaah '
              'semasa memasuki Masjidil Haram)',
        ),
      ],
      academicInsight:
          'Masjidil Haram telah mengalami pelbagai pengembangan sepanjang '
          'sejarah Islam bagi menampung jemaah yang semakin ramai, namun '
          'kedudukan Kaabah kekal sebagai kiblat dan pusat tumpuan sejak '
          'zaman Nabi Ibrahim AS. Sunnah Rasulullah SAW ketika pertama '
          'kali melihat Kaabah ialah mengangkat tangan dan berdoa dengan '
          'penuh khusyuk, bukan semestinya menyentuhnya. Ramai ulama '
          'turut menekankan pentingnya menjaga adab dan ketenangan hati '
          'walaupun dilanda rasa teruja, kerana saat ini sering '
          'digambarkan sebagai detik yang amat mustajab untuk berdoa.',
      reflectionQuestions: <String>[
        'Bagaimana jemaah dapat menyeimbangkan emosi (seperti teruja '
            'atau terharu) dengan ketenangan dan tertib semasa ketibaan '
            'di Masjidil Haram?',
        'Mengapakah adab dan kesopanan penting dijaga walaupun berada '
            'dalam keadaan sesak dan tergesa-gesa?',
      ],
    ),
    HajjGuideStepData(
      number: '04',
      title: 'Tawaf dan Sa’i',
      location: 'Masjidil Haram',
      icon: HajjIconType.tawaf,
      accent: Color(0xFF7A6CB1),
      summary: 'Laksanakan Tawaf dan Sa’i mengikut tertib serta kemampuan.',
      actions: <String>[
        'Laksanakan Tawaf sebanyak tujuh pusingan.',
        'Gunakan kaunter Tawaf bagi membantu kiraan.',
        'Laksanakan Sa’i sebanyak tujuh perjalanan.',
        'Gunakan kaunter Sa’i untuk merekod perjalanan.',
      ],
      checklist: <String>[
        'Tujuh pusingan Tawaf selesai.',
        'Tujuh perjalanan Sa’i selesai.',
        'Kiraan disemak sebelum keluar.',
        'Keadaan fizikal dipantau.',
      ],
      reminder:
          'Utamakan keselamatan dan elakkan bersesak jika keadaan terlalu padat.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Doa Antara Rukun Yamani dan Hajar Aswad',
          arabic:
              'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ '
              'حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
          translation:
              'Ya Tuhan kami, berikanlah kami kebaikan di dunia dan '
              'kebaikan di akhirat, serta peliharalah kami daripada azab '
              'neraka.',
          source:
              'Al-Baqarah 2:201; diamalkan Rasulullah SAW ketika Tawaf (Abu Dawud)',
        ),
        GuideDua(
          title: 'Doa Memulakan Sa\u2019i di Safa',
          arabic: 'إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ',
          translation:
              'Sesungguhnya Safa dan Marwah sebahagian daripada '
              'syiar-syiar Allah.',
          source: 'Al-Baqarah 2:158',
        ),
      ],
      academicInsight:
          'Pergerakan Tawaf mengelilingi Kaabah secara berlawanan arah '
          'jam sering dikaitkan oleh sarjana Islam dengan konsep '
          'ketauhidan — menjadikan Allah SWT sebagai paksi tunggal '
          'kehidupan, sepertimana malaikat bertawaf mengelilingi '
          '"Baitul Makmur" di langit. Sa\u2019i pula mengabadikan kisah '
          'Siti Hajar AS yang berulang-alik mencari air untuk anaknya, '
          'Nabi Ismail AS, sehingga terpancarnya mata air Zamzam — '
          'satu pengajaran agung tentang tawakal dan usaha yang tidak '
          'berputus asa walaupun dalam keadaan yang paling getir. Dari '
          'sudut fiqh, terdapat tiga jenis Tawaf: Qudum (ketibaan), '
          'Ifadah (rukun) dan Wada\u2019 (perpisahan), masing-masing '
          'dengan hukum dan waktu yang berbeza.',
      reflectionQuestions: <String>[
        'Apakah kaitan spiritual antara pergerakan Tawaf mengelilingi '
            'Kaabah dengan konsep ketauhidan dan penyerahan diri kepada '
            'Allah SWT?',
        'Bagaimana kisah Siti Hajar AS dalam peristiwa Sa\u2019i '
            'mengajar erti tawakal dan usaha yang berterusan kepada '
            'jemaah masa kini?',
      ],
    ),
    HajjGuideStepData(
      number: '05',
      title: 'Wukuf di Arafah',
      location: 'Arafah',
      icon: HajjIconType.arafah,
      accent: Color(0xFFC05C65),
      summary:
          'Berada di Arafah pada waktu wukuf dan perbanyakkan doa serta zikir.',
      actions: <String>[
        'Pastikan berada dalam kawasan Arafah pada waktu wukuf.',
        'Jaga solat, doa, zikir dan istighfar.',
        'Gunakan masa dengan tenang dan tertib.',
        'Ikut jadual pergerakan kumpulan.',
      ],
      checklist: <String>[
        'Berada dalam sempadan Arafah.',
        'Waktu wukuf dipastikan.',
        'Doa dan zikir dilaksanakan.',
        'Arahan kumpulan dipatuhi.',
      ],
      reminder:
          'Wukuf ialah rukun utama Haji. Pastikan lokasi dan waktunya tepat.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Sebaik-baik Doa (Doa Hari Arafah)',
          arabic:
              'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ '
              'الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ '
              'قَدِيرٌ',
          translation:
              'Tiada Tuhan yang berhak disembah melainkan Allah, Yang '
              'Maha Esa, tiada sekutu bagi-Nya. Bagi-Nya kerajaan dan '
              'bagi-Nya segala pujian, dan Dia Maha Berkuasa atas segala '
              'sesuatu.',
          source:
              'Riwayat at-Tirmidhi (hasan) — Rasulullah SAW bersabda: '
              '"Sebaik-baik doa ialah doa pada hari Arafah."',
        ),
      ],
      academicInsight:
          'Sabda Rasulullah SAW "al-Hajju Arafah" (Haji itu adalah '
          'Arafah) — riwayat at-Tirmidhi dan Abu Dawud — menegaskan '
          'bahawa sesiapa yang sempat berada di Arafah walaupun sesaat '
          'dalam waktu wukuf, sah Hajinya, manakala yang terlepas waktu '
          'ini tanpa uzur dianggap tidak sempurna Hajinya pada tahun '
          'tersebut. Arafah turut menjadi lokasi bersejarah Khutbah '
          'Wada\u2019 yang disampaikan Rasulullah SAW, merangkumi '
          'prinsip keadilan, kesamarataan, hak asasi, dan larangan riba '
          '— sebuah piagam kemanusiaan yang mendahului zamannya. Hari '
          'Arafah turut dianggap oleh ulama sebagai hari pengampunan '
          'dosa yang paling agung sepanjang tahun.',
      reflectionQuestions: <String>[
        'Mengapakah Rasulullah SAW menegaskan "Haji itu adalah Arafah"? '
            'Apakah pengajaran daripada penegasan ini kepada jemaah yang '
            'terlepas rukun-rukun lain?',
        'Bagaimana prinsip-prinsip yang disampaikan dalam Khutbah '
            'Wada\u2019 di Arafah — seperti keadilan dan kesamarataan — '
            'masih relevan dengan kehidupan bermasyarakat hari ini?',
      ],
    ),
    HajjGuideStepData(
      number: '06',
      title: 'Bermalam di Muzdalifah',
      location: 'Muzdalifah',
      icon: HajjIconType.muzdalifah,
      accent: Color(0xFF3887B6),
      summary:
          'Bergerak ke Muzdalifah, berehat dan membuat persediaan untuk Mina.',
      actions: <String>[
        'Ikut pergerakan kumpulan dari Arafah.',
        'Laksanakan ibadah mengikut panduan pembimbing.',
        'Berehat dan jaga tenaga.',
        'Sediakan batu melontar mengikut panduan.',
      ],
      checklist: <String>[
        'Tiba di Muzdalifah.',
        'Lokasi kumpulan dikenal pasti.',
        'Keperluan melontar disediakan.',
        'Tenaga dan hidrasi dijaga.',
      ],
      reminder:
          'Jangan berpisah daripada kumpulan ketika pergerakan besar-besaran.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Zikir di Masy\u2019aril Haram',
          arabic: 'فَاذْكُرُوا اللَّهَ عِنْدَ الْمَشْعَرِ الْحَرَامِ',
          translation:
              'Maka sebutlah (ingatlah) Allah di Masy\u2019aril Haram '
              '(Muzdalifah).',
          source: 'Al-Baqarah 2:198',
        ),
      ],
      academicInsight:
          'Muzdalifah berperanan sebagai persinggahan yang menghimpunkan '
          'jemaah selepas kesibukan Wukuf di Arafah, sebelum meneruskan '
          'perjalanan ke Mina. Rasulullah SAW mengajarkan solat Maghrib '
          'dan Isyak dijamak serta diqasarkan di sini — satu bentuk '
          'rukhsah (kelonggaran) yang mencerminkan sifat Islam yang '
          'mudah dan mengambil kira keletihan jemaah. Ulama berbeza '
          'pendapat tentang hukum mabit (bermalam) di Muzdalifah — ada '
          'yang mengategorikannya sebagai wajib dengan dam jika '
          'ditinggalkan, manakala golongan lemah, wanita hamil, dan '
          'warga emas diberikan kelonggaran untuk meneruskan perjalanan '
          'lebih awal ke Mina.',
      reflectionQuestions: <String>[
        'Apakah hikmah disyariatkan mabit (bermalam) di Muzdalifah '
            'sebelum meneruskan perjalanan ke Mina?',
        'Bagaimana konsep rukhsah (kelonggaran) dalam menjamak solat di '
            'Muzdalifah mencerminkan sifat Islam yang mengambil kira '
            'keadaan dan kemampuan manusia?',
      ],
    ),
    HajjGuideStepData(
      number: '07',
      title: 'Mina dan Melontar Jamrah',
      location: 'Mina',
      icon: HajjIconType.mina,
      accent: Color(0xFFCE7A38),
      summary:
          'Bermalam di Mina dan melontar jamrah mengikut jadual serta kemampuan.',
      actions: <String>[
        'Ikut jadual melontar yang ditetapkan.',
        'Pastikan batu dan bilangan lontaran mencukupi.',
        'Gunakan laluan yang ditetapkan.',
        'Kembali ke khemah atau lokasi kumpulan dengan selamat.',
      ],
      checklist: <String>[
        'Jadual melontar disemak.',
        'Bilangan lontaran dipastikan.',
        'Laluan pergi dan balik dikenal pasti.',
        'Keselamatan kumpulan dijaga.',
      ],
      reminder:
          'Jangan melawan arus atau memaksa diri ketika kawasan terlalu padat.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Takbir Semasa Melontar',
          arabic: 'اللَّهُ أَكْبَرُ',
          translation: 'Allah Maha Besar.',
          source:
              'Diajarkan Rasulullah SAW — takbir dilafazkan pada setiap '
              'kali lontaran batu (Sahih Muslim)',
        ),
      ],
      academicInsight:
          'Ibadah melontar jamrah mengabadikan peristiwa agung Nabi '
          'Ibrahim AS yang digoda oleh syaitan sebanyak tiga kali ketika '
          'diperintahkan menyembelih anaknya, Nabi Ismail AS, dan setiap '
          'kali baginda menolak godaan tersebut dengan melontar batu. '
          'Amalan ini menjadi lambang penolakan tegas terhadap hasutan '
          'syaitan dalam kehidupan seharian. Dari sudut fiqh, hari-hari '
          'Tasyriq (11, 12 dan 13 Zulhijjah) mempunyai jadual dan '
          'susunan lontaran yang tertentu pada setiap jamrah (Sughra, '
          'Wusta, Kubra), dan pihak berkuasa Haji moden turut '
          'memperkenalkan sistem berperingkat masa (tanawub) bagi '
          'mengurangkan risiko kesesakan di Jamarat.',
      reflectionQuestions: <String>[
        'Apakah pengajaran daripada peristiwa Nabi Ibrahim AS menolak '
            'godaan syaitan, yang diperingati melalui ibadah melontar '
            'jamrah?',
        'Bagaimana jemaah dapat mengekalkan disiplin, kesabaran dan '
            'keselamatan diri dalam suasana sesak semasa melontar '
            'jamrah?',
      ],
    ),
    HajjGuideStepData(
      number: '08',
      title: 'Tahallul',
      location: 'Selepas melontar',
      icon: HajjIconType.tahallul,
      accent: Color(0xFF5B9279),
      summary:
          'Bercukur atau bergunting sebagai sebahagian daripada proses tahallul.',
      actions: <String>[
        'Pastikan urutan ibadah telah disemak.',
        'Bercukur atau bergunting mengikut ketetapan.',
        'Fahami larangan yang telah terangkat.',
        'Teruskan ibadah berikutnya mengikut jadual.',
      ],
      checklist: <String>[
        'Urutan ibadah disahkan.',
        'Bercukur atau bergunting selesai.',
        'Status tahallul difahami.',
        'Langkah berikutnya diketahui.',
      ],
      reminder:
          'Rujuk pembimbing Haji tentang perbezaan tahallul awal dan tahallul thani.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Doa Memohon Penerimaan Amalan',
          arabic: 'اللَّهُمَّ تَقَبَّلْ مِنِّي',
          translation: 'Ya Allah, terimalah (amalan) daripadaku.',
          source:
              'Doa umum memohon penerimaan amalan, sesuai diamalkan '
              'selepas menyempurnakan sebahagian besar rukun dan wajib '
              'Haji',
        ),
      ],
      academicInsight:
          'Tahallul terbahagi kepada dua peringkat: tahallul awal, yang '
          'berlaku selepas melaksanakan dua daripada tiga perkara '
          '(melontar Jamrah Aqabah, bercukur/bergunting, dan Tawaf '
          'Ifadah bersama Sa\u2019i), membenarkan jemaah kembali memakai '
          'pakaian biasa dan mengangkat kebanyakan larangan ihram '
          'kecuali hubungan suami isteri; manakala tahallul thani '
          'berlaku selepas ketiga-tiga perkara tersebut selesai, '
          'mengangkat sepenuhnya semua larangan ihram. Mencukur '
          '(halq) atau bergunting (taqsir) turut membawa makna simbolik '
          'kerendahan hati dan pelepasan diri daripada sifat '
          'keduniaan, dengan mencukur habis dianggap lebih afdal bagi '
          'lelaki berdasarkan doa khusus Rasulullah SAW kepada golongan '
          'ini.',
      reflectionQuestions: <String>[
        'Apakah perbezaan antara tahallul awal dan tahallul thani dari '
            'segi larangan ihram yang terangkat pada setiap peringkat?',
        'Mengapakah mencukur atau menggunting rambut dipilih sebagai '
            'simbol penyempurnaan sebahagian besar rukun Haji?',
      ],
    ),
    HajjGuideStepData(
      number: '09',
      title: 'Tawaf Wada’',
      location: 'Masjidil Haram',
      icon: HajjIconType.tawafWada,
      accent: Color(0xFF9A6E52),
      summary:
          'Laksanakan Tawaf Wada’ sebelum meninggalkan Makkah apabila diwajibkan.',
      actions: <String>[
        'Semak jadual keberangkatan dari Makkah.',
        'Laksanakan Tawaf Wada’ pada waktu yang sesuai.',
        'Elakkan aktiviti yang tidak perlu selepas selesai.',
        'Bersedia untuk bergerak meninggalkan Makkah.',
      ],
      checklist: <String>[
        'Jadual keluar dari Makkah diketahui.',
        'Tawaf Wada’ selesai.',
        'Barang dan dokumen telah dikemas.',
        'Tempat berkumpul disahkan.',
      ],
      reminder:
          'Terdapat keadaan tertentu yang mempunyai pengecualian. Rujuk pembimbing Haji.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Doa Penutup Majlis (Kaffaratul Majlis)',
          arabic:
              'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لَا '
              'إِلَٰهَ إِلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ',
          translation:
              'Maha Suci Engkau ya Allah, dan dengan memuji-Mu, aku '
              'bersaksi bahawa tiada Tuhan melainkan Engkau, aku memohon '
              'ampun dan bertaubat kepada-Mu.',
          source:
              'Riwayat at-Tirmidhi — sesuai diamalkan sebelum '
              'meninggalkan Makkah sebagai tanda kesyukuran dan '
              'permohonan taubat',
        ),
      ],
      academicInsight:
          'Tawaf Wada\u2019 disyariatkan sebagai amalan terakhir sebelum '
          'jemaah meninggalkan Makkah, berdasarkan arahan Rasulullah '
          'SAW: "Janganlah seseorang daripada kamu berlalu (pulang) '
          'sehingga akhir kegiatannya di Baitullah adalah Tawaf" '
          '(riwayat Muslim). Ia melambangkan penghormatan terakhir '
          'kepada Baitullah sebelum berpisah, sekali gus mengingatkan '
          'jemaah tentang perpisahan hakiki dengan dunia kelak. Wanita '
          'yang didatangi haid atau nifas dikecualikan daripada '
          'kewajipan ini menurut jumhur ulama. Lebih penting lagi, para '
          'ulama mengingatkan bahawa nilai sebenar Tawaf Wada\u2019 '
          'ialah bukan sekadar pusingan fizikal terakhir, tetapi '
          'komitmen untuk mengekalkan istiqamah dan kesan positif '
          'ibadah Haji sepanjang baki kehidupan jemaah.',
      reflectionQuestions: <String>[
        'Mengapakah Tawaf Wada\u2019 disyariatkan sebagai amalan '
            'terakhir sebelum meninggalkan Makkah, dan apakah maknanya '
            'secara simbolik?',
        'Bagaimana jemaah dapat mengekalkan kesan positif dan '
            'istiqamah ibadah Haji selepas pulang ke tanah air, supaya '
            'ia bukan sekadar pengalaman sekali lalu?',
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadCompletedSteps();
  }

  void _loadCompletedSteps() {
    final dynamic savedValue = widget.guideBox.get(
      storageKey,
      defaultValue: <int>[],
    );

    completedSteps.clear();

    if (savedValue is List<dynamic>) {
      for (final dynamic value in savedValue) {
        if (value is int && value >= 0 && value < steps.length) {
          completedSteps.add(value);
        }
      }
    }
  }

  Future<void> _setStepCompleted(int index, bool completed) async {
    setState(() {
      if (completed) {
        completedSteps.add(index);
      } else {
        completedSteps.remove(index);
      }
    });

    final List<int> savedSteps = completedSteps.toList()..sort();

    await widget.guideBox.put(storageKey, savedSteps);
  }

  Future<void> _openStep(int index) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          return HajjGuideDetailScreen(
            steps: steps,
            initialIndex: index,
            completedSteps: completedSteps,
            onCompletionChanged: _setStepCompleted,
          );
        },
      ),
    );

    if (mounted) {
      setState(_loadCompletedSteps);
    }
  }

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final double progress = completedSteps.length / steps.length;

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
                constraints: const BoxConstraints(maxWidth: 820),
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
                                'PANDUAN HAJI',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.playfairDisplay(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Langkah demi langkah',
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
                    _GuideProgressCard(
                      completed: completedSteps.length,
                      total: steps.length,
                      progress: progress,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Perjalanan Haji',
                      style: GoogleFonts.playfairDisplay(
                        color: colors.onSurface,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tekan langkah untuk melihat panduan dan checklist.',
                      style: TextStyle(color: palette.mutedText),
                    ),
                    const SizedBox(height: 20),
                    ...List<Widget>.generate(steps.length, (int index) {
                      return _TimelineStep(
                        step: steps[index],
                        isCompleted: completedSteps.contains(index),
                        isLast: index == steps.length - 1,
                        onTap: () {
                          _openStep(index);
                        },
                      );
                    }),
                    const SizedBox(height: 12),
                    const _GuidePrototypeNotice(),
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

class HajjGuideDetailScreen extends StatefulWidget {
  const HajjGuideDetailScreen({
    required this.steps,
    required this.initialIndex,
    required this.completedSteps,
    required this.onCompletionChanged,
    super.key,
  });

  final List<HajjGuideStepData> steps;
  final int initialIndex;
  final Set<int> completedSteps;
  final Future<void> Function(int index, bool completed) onCompletionChanged;

  @override
  State<HajjGuideDetailScreen> createState() => _HajjGuideDetailScreenState();
}

class _HajjGuideDetailScreenState extends State<HajjGuideDetailScreen> {
  late int currentIndex;
  late final Set<int> completedSteps;

  HajjGuideStepData get step => widget.steps[currentIndex];

  bool get isCompleted => completedSteps.contains(currentIndex);

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;
    completedSteps = Set<int>.from(widget.completedSteps);
  }

  Future<void> _toggleCompleted() async {
    final bool newValue = !isCompleted;

    setState(() {
      if (newValue) {
        completedSteps.add(currentIndex);
      } else {
        completedSteps.remove(currentIndex);
      }
    });

    await widget.onCompletionChanged(currentIndex, newValue);
  }

  void _goToPrevious() {
    if (currentIndex <= 0) {
      return;
    }

    setState(() {
      currentIndex--;
    });
  }

  void _goToNext() {
    if (currentIndex >= widget.steps.length - 1) {
      return;
    }

    setState(() {
      currentIndex++;
    });
  }

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
                            'LANGKAH ${step.number}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 46),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _GuideStepHero(step: step),
                    const SizedBox(height: 16),
                    _GuideContentCard(
                      title: 'Apa yang perlu dilakukan',
                      icon: Icons.format_list_numbered_rounded,
                      accent: step.accent,
                      points: step.actions,
                    ),
                    if (step.duas.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 14),
                      _GuideDuaCard(duas: step.duas, accent: step.accent),
                    ],
                    const SizedBox(height: 14),
                    _GuideChecklistCard(step: step),
                    const SizedBox(height: 14),
                    _GuideAcademicCard(
                      insight: step.academicInsight,
                      accent: step.accent,
                    ),
                    const SizedBox(height: 14),
                    _GuideReflectionCard(
                      questions: step.reflectionQuestions,
                      accent: step.accent,
                    ),
                    const SizedBox(height: 14),
                    _GuideReminderCard(
                      reminder: step.reminder,
                      accent: step.accent,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: FilledButton.icon(
                        onPressed: _toggleCompleted,
                        style: FilledButton.styleFrom(
                          backgroundColor: isCompleted
                              ? palette.softSurface
                              : step.accent,
                          foregroundColor: isCompleted
                              ? colors.onSurface
                              : Colors.white,
                        ),
                        icon: Icon(
                          isCompleted
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked_rounded,
                        ),
                        label: Text(
                          isCompleted
                              ? 'Langkah telah selesai'
                              : 'Tandakan langkah selesai',
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: currentIndex > 0 ? _goToPrevious : null,
                            icon: const Icon(Icons.arrow_back_rounded),
                            label: const Text('Sebelumnya'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: currentIndex < widget.steps.length - 1
                                ? _goToNext
                                : null,
                            icon: const Icon(Icons.arrow_forward_rounded),
                            label: const Text('Seterusnya'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const _GuidePrototypeNotice(),
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

/// Doa ma'thur (doa yang bersumberkan Al-Quran atau hadis sahih/hasan)
/// yang berkaitan dengan sesuatu amalan/lokasi dalam perjalanan Haji.
class GuideDua {
  const GuideDua({
    required this.title,
    required this.arabic,
    required this.translation,
    required this.source,
  });

  /// Nama ringkas doa (contoh: "Talbiyah", "Doa Sa'i").
  final String title;

  /// Teks Arab lengkap dengan tashkeel (baris/harakat).
  final String arabic;

  /// Terjemahan makna dalam Bahasa Melayu.
  final String translation;

  /// Sumber/rujukan doa (contoh: "Riwayat al-Bukhari dan Muslim").
  final String source;
}

class HajjGuideStepData {
  const HajjGuideStepData({
    required this.number,
    required this.title,
    required this.location,
    required this.icon,
    required this.accent,
    required this.summary,
    required this.actions,
    required this.checklist,
    required this.reminder,
    required this.duas,
    required this.academicInsight,
    required this.reflectionQuestions,
  });

  final String number;
  final String title;
  final String location;
  final HajjIconType icon;
  final Color accent;
  final String summary;
  final List<String> actions;
  final List<String> checklist;
  final String reminder;

  /// Doa ma'thur yang berkaitan dengan langkah/ritual ini. Boleh kosong
  /// jika tiada doa khusus yang masyhur diriwayatkan bagi langkah tersebut.
  final List<GuideDua> duas;

  /// Perbincangan akademik/teologi yang lebih mendalam mengenai konteks,
  /// sejarah, hikmah, atau perbahasan fiqh berkaitan langkah ini.
  final String academicInsight;

  /// Soalan kefahaman & pemikiran kritis berkaitan langkah ini, untuk
  /// mendorong jemaah merenung dan memahami dengan lebih mendalam
  /// (bukan kuiz aneka pilihan — bersifat renungan/soal jawab terbuka).
  final List<String> reflectionQuestions;
}

class _GuideProgressCard extends StatelessWidget {
  const _GuideProgressCard({
    required this.completed,
    required this.total,
    required this.progress,
  });

  final int completed;
  final int total;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: palette.glassSurface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: palette.glassBorder),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: palette.shadow,
            blurRadius: 26,
            offset: const Offset(0, 13),
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
                  color: palette.emerald.withValues(alpha: 0.11),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: palette.emerald.withValues(alpha: 0.24),
                  ),
                ),
                child: HajjIcon(
                  type: HajjIconType.guide,
                  color: palette.emerald,
                  size: 29,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Kemajuan Panduan',
                      style: GoogleFonts.playfairDisplay(
                        color: colors.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$completed daripada $total langkah selesai',
                      style: TextStyle(color: palette.mutedText),
                    ),
                  ],
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: TextStyle(
                  color: palette.emerald,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              backgroundColor: palette.softSurface,
              color: palette.emerald,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineStep extends StatelessWidget {
  const _TimelineStep({
    required this.step,
    required this.isCompleted,
    required this.isLast,
    required this.onTap,
  });

  final HajjGuideStepData step;
  final bool isCompleted;
  final bool isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 52,
          child: Column(
            children: <Widget>[
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? step.accent
                      : step.accent.withValues(alpha: 0.11),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: step.accent.withValues(alpha: 0.40),
                  ),
                ),
                child: isCompleted
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 20,
                      )
                    : Text(
                        step.number,
                        style: TextStyle(
                          color: step.accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
              ),
              if (!isLast)
                Container(width: 2, height: 108, color: palette.glassBorder),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(22),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: palette.glassSurface,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: isCompleted
                          ? step.accent.withValues(alpha: 0.32)
                          : palette.glassBorder,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: palette.shadow,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: step.accent.withValues(alpha: 0.11),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: HajjIcon(
                          type: step.icon,
                          color: step.accent,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              step.title,
                              style: GoogleFonts.playfairDisplay(
                                color: colors.onSurface,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              step.location,
                              style: TextStyle(
                                color: step.accent,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              step.summary,
                              style: TextStyle(
                                color: palette.mutedText,
                                fontSize: 12,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: palette.mutedText,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GuideStepHero extends StatelessWidget {
  const _GuideStepHero({required this.step});

  final HajjGuideStepData step;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: step.accent.withValues(alpha: 0.11),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: step.accent.withValues(alpha: 0.28)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: step.accent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(19),
            ),
            child: HajjIcon(type: step.icon, color: step.accent, size: 35),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  step.location.toUpperCase(),
                  style: TextStyle(
                    color: step.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  step.title,
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  step.summary,
                  style: TextStyle(color: palette.mutedText, height: 1.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GuideContentCard extends StatelessWidget {
  const _GuideContentCard({
    required this.title,
    required this.icon,
    required this.accent,
    required this.points,
  });

  final String title;
  final IconData icon;
  final Color accent;
  final List<String> points;

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
              Icon(icon, color: accent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List<Widget>.generate(points.length, (int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 25,
                    height: 25,
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
                      points[index],
                      style: TextStyle(color: colors.onSurface, height: 1.5),
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

class _GuideChecklistCard extends StatelessWidget {
  const _GuideChecklistCard({required this.step});

  final HajjGuideStepData step;

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
              Icon(Icons.checklist_rounded, color: step.accent),
              const SizedBox(width: 10),
              Text(
                'Checklist ringkas',
                style: GoogleFonts.playfairDisplay(
                  color: colors.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...step.checklist.map((String item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: step.accent,
                    size: 21,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(color: colors.onSurface, height: 1.5),
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

class _GuideReminderCard extends StatelessWidget {
  const _GuideReminderCard({required this.reminder, required this.accent});

  final String reminder;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.warning_amber_rounded, color: accent),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              reminder,
              style: TextStyle(color: palette.mutedText, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuidePrototypeNotice extends StatelessWidget {
  const _GuidePrototypeNotice();

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
              'Panduan ini ialah ringkasan prototaip. '
              'Urutan dan hukum akhir hendaklah disemak '
              'bersama pembimbing Haji atau panel syariah '
              'yang berautoriti.',
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

/// Kad memaparkan doa ma'thur (Arab + terjemahan + sumber) berkaitan
/// langkah/ritual semasa. Teks Arab dipaparkan besar dan lapang dengan
/// baris (tashkeel) penuh supaya mudah dibaca dan kelihatan elegan.
class _GuideDuaCard extends StatelessWidget {
  const _GuideDuaCard({required this.duas, required this.accent});

  final List<GuideDua> duas;
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
            if (duas.length > 1) ...<Widget>[
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
            ],
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
                  fontSize: 25,
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

/// Kad "Wawasan Mendalam" — perbincangan akademik/teologi/sejarah yang
/// lebih lanjut berkaitan langkah semasa, bagi memberi nilai tambah
/// kepada pembaca yang ingin memahami hikmah dan konteks yang lebih luas.
class _GuideAcademicCard extends StatelessWidget {
  const _GuideAcademicCard({required this.insight, required this.accent});

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

/// Kad soalan kefahaman & pemikiran kritis — mendorong jemaah merenung
/// dan memahami hikmah di sebalik amalan, bukan sekadar menghafal
/// langkah demi langkah.
class _GuideReflectionCard extends StatelessWidget {
  const _GuideReflectionCard({required this.questions, required this.accent});

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
            'Soalan untuk membantu anda memahami hikmah di sebalik amalan '
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
