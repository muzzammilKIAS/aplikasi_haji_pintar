import 'package:flutter/material.dart';

import '../islamic_icons.dart';
import '../learning_module_screen.dart';
import '../shared_widgets.dart';

// ---------------------------------------------------------------------------
// MODUL U5 & U6 — Bab Keempat al-Idah fi Manasik al-Hajj wa al-‘Umrah
// (Imam an-Nawawi, Shamela book_id 96232, title_id 53, hlm. 375–384),
// "fi al-‘Umrah wa fihi masa’il". Rujukan halaman: page_id Shamela dengan
// halaman cetakan dalam kurungan siku, contoh "hlm. 380 [383]". Nota kaki
// ialah al-Ifsah oleh ‘Abd al-Fattah Rawah (kadang-kadang menukil hashiyah
// Ibn Hajar al-Haytami) — tidak disandarkan kepada an-Nawawi.
// ---------------------------------------------------------------------------

const List<LearningModuleData> idahModulesUmrah = <LearningModuleData>[
  LearningModuleData(
    number: 'U5',
    title: 'Hukum, Waktu & Kelebihan Umrah',
    subtitle:
        'Status fardu Umrah, mengulanginya, Umrah Ramadan dan waktu yang tidak sah.',
    icon: HajjIconType.kaaba,
    accent: Color(0xFF7A6CB1),
    sections: <LearningSection>[
      LearningSection(
        title: 'Hukum Umrah: Fardu Sekali Seumur Hidup',
        points: <String>[
          'Menurut mazhab Syafi’i, Umrah wajib ke atas orang yang berkemampuan, sama seperti Haji.',
          'Kewajipan itu hanya sekali seumur hidup; Umrah selepas itu ialah sunat.',
          'Syarat berkemampuan bagi Umrah sama dengan syarat Haji (lihat Modul 01).',
          'Kanak-kanak yang baligh sebelum Tawaf Umrahnya selesai, Umrah itu terus dikira sebagai Umrah fardunya.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'حُجَّ عَنْ أَبِيكَ وَاعْتَمِرْ',
              terjemahan:
                  'Berhajilah untuk bapamu dan ber-Umrahlah (untuknya) — '
                  'jawapan Nabi SAW kepada Abu Razin yang bapanya sudah '
                  'terlalu tua untuk bermusafir.',
              sumber:
                  'Riwayat Abu Dawud (1810), at-Tirmidhi (930), an-Nasa’i '
                  '(2637) dan Ibnu Majah (2906) daripada Abu Razin al-‘Uqaili '
                  'r.a. Nota kaki al-Ifsah menukil Imam Ahmad: tiada hadis '
                  'tentang wajib Umrah yang lebih baik dan lebih sahih '
                  'daripada hadis ini',
            ),
            DalilItem(
              arabic:
                  'عَلَيْهِنَّ جِهَادٌ لَا قِتَالَ فِيهِ: الْحَجُّ وَالْعُمْرَةُ',
              terjemahan:
                  'Ke atas mereka (kaum wanita) ada jihad yang tiada '
                  'peperangan padanya: Haji dan Umrah — jawapan Nabi SAW '
                  'kepada soalan Aisyah r.a.',
              sumber:
                  'Riwayat Ibnu Majah (2901) daripada Aisyah r.a.; nota kaki '
                  'al-Ifsah menilainya sahih atas syarat al-Bukhari dan Muslim',
            ),
          ],
          teksKitab:
              'Bab Keempat al-Idah, Masalah Pertama: Umrah fardu ke atas yang '
              'berkemampuan seperti Haji. An-Nawawi menegaskan inilah mazhab '
              'yang sahih daripada dua pendapat Imam as-Syafi’i dan itulah '
              'nasnya dalam kitab-kitab jadid; Umrah tidak wajib melainkan '
              'sekali seperti Haji (al-Idah, Bab 4 Masalah 1, hlm. 375–376 '
              '[378–379]).',
          teksKitabArabic:
              'الْعُمْرَةُ فَرْضٌ عَلَى الْمُسْتَطِيعِ كَالْحَجِّ، هَذَا هُوَ '
              'الْمَذْهَبُ الصَّحِيحُ مِنْ قَوْلَيِ الشَّافِعِيِّ رَحِمَهُ '
              'اللَّهُ تَعَالَى، وَهُوَ نَصُّهُ فِي كُتُبِهِ الْجَدِيدَةِ، وَلَا '
              'تَجِبُ الْعُمْرَةُ إِلَّا مَرَّةً وَاحِدَةً كَالْحَجِّ',
          permasalahan: <String>[
            'Ungkapan "yang sahih daripada dua pendapat" menunjukkan ada '
                'pendapat kedua dalam mazhab. Menurut huraian ulama mazhab '
                '(tidak disebut dalam teks ini), ia ialah qaul qadim bahawa '
                'Umrah sunat. Fatwa mazhab berpegang pada qaul jadid: fardu.',
            'Nota kaki al-Ifsah: Imam Malik dan Abu Hanifah (juga satu '
                'riwayat daripada Ahmad) berpendapat Umrah sunat seumur '
                'hidup. Mereka berdalil dengan hadis Jabir r.a.: "Tidak, '
                'tetapi jika engkau ber-Umrah itu lebih baik bagimu" '
                '(riwayat at-Tirmidhi). Pihak yang mewajibkan menjawab: '
                'sanadnya melalui al-Hajjaj bin Artah yang dinilai lemah; '
                'nota kaki itu menukil an-Nawawi (melalui Adwa’ al-Bayan) '
                'bahawa jangan terpedaya dengan tashih at-Tirmidhi.',
            'Hashiyah Ibn Hajar (dinukil al-Ifsah) menggabungkan dua hadis: '
                'perkataan "tidak" menafikan kesamaan tahap fardu Umrah '
                'dengan fardu Haji, kerana fardu Haji lebih kukuh '
                'berdasarkan ijmak.',
            'Baligh di tengah ibadah: Tawaf dalam Umrah sama kedudukannya '
                'dengan Wukuf dalam Haji. Jika kanak-kanak baligh sebelum '
                'Tawaf, Umrahnya memadai sebagai Umrah Islam. Hamba yang '
                'dimerdekakan di tengah ibadah juga sama hukumnya (al-Idah, '
                'Bab 8, hlm. 506 [509]). Hashiyah menambah: baligh di '
                'pertengahan Tawaf juga memadai, sebagaimana dinyatakan '
                'dalam al-Majmu’.',
          ],
        ),
      ),
      LearningSection(
        title: 'Memperbanyak Umrah: Berapa Kerap?',
        points: <String>[
          'Selepas Umrah fardu, disunatkan memperbanyak Umrah.',
          'Dalam mazhab Syafi’i, Umrah dua atau tiga kali setahun tidak makruh, malah dalam sehari pun tidak makruh.',
          'Jemaah Haji digalakkan merebut masa di Makkah selepas selesai manasik dengan memperbanyak Umrah dan Tawaf.',
          'Pastikan Umrah tambahan tidak mengganggu perkara yang lebih penting, seperti kesihatan, solat berjemaah atau urusan kumpulan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'الْعُمْرَةُ إِلَى الْعُمْرَةِ كَفَّارَةٌ لِمَا بَيْنَهُمَا',
              terjemahan:
                  'Umrah ke Umrah (yang berikutnya) adalah kifarah bagi '
                  '(dosa) antara keduanya.',
              sumber:
                  'Riwayat al-Bukhari (1773) dan Muslim (1349) daripada Abu '
                  'Hurairah r.a.; dinukil an-Nawawi dalam Bab 4 al-Idah',
            ),
          ],
          teksKitab:
              'Masalah Pertama Bab Keempat menyambung: disunatkan '
              'memperbanyak Umrah, lebih-lebih lagi dalam Ramadan (al-Idah, '
              'Bab 4, hlm. 376–377 [379–380]). Dalam Bab Kelima (Bermukim di '
              'Makkah), an-Nawawi menyeru jemaah Haji supaya merebut tempoh '
              'mukimnya selepas selesai manasik untuk memperbanyak Umrah '
              'dan Tawaf di Masjidil Haram (al-Idah, Bab 5, hlm. 386 [389]).',
          teksKitabArabic:
              'فَيَنْبَغِي لِلْحَاجِّ أَنْ يَغْتَنِمَ بَعْدَ قَضَاءِ مَنَاسِكِهِ '
              'مُدَّةَ مُقَامِهِ بِمَكَّةَ وَيَسْتَكْثِرَ مِنَ الِاعْتِمَارِ '
              'وَمِنَ الطَّوَافِ فِي الْمَسْجِدِ الْحَرَامِ',
          permasalahan: <String>[
            'Dalam al-Majmu’, an-Nawawi menegaskan bahawa menurut as-Syafi’i '
                'dan ashab, tidak makruh dua, tiga atau lebih Umrah dalam '
                'setahun, malah dalam sehari, dan memperbanyaknya sunat '
                'tanpa khilaf dalam mazhab (al-Majmu’, jil. 7, hlm. 137).',
            'Nota kaki al-Ifsah menukil Ibnu Rusyd (Bidayat al-Mujtahid): '
                'Imam Malik menyukai satu Umrah setahun dan memakruhkan dua '
                'atau tiga dalam setahun, manakala as-Syafi’i dan Abu '
                'Hanifah tidak memakruhkannya.',
            'Hujah keharusan berulang (nota kaki al-Ifsah): Aisyah r.a. '
                'melakukan Umrah bersama Qiran-nya, kemudian Umrah lagi dari '
                'Tan’im selepas Haji atas arahan Nabi SAW, dalam tempoh '
                'kurang sepuluh hari (dinukil daripada al-Qira oleh '
                'al-Muhibb at-Tabari).',
            'Al-Ifsah turut menyebut amalan Anas r.a.: apabila rambutnya '
                'kembali menghitam selepas bercukur, beliau keluar ber-Umrah '
                'lagi. Ini menjadi isyarat praktikal bahawa jarak antara '
                'Umrah tidak perlu terlalu lama.',
            'Kekangan ditentukan oleh keutamaan amalan, bukan hukum: nota '
                'kaki al-Ifsah mensyaratkan Umrah tambahan tidak '
                'menyibukkannya daripada perkara yang lebih penting.',
          ],
        ),
      ),
      LearningSection(
        title: 'Umrah dalam Ramadan',
        points: <String>[
          'Umrah dalam Ramadan lebih afdal daripada Umrah pada bulan lain.',
          'Pahalanya menyamai pahala Haji, tetapi ia tidak menggugurkan kewajipan Haji fardu.',
          'Umrah-umrah Nabi SAW berlaku dalam Zulkaedah (kecuali yang bersama Haji), bukan dalam Ramadan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'عُمْرَةٌ فِي رَمَضَانَ تَعْدِلُ حَجَّةً',
              terjemahan: 'Umrah dalam bulan Ramadan menyamai (pahala) Haji.',
              sumber:
                  'Riwayat al-Bukhari (1782, 1863) dan Muslim (1256) daripada '
                  'Ibnu Abbas r.a.; dalam riwayat Muslim: "menyamai Haji '
                  'bersamaku"',
            ),
            DalilItem(
              arabic:
                  'اعْتَمَرَ رَسُولُ اللَّهِ ﷺ أَرْبَعَ عُمَرٍ كُلُّهُنَّ فِي '
                  'ذِي الْقَعْدَةِ إِلَّا الَّتِي مَعَ حَجَّتِهِ',
              terjemahan:
                  'Rasulullah SAW mengerjakan empat Umrah, semuanya dalam '
                  'Zulkaedah kecuali Umrah yang bersama Hajinya.',
              sumber:
                  'Riwayat al-Bukhari (1778) dan Muslim (1253) daripada Anas '
                  'r.a.; lafaz di sini menurut nukilan kitab fiqh, dan susunan '
                  'lafaz sedikit berbeza antara riwayat',
            ),
          ],
          teksKitab:
              'Selepas menyebut sunat memperbanyak Umrah, lebih-lebih lagi '
              'dalam Ramadan, an-Nawawi membawa dua hadis sahih: hadis '
              'kifarah Umrah dan hadis Ibnu Abbas tentang Umrah Ramadan '
              '(al-Idah, Bab 4 Masalah 1, hlm. 377 [380]).',
          teksKitabArabic:
              'وَلَكِنْ يُسْتَحَبُّ الْإِكْثَارُ مِنْهَا لَا سِيَّمَا فِي '
              'رَمَضَانَ',
          permasalahan: <String>[
            'Maksud "menyamai Haji": al-Majmu’ menukil Ishaq bin Rahawaih '
                '(melalui at-Tirmidhi) bahawa ia seperti hadis "Qul huwallahu '
                'ahad menyamai sepertiga al-Quran". Ia menyamai dari sudut '
                'pahala, bukan menggantikan Haji fardu.',
            'Al-Mutawalli dan lain-lain (dinukil dalam al-Majmu’): Umrah '
                'dalam Ramadan lebih afdal daripada Umrah pada baki bulan '
                'lain; ashab juga menyunatkan Umrah dalam bulan-bulan Haji.',
            'Mengapa Nabi SAW tidak ber-Umrah dalam Ramadan? Nota kaki '
                'al-Ifsah: Baginda sengaja ber-Umrah dalam bulan haram untuk '
                'menolak kepercayaan Jahiliah yang melarang Umrah dalam '
                'bulan-bulan itu, dengan perbuatan dan juga sabda.',
            'Nota kaki al-Ifsah menyenaraikan empat Umrah Baginda: '
                'Hudaibiyah (6H, terhalang), Umrah al-Qadha’ (7H), Ji’ranah '
                '(8H) dan Umrah bersama Haji Wada’ (10H). Ibnu Umar '
                'menyebut salah satunya dalam Rejab, tetapi Aisyah r.a. '
                'menafikannya.',
          ],
        ),
      ),
      LearningSection(
        title: 'Miqat Zamani: Sepanjang Tahun',
        points: <String>[
          'Umrah boleh dikerjakan pada bila-bila masa sepanjang tahun.',
          'Bagi yang tidak berhaji, hari raya Haji dan hari-hari Tasyriq juga harus tanpa makruh.',
          'Umrah tidak boleh "luput" kerana waktunya sepanjang tahun (lihat Modul U2).',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah Kedua Bab Keempat: Umrah yang berasingan daripada Haji '
              'mempunyai miqat zamani dan makani. Miqat zamaninya ialah '
              'seluruh tahun; berihram Umrah harus pada bila-bila masa tanpa '
              'makruh, termasuk pada hari Nahar dan hari-hari Tasyriq bagi '
              'yang bukan jemaah Haji (al-Idah, Bab 4 Masalah 2, hlm. 381 '
              '[384]).',
          teksKitabArabic:
              'وَأَمَّا الْمِيقَاتُ الزَّمَانِيُّ فَجَمِيعُ السَّنَةِ وَقْتٌ '
              'لِلْعُمْرَةِ، فَيَجُوزُ الْإِحْرَامُ بِهَا فِي كُلِّ وَقْتٍ مِنْ '
              'غَيْرِ كَرَاهَةٍ، وَفِي يَوْمِ النَّحْرِ وَأَيَّامِ التَّشْرِيقِ '
              'لِغَيْرِ الْحَاجِّ',
          permasalahan: <String>[
            'Nota kaki al-Ifsah: imam-imam mazhab bersepakat bahawa seluruh '
                'tahun ialah waktu Umrah, kecuali Abu Hanifah yang '
                'memakruhkannya pada hari Arafah, hari Nahar dan hari-hari '
                'Tasyriq (menurut Bidayat al-Mujtahid).',
            'Al-Majmu’ menjelaskan: ada keadaan Umrah terhalang kerana '
                'sesuatu sebab, bukan kerana waktunya, iaitu bagi orang yang '
                'masih terikat dengan Haji (lihat tajuk berikut).',
          ],
        ),
      ),
      LearningSection(
        title: 'Umrah bagi Jemaah Haji: Bila Tidak Sah, Bila Afdal',
        points: <String>[
          'Selagi masih berihram Haji, jemaah tidak sah berniat Umrah.',
          'Selepas kedua-dua tahallul pun, tidak sah berihram Umrah selagi masih bermukim di Mina untuk melontar.',
          'Selepas Nafar Awal atau Nafar Thani, Umrah sah pada baki hari Tasyriq, tetapi lebih afdal menunggu hari Tasyriq berakhir.',
          'Jemaah Tamattu’ yang sudah bertahallul daripada Umrahnya boleh mengerjakan Umrah sunat sebelum 8 Zulhijjah.',
          'Jemaah Ifrad sebaiknya mengerjakan Umrah pada tahun Hajinya juga, kerana menangguhkannya ke tahun lain makruh.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah Kedua Bab Keempat menyambung: jemaah Haji tidak sah '
              'berihram Umrah selagi berihram Haji, dan juga selepas dua '
              'tahallul selagi bermukim di Mina untuk melontar (al-Idah, Bab '
              '4, hlm. 382 [385]). Dalam Fasal Sifat Ihram pula: Qiran lebih '
              'afdal daripada Ifrad tanpa Umrah pada tahun yang sama, kerana '
              'menangguhkan Umrah daripada tahun Haji itu makruh (al-Idah, '
              'Bab 2, hlm. 134 [137]).',
          teksKitabArabic:
              'وَأَمَّا الْحَاجُّ فَلَا يَصِحُّ إِحْرَامُهُ بِالْعُمْرَةِ مَا '
              'دَامَ مُحْرِمًا بِالْحَجِّ، وَكَذَا لَا يَصِحُّ إِحْرَامُهُ بِهَا '
              'بَعْدَ التَّحَلُّلَيْنِ مَا دَامَ مُقِيمًا بِمِنًى لِلرَّمْيِ',
          permasalahan: <String>[
            'Sebabnya (nota kaki al-Ifsah): waktu itu masih menjadi hak baki '
                'manasik Haji, iaitu mabit dan melontar, maka tidak boleh '
                'dialihkan kepada ibadah lain.',
            'Dalam al-Majmu’, an-Nawawi menyatakan ihram Umrah di Mina dalam '
                'keadaan ini tidak terjadi langsung (lam yan’aqid), tanpa '
                'khilaf, dan dia tidak dikenakan apa-apa kerananya.',
            'Nota kaki al-Ifsah menukil Mufid al-Anam (mazhab Hanbali) '
                'bahawa Umrah sah pada hari Nahar selepas tahallul akhir. '
                'Namun penulisnya sendiri berkata dia tidak mengetahui '
                'seorang pun daripada salaf yang ber-Umrah ketika masih '
                'berbaki mabit dan melontar.',
            'Jemaah Tamattu’ yang telah bertahallul daripada Umrahnya '
                'tinggal di Makkah dalam keadaan halal; jika mahu ber-Umrah '
                'sunat, dia boleh berbuat demikian (al-Idah, Bab 3 Fasal 4, '
                'hlm. 260 [263]). Nota kaki al-Ifsah: ia tidak terhad kepada '
                'Umrah sunat; Umrah nazar dan qada juga termasuk.',
            'Umrah tidak menggantikan Tawaf Qudum. Jika orang yang berihram '
                'Umrah berniat Tawaf Qudum, tawaf itu tetap dikira Tawaf '
                'Umrah, sama seperti solat fardu yang memadai bagi tahiyyatul '
                'masjid (al-Idah, Bab 3, hlm. 202 [205]).',
          ],
        ),
      ),
    ],
    academicInsight:
        'Masalah pertama dan kedua Bab Keempat al-Idah menunjukkan '
        'keseimbangan hukum Umrah. Dari satu sudut, ia fardu menurut qaul '
        'jadid as-Syafi’i, sehingga Umrah pertama seorang yang berkemampuan '
        'ialah tanggungan syarak, bukan sekadar amalan sunat. Dari sudut '
        'lain, waktunya amat luas: seluruh tahun, tanpa makruh, malah boleh '
        'diulang berkali-kali. Halangan hanya datang daripada ibadah lain '
        'yang masih belum selesai, iaitu Haji yang masih berbaki mabit dan '
        'melontar. Prinsip "waktu itu hak ibadah yang sedang berjalan" '
        'menjelaskan mengapa Umrah yang sangat digalakkan boleh menjadi '
        'tidak sah pada hari-hari Mina. Galakan an-Nawawi supaya jemaah '
        'Haji memperbanyak Umrah selepas manasik pula perlu dibaca bersama '
        'syarat al-Ifsah: ia tidak boleh menyibukkan jemaah daripada perkara '
        'yang lebih penting.',
    reflectionQuestions: <String>[
      'Mengapakah Umrah yang sah sepanjang tahun menjadi tidak sah bagi '
          'jemaah Haji yang masih bermukim di Mina, walaupun dia sudah '
          'bertahallul sepenuhnya?',
      'Bagaimanakah anda menimbang antara galakan memperbanyak Umrah '
          'dengan keperluan menjaga kesihatan dan tanggungjawab terhadap '
          'kumpulan semasa di Makkah?',
      'Apakah maksud Umrah Ramadan "menyamai Haji", dan mengapa ia tidak '
          'menggugurkan kewajipan Haji fardu?',
    ],
  ),
  LearningModuleData(
    number: 'U6',
    title: 'Umrah dari Makkah: Miqat & Tatacara',
    subtitle:
        'Keluar ke Tanah Halal, memilih Ji’ranah atau Tan’im, hingga tahallul di Marwah.',
    icon: HajjIconType.umrahJourney,
    accent: Color(0xFFCE7A38),
    sections: <LearningSection>[
      LearningSection(
        title: 'Miqat Orang yang Berada di Makkah: Tanah Halal',
        points: <String>[
          'Yang datang dari luar Makkah berihram dari miqat Haji yang dilaluinya.',
          'Sesiapa yang sudah berada di Makkah, sama ada penduduk atau pendatang, wajib keluar ke Tanah Halal untuk berihram Umrah.',
          'Memadai keluar walaupun selangkah melepasi sempadan Tanah Haram.',
          'Tujuannya supaya Umrah menghimpunkan Tanah Halal dan Tanah Haram, seperti Haji yang menghimpunkan Makkah dan Arafah.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'أَرْدِفْ أُخْتَكَ فَأَعْمِرْهَا مِنَ التَّنْعِيمِ',
              terjemahan:
                  'Bawalah saudara perempuanmu (Aisyah) membonceng di '
                  'belakangmu, dan suruhlah dia ber-Umrah dari Tan’im — '
                  'perintah Nabi SAW kepada Abdul Rahman bin Abi Bakar r.a.',
              sumber:
                  'Daripada Abdul Rahman bin Abi Bakar r.a.; takhrij: '
                  'al-Bukhari (1784), Muslim (1212) dan at-Tirmidhi (934). '
                  'Lafaz di sini menurut nukilan, dan susunannya berbeza '
                  'sedikit antara riwayat',
            ),
          ],
          teksKitab:
              'Masalah Kedua Bab Keempat: miqat makani Umrah sama seperti '
              'miqat Haji, kecuali bagi sesiapa yang berada di Makkah, sama '
              'ada penduduknya atau orang luar. Miqatnya ialah Tanah Halal; '
              'dia wajib keluar ke hujung Tanah Halal walaupun selangkah '
              '(al-Idah, Bab 4 Masalah 2, hlm. 380 [383]).',
          teksKitabArabic:
              'إِلَّا فِي حَقِّ مَنْ هُوَ بِمَكَّةَ سَوَاءٌ كَانَ مِنْ أَهْلِهَا '
              'أَوْ غَرِيبًا، فَإِنَّ مِيقَاتَهُ فِي الْعُمْرَةِ الْحِلُّ، '
              'فَيَلْزَمُهُ أَنْ يَخْرُجَ إِلَى طَرَفِ الْحِلِّ وَلَوْ بِخُطْوَةٍ',
          permasalahan: <String>[
            'Hashiyah (dinukil al-Ifsah): "selangkah" bukan had wajib. '
                'Memadai apa-apa yang dikira keluar dari Tanah Haram, '
                'termasuk sebelah kaki di Tanah Halal jika dia bertumpu '
                'padanya, berdasarkan qiyas kepada masalah iktikaf dan '
                'sumpah.',
            'Nota kaki al-Ifsah, menukil Adwa’ al-Bayan: jumhur ulama, '
                'termasuk empat imam mazhab, mewajibkan penduduk Makkah '
                'keluar ke Tanah Halal, dan ada yang menukil ijmak. Zahir '
                'tarjamah al-Bukhari pula menunjukkan penduduk Makkah boleh '
                'berihram Umrah dari Makkah, berdasarkan umum hadis '
                '"sehingga penduduk Makkah dari Makkah".',
            'Hujah jumhur (nota kaki al-Ifsah): (1) Nabi SAW menyuruh '
                'Aisyah r.a. keluar ke Tan’im. Kalau ihram dari Makkah sah, '
                'tentu Baginda menyuruhnya berihram dari situ. (2) Istiqra’ '
                'menunjukkan setiap nusuk menghimpunkan Tanah Halal dan '
                'Tanah Haram.',
            'Sempadan Tanah Haram menurut an-Nawawi (al-Idah, Bab 5 '
                'Masalah 23, hlm. 411 [414]): dari jalan Madinah, sebelum '
                'Tan’im, kira-kira tiga batu dari Makkah; dari jalan '
                'Ji’ranah, sembilan batu; dari jalan Jeddah, sepuluh batu. '
                'Tan’im ialah titik Tanah Halal yang paling hampir.',
          ],
        ),
      ),
      LearningSection(
        title: 'Ji’ranah, Tan’im atau Hudaibiyah?',
        points: <String>[
          'Semua arah Tanah Halal sah untuk berihram Umrah.',
          'Yang paling afdal menurut mazhab Syafi’i ialah Ji’ranah, kerana Nabi SAW berihram dari sana.',
          'Selepas itu Tan’im (kini terkenal dengan Masjid Aisyah), kemudian Hudaibiyah.',
          'Dari segi praktikal, Tan’im paling dekat dengan Masjidil Haram.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'An-Nawawi menyatakan mazhab as-Syafi’i: arah Tanah Halal yang '
              'paling afdal untuk berihram Umrah ialah Ji’ranah, kerana Nabi '
              'SAW berihram dari situ; kemudian Tan’im, kemudian Hudaibiyah '
              '(al-Idah, Bab 4 Masalah 2, hlm. 380–381 [383–384]).',
          teksKitabArabic:
              'ثُمَّ مَذْهَبُ الشَّافِعِيِّ رَحِمَهُ اللَّهُ تَعَالَى أَنَّ '
              'أَفْضَلَ جِهَاتِ الْحِلِّ لِلْإِحْرَامِ بِالْعُمْرَةِ أَنْ يُحْرِمَ '
              'مِنَ الْجِعْرَانَةِ فَإِنَّ النَّبِيَّ ﷺ أَحْرَمَ مِنْهَا، ثُمَّ '
              'بَعْدَهَا التَّنْعِيمُ، ثُمَّ الْحُدَيْبِيَةُ',
          permasalahan: <String>[
            'Mengapa Tan’im didahulukan daripada Hudaibiyah walaupun '
                'Hudaibiyah lebih jauh? Nota kaki al-Ifsah: kerana Nabi SAW '
                'memerintahkan Aisyah r.a. ber-Umrah dari Tan’im. Al-Ifsah '
                'juga menyebut riwayat mursal Ibnu Sirin (dalam Marasil Abi '
                'Dawud) bahawa Baginda menetapkan Tan’im bagi penduduk '
                'Makkah.',
            'Khilaf mazhab: nota kaki al-Ifsah menukil Kasysyaf al-Qina’ '
                '(mazhab Hanbali) yang mendahulukan Tan’im berbanding '
                'Ji’ranah dari segi keutamaan.',
            'Sebutan: al-Ji’ranah (jim berbaris bawah, ‘ain mati, ra’ '
                'tanpa syaddah) ialah yang paling masyhur dan dibetulkan '
                'an-Nawawi dalam Tahdhib-nya (nota kaki al-Ifsah). Sebutan '
                'al-Ji’irranah digunakan oleh kebanyakan ahli hadis, '
                'walaupun al-Khattabi menganggapnya salah sebut.',
            'Ihram Nabi SAW dari Ji’ranah berlaku dalam Umrah selepas '
                'peperangan Hunain pada tahun 8H (nota kaki al-Ifsah).',
          ],
        ),
      ),
      LearningSection(
        title: 'Tersilap: Berihram di Dalam Tanah Haram',
        points: <String>[
          'Jika seseorang berniat Umrah ketika masih di dalam Tanah Haram, ihramnya tetap sah.',
          'Dia wajib keluar ke Tanah Halal dalam keadaan berihram sebelum memulakan Tawaf; jika berbuat demikian, tiada dam.',
          'Jika dia terus Tawaf, Sa’i dan bercukur tanpa keluar, menurut pendapat yang paling sahih Umrahnya sah tetapi dia wajib membayar dam.',
          'Lebih afdal menangguhkan niat sehingga tiba di Tanah Halal.',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'An-Nawawi menyebut dua pendapat as-Syafi’i bagi orang yang '
              'berihram Umrah di Tanah Haram lalu tidak keluar ke Tanah '
              'Halal. Yang paling sahih: Umrahnya sah tetapi wajib dam '
              'kerana meninggalkan ihram dari miqatnya, iaitu Tanah Halal. '
              'Pendapat kedua: Umrah tidak memadai sehingga dia keluar ke '
              'Tanah Halal, dan dia kekal berihram sehingga keluar (al-Idah, '
              'Bab 4 Masalah 2, hlm. 381 [384]).',
          teksKitabArabic:
              'وَلَوْ أَحْرَمَ بِالْعُمْرَةِ فِي الْحَرَمِ انْعَقَدَ إِحْرَامُهُ، '
              'وَيَلْزَمُهُ الْخُرُوجُ إِلَى الْحِلِّ مُحْرِمًا، ثُمَّ يَدْخُلُ '
              'فَيَطُوفُ وَيَسْعَى وَيَحْلِقُ، وَقَدْ تَمَّتْ عُمْرَتُهُ وَلَا '
              'دَمَ عَلَيْهِ',
          permasalahan: <String>[
            'Bila dam gugur? Nota kaki al-Ifsah: dia mesti keluar ke Tanah '
                'Halal sebelum memulakan mana-mana amalan Umrah. Jika sudah '
                'memulakannya, dam tetap wajib walaupun dia keluar selepas '
                'itu, sama seperti orang yang melepasi miqat tanpa ihram.',
            'Pendapat paling sahih (sah tetapi wajib dam) juga ialah '
                'pendapat Ahmad, ashab ar-ra’yi, Abu Thaur dan Ibnu '
                'al-Munzir. Pendapat kedua (tidak sah sehingga keluar) '
                'ialah satu lagi pendapat Ahmad (nota kaki al-Ifsah).',
            'Nota kaki al-Ifsah: lebih afdal menangguhkan niat ihram '
                'sehingga tiba di Tanah Halal.',
            'Dam ini ialah dam meninggalkan wajib (ihram dari miqat), iaitu '
                'seekor kambing atau penggantinya. Lihat Modul 04 untuk '
                'perincian dam.',
          ],
        ),
      ),
      LearningSection(
        title: 'Persediaan Ihram bagi yang Berada di Makkah',
        points: <String>[
          'Sebelum keluar, disunatkan Tawaf di Kaabah, solat dua rakaat dan istilam Hajar Aswad.',
          'Kemudian keluar ke Tanah Halal dan mandi sunat ihram di sana.',
          'Pakai dua helai kain ihram, solat sunat ihram dua rakaat, kemudian berniat Umrah ketika mula bergerak.',
          'Mulakan talbiyah. Adab ihram, wangian dan larangannya sama seperti ihram Haji (lihat Modul 03 dan U3).',
        ],
        deepDive: SectionDeepDive(
          teksKitab:
              'Masalah Ketiga Bab Keempat: sifat ihram Umrah sama seperti '
              'ihram Haji dari segi mandi, berwangi, membersihkan diri, '
              'pakaian, larangan dan talbiyah. Jika berada di luar Makkah, '
              'dia berihram dari miqat negerinya. Jika berada di Makkah, '
              'disunatkan Tawaf, solat dua rakaat dan istilam Hajar Aswad, '
              'kemudian keluar ke Tanah Halal, mandi di sana, memakai kain '
              'ihram, solat dua rakaat dan berihram ketika mula berjalan '
              '(al-Idah, Bab 4 Masalah 3, hlm. 382–383 [385–386]).',
          teksKitabArabic:
              'وَإِنْ كَانَ فِي مَكَّةَ وَأَرَادَ الْعُمْرَةَ اسْتُحِبَّ لَهُ '
              'أَنْ يَطُوفَ بِالْبَيْتِ وَيُصَلِّيَ رَكْعَتَيْنِ وَلْيَسْتَلِمَ '
              'الْحَجَرَ، ثُمَّ يَخْرُجُ مِنَ الْحَرَمِ إِلَى الْحِلِّ '
              'فَيَغْتَسِلُ هُنَاكَ لِلْإِحْرَامِ',
          permasalahan: <String>[
            'Mandi di Makkah atau di Tanah Halal? Nota kaki al-Ifsah: jika '
                'dia mandi di Tanah Haram lalu keluar ke Tanah Halal, dan '
                'mandi itu memang diniatkan untuk ihram, ia sudah memadai '
                'bagi asal sunnah. Jika dia mandi di Tanah Halal, ia memadai '
                'bagi sunat mandi ihram dan juga mandi masuk Makkah.',
            'Istilam Hajar Aswad sebelum keluar disertai mengucup dan sujud '
                'di atasnya seperti yang telah dihuraikan dalam Fasal '
                'Kaifiyat Tawaf (nota kaki al-Ifsah).',
            'Niat di dalam hati menjadi asas ihram. Talbiyah pertama '
                'disunatkan menyebut nusuk, iaitu "Labbaika Allahumma '
                'bi-‘umrah", secara perlahan (lihat Modul U4).',
            'Tawaf dan solat dua rakaat sebelum keluar ke Tanah Halal ialah '
                'sunat yang berasingan. Ia dilakukan sebelum ihram, jadi '
                'tidak termasuk dalam amalan Umrah.',
          ],
        ),
      ),
      LearningSection(
        title: 'Talbiyah Hingga Tawaf, dan Tawaf Umrah',
        points: <String>[
          'Teruskan talbiyah sepanjang perjalanan sehingga masuk Makkah.',
          'Terus menuju Tawaf. Talbiyah dihentikan ketika mula Tawaf.',
          'Ramal (berjalan cepat dengan langkah pendek) pada tiga pusingan pertama dan berjalan biasa pada empat pusingan terakhir.',
          'Tawaf Umrah sekali gus memadai sebagai penghormatan kepada Kaabah; tiada Tawaf Qudum berasingan.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic:
                  'أَنَّ النَّبِيَّ ﷺ كَانَ يُمْسِكُ عَنِ التَّلْبِيَةِ فِي '
                  'الْعُمْرَةِ إِذَا اسْتَلَمَ الْحَجَرَ',
              terjemahan:
                  'Bahawa Nabi SAW berhenti bertalbiyah dalam Umrah apabila '
                  'Baginda beristilam Hajar Aswad.',
              sumber:
                  'Riwayat at-Tirmidhi (919) dan Abu Dawud (1817) daripada '
                  'Ibnu Abbas r.a. Sanadnya melalui Ibnu Abi Laila, dan '
                  'sebahagian riwayat mauquf pada Ibnu Abbas. Status '
                  'sanadnya tidak disemak sepenuhnya di sini',
            ),
          ],
          teksKitab:
              'An-Nawawi menyatakan: dia terus bertalbiyah sehingga masuk '
              'Makkah, lalu memulakan Tawaf dan menghentikan talbiyah ketika '
              'mula bertawaf. Dia melakukan ramal pada tiga pusingan pertama '
              'dan berjalan pada empat pusingan berikutnya, seperti Tawaf '
              'Qudum (al-Idah, Bab 4 Masalah 3, hlm. 383 [386]).',
          teksKitabArabic:
              'وَلَا يَزَالُ يُلَبِّي حَتَّى يَدْخُلَ مَكَّةَ فَيَبْدَأُ '
              'بِالطَّوَافِ، وَيَقْطَعُ التَّلْبِيَةَ حِينَ يَشْرَعُ فِي '
              'الطَّوَافِ، فَيَرْمُلُ فِي الطَّوْفَاتِ الثَّلَاثِ الْأُوَلِ مِنَ '
              'السَّبْعِ وَيَمْشِي فِي الْأَرْبَعِ',
          permasalahan: <String>[
            'Talbiyah Haji berbeza dengan talbiyah Umrah. Dalam Haji, '
                'talbiyah dihentikan dengan batu pertama di Jamrah '
                'al-‘Aqabah kerana dengan melontar dia mula bertahallul '
                '(al-Idah, Fasal Amalan Hari Nahar, hlm. 310 [313]). Dalam '
                'Umrah, ia dihentikan ketika mula Tawaf. Kaitan kedua-duanya '
                'dengan permulaan amalan tahallul ialah analogi penyusun, '
                'bukan nas al-Idah.',
            'Khilaf salaf (al-Musannaf Ibnu Abi Syaibah): Ibnu Abbas r.a. '
                'bertalbiyah sehingga istilam Hajar Aswad, manakala Ibnu '
                'Umar r.a. berhenti apabila memasuki Tanah Haram. Al-Idah '
                'menetapkan saat mula Tawaf, hampir sama dengan pendapat '
                'Ibnu Abbas.',
            'Orang yang berihram Umrah tidak mempunyai Tawaf Qudum. Tawaf '
                'Umrahnya memadai bagi kedua-duanya, sama seperti solat '
                'fardu yang memadai bagi tahiyyatul masjid. Jika dia '
                'berniat Tawaf Qudum, tawaf itu tetap jatuh sebagai Tawaf '
                'Umrah (al-Idah, Bab 3, hlm. 202 [205]).',
            'Tatacara Tawaf, termasuk syarat suci, tujuh pusingan dan doa, '
                'sama seperti yang dihuraikan dalam Fasal Kaifiyat Tawaf '
                '(lihat Modul 02 dan U4).',
          ],
        ),
      ),
      LearningSection(
        title: 'Sa’i, Sembelihan & Tahallul di Marwah',
        points: <String>[
          'Selepas Tawaf, terus Sa’i tujuh kali antara Safa dan Marwah.',
          'Selesai Sa’i, bercukur atau bergunting di Marwah. Dengan itu Umrah selesai dengan satu tahallul sahaja.',
          'Minimum tiga helai rambut kepala. Bagi lelaki, bercukur lebih afdal; wanita hanya bergunting kira-kira satu ruas jari dari semua bahagian.',
          'Jemaah Tamattu’ yang hampir dengan hari Haji lebih baik bergunting, supaya masih ada rambut untuk dicukur pada hari Nahar.',
          'Jika membawa hadyu, sembelih selepas Sa’i dan sebelum bercukur.',
        ],
        deepDive: SectionDeepDive(
          dalil: <DalilItem>[
            DalilItem(
              arabic: 'مُحَلِّقِينَ رُءُوسَكُمْ وَمُقَصِّرِينَ',
              terjemahan:
                  '(Kamu akan memasuki Masjidil Haram) dalam keadaan '
                  'mencukur kepala kamu dan menggunting (rambut).',
              sumber: 'Al-Fath (48):27',
            ),
          ],
          teksKitab:
              'An-Nawawi menyatakan: selepas Sa’i dia bercukur atau '
              'bergunting di Marwah, lalu sempurnalah Umrahnya dengan satu '
              'tahallul. Jika dia membawa hadyu, disunatkan menyembelihnya '
              'selepas Sa’i dan sebelum bercukur; di mana-mana bahagian '
              'Makkah atau Tanah Haram sudah memadai, tetapi di Marwah lebih '
              'afdal kerana di situlah tempat tahallulnya, sama seperti Mina '
              'bagi jemaah Haji (al-Idah, Bab 4 Masalah 3, hlm. 383 [386]).',
          teksKitabArabic:
              'فَإِنْ كَانَ مَعَهُ هَدْيٌ اسْتُحِبَّ لَهُ أَنْ يَنْحَرَهُ بَعْدَ '
              'السَّعْيِ وَقَبْلَ الْحَلْقِ، وَحَيْثُ نَحَرَ مِنْ مَكَّةَ أَوِ '
              'الْحَرَمِ أَجْزَأَهُ، لَكِنِ الْأَفْضَلُ عِنْدَ الْمَرْوَةِ',
          permasalahan: <String>[
            'Realiti semasa (nota kaki al-Ifsah): menyembelih di Marwah '
                'tidak lagi dapat dilakukan selepas pembinaan Mas’a. Oleh '
                'itu, hadyu disembelih di mana-mana yang mudah dalam Makkah '
                'atau Tanah Haram.',
            'Kadar minimum: tiga helai rambut, sama ada bercukur atau '
                'bergunting. Jika tiga helai dibuang pada tiga waktu '
                'berbeza, ia sah tetapi kurang fadilat. Orang yang tiada '
                'rambut tidak wajib apa-apa, tetapi disunatkan melalukan '
                'pisau cukur di kepalanya (al-Idah, Fasal al-Halq, hlm. '
                '340–342 [343–345]).',
            'Waktu bercukur bagi orang yang ber-Umrah bermula selepas Sa’i. '
                'Jika dia berjimak selepas Sa’i tetapi sebelum bercukur, '
                'Umrahnya fasid menurut pendapat bahawa bercukur itu nusuk '
                '(al-Idah, hlm. 350 [353]; nota kaki al-Ifsah, hlm. 340 '
                '[343]). Lihat Modul U3 tentang hukum fasid.',
            'Pengecualian afdal bercukur (hashiyah, dinukil al-Ifsah): bagi '
                'orang yang ber-Umrah ketika waktu Haji sudah hampir, '
                'contohnya pada hari Arafah, sehingga rambutnya tidak sempat '
                'tumbuh sebelum hari Nahar, bergunting lebih afdal. Umrah '
                'selain Tamattu’ pula sunat bercukur secara mutlak.',
            'Rukun Umrah: ihram, Tawaf, Sa’i dan bercukur. Tertib antara '
                'keempat-empatnya wajib, dan wajibnya hanya ihram dari '
                'miqat (lihat Modul U2).',
          ],
        ),
      ),
    ],
    duas: <ModuleDua>[
      ModuleDua(
        title: 'Talbiyah Pertama Umrah',
        arabic: 'لَبَّيْكَ اللَّهُمَّ بِعُمْرَةٍ',
        translation: 'Aku menyahut seruan-Mu ya Allah, dengan Umrah.',
        source:
            'Al-Idah (Fasal Sifat Ihram) — dinukil daripada asy-Syeikh Abu '
            'Muhammad al-Juwaini: sunat menyebut nusuk dalam talbiyah pertama '
            'ketika berihram dan membacanya perlahan',
      ),
      ModuleDua(
        title: 'Doa Memulakan Tawaf (di Hajar Aswad)',
        arabic:
            'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ، اللَّهُمَّ إِيمَانًا بِكَ، '
            'وَتَصْدِيقًا بِكِتَابِكَ، وَوَفَاءً بِعَهْدِكَ، وَاتِّبَاعًا لِسُنَّةِ '
            'نَبِيِّكَ مُحَمَّدٍ ﷺ',
        translation:
            'Dengan nama Allah, dan Allah Maha Besar. Ya Allah, (aku '
            'melakukannya) kerana beriman kepada-Mu, membenarkan Kitab-Mu, '
            'menunaikan janji-Mu dan mengikuti sunnah Nabi-Mu Muhammad SAW.',
        source:
            'Al-Idah (Fasal Kaifiyat Tawaf) — dibaca ketika istilam Hajar Aswad '
            'dan setiap kali bertentangan dengannya; doa anjuran ulama, al-Idah '
            'tidak menyandarkannya kepada hadis marfu’',
      ),
      ModuleDua(
        title: 'Doa Ketika Bercukur',
        arabic:
            'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، الْحَمْدُ '
            'لِلَّهِ عَلَى مَا هَدَانَا، وَالْحَمْدُ لِلَّهِ عَلَى مَا أَنْعَمَ '
            'بِهِ عَلَيْنَا، اللَّهُمَّ هَذِهِ نَاصِيَتِي فَتَقَبَّلْ مِنِّي '
            'وَاغْفِرْ ذُنُوبِي، اللَّهُمَّ اغْفِرْ لِلْمُحَلِّقِينَ '
            'وَالْمُقَصِّرِينَ يَا وَاسِعَ الْمَغْفِرَةِ، اللَّهُمَّ أَثْبِتْ لِي '
            'بِكُلِّ شَعْرَةٍ حَسَنَةً، وَامْحُ عَنِّي بِهَا سَيِّئَةً، وَارْفَعْ '
            'لِي بِهَا عِنْدَكَ دَرَجَةً',
        translation:
            'Allah Maha Besar (3x). Segala puji bagi Allah atas hidayah-Nya '
            'kepada kami, dan segala puji bagi Allah atas nikmat yang '
            'dikurniakan-Nya kepada kami. Ya Allah, inilah ubun-ubunku, maka '
            'terimalah daripadaku dan ampunilah dosa-dosaku. Ya Allah, '
            'ampunilah orang yang bercukur dan orang yang bergunting, wahai '
            'Tuhan Yang Maha Luas keampunan-Nya. Ya Allah, tetapkanlah bagiku '
            'satu kebaikan bagi setiap helai rambut, hapuskanlah dengannya '
            'satu kejahatan, dan angkatlah dengannya satu darjat di sisi-Mu.',
        source:
            'Nota kaki al-Ifsah (Fasal al-Halq, hlm. 344 [347]) — doa anjuran '
            'yang dicatat muhaqqiq, bukan matan an-Nawawi dan bukan hadis '
            'marfu’',
      ),
      ModuleDua(
        title: 'Doa Selepas Bercukur',
        arabic:
            'الْحَمْدُ لِلَّهِ الَّذِي قَضَى عَنِّي مَنَاسِكِي، اللَّهُمَّ '
            'زِدْنِي إِيمَانًا وَيَقِينًا وَتَوْفِيقًا وَعَوْنًا، وَاغْفِرْ لِي '
            'وَلِوَالِدَيَّ وَلِسَائِرِ الْمُسْلِمِينَ وَالْمُسْلِمَاتِ',
        translation:
            'Segala puji bagi Allah yang telah menyempurnakan manasikku. Ya '
            'Allah, tambahkanlah bagiku iman, keyakinan, taufik dan '
            'pertolongan, dan ampunilah aku, kedua ibu bapaku dan seluruh '
            'Muslimin dan Muslimat.',
        source:
            'Nota kaki al-Ifsah (Fasal al-Halq, hlm. 344 [347]) — doa anjuran '
            'yang dicatat muhaqqiq, bukan matan an-Nawawi dan bukan hadis '
            'marfu’',
      ),
    ],
    academicInsight:
        'Inti Umrah dari Makkah ialah prinsip menghimpunkan Tanah Halal dan '
        'Tanah Haram. Orang yang ber-Umrah perlu datang ke Baitullah dari '
        'luar sempadannya, walaupun hanya selangkah, sama seperti jemaah Haji '
        'yang keluar ke Arafah. Al-Ifsah menguatkannya dengan dua hujah: '
        'perintah Nabi SAW supaya Aisyah r.a. keluar ke Tan’im, dan istiqra’ '
        'bahawa setiap nusuk menghimpunkan kedua-dua tanah itu. Susunan '
        'keutamaan Ji’ranah, Tan’im dan Hudaibiyah pula menunjukkan cara '
        'mazhab menimbang dalil: perbuatan Nabi SAW didahulukan, kemudian '
        'perintah Baginda. Hukum bagi orang yang tersilap berihram di Tanah '
        'Haram menunjukkan beza antara rukun dengan wajib: Umrahnya sah, '
        'tetapi kekurangan itu ditampung dengan dam.',
    reflectionQuestions: <String>[
      'Mengapakah orang yang berihram Umrah di Tanah Haram masih sah '
          'Umrahnya, tetapi dikenakan dam? Apakah yang ditunjukkan oleh '
          'hukum ini tentang beza rukun dengan wajib?',
      'Bagaimanakah susunan afdal Ji’ranah, Tan’im dan Hudaibiyah '
          'mencerminkan cara mazhab Syafi’i menimbang perbuatan dan perintah '
          'Nabi SAW?',
      'Mengapakah talbiyah Umrah dihentikan pada permulaan Tawaf, '
          'sedangkan talbiyah Haji berterusan hingga melontar Jamrah '
          'al-‘Aqabah?',
    ],
  ),
];
