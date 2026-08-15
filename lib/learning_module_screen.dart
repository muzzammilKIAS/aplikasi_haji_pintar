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
  const LearningModuleScreen({
    required this.assessmentBox,
    required this.certificatesBox,
    super.key,
  });

  final Box<dynamic> assessmentBox;
  final Box<dynamic> certificatesBox;

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
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'وَلِلَّهِ عَلَى النَّاسِ حِجُّ الْبَيْتِ مَنِ '
                    'اسْتَطَاعَ إِلَيْهِ سَبِيلًا',
                terjemahan:
                    'Dan Allah mewajibkan manusia mengerjakan ibadah '
                    'Haji ke Baitullah, iaitu sesiapa yang mampu '
                    'mengadakan perjalanan kepadanya.',
                sumber: 'Ali-Imran (3):97',
              ),
              DalilItem(
                arabic:
                    'يَا أَيُّهَا النَّاسُ قَدْ فَرَضَ اللَّهُ عَلَيْكُمُ '
                    'الْحَجَّ فَحُجُّوا',
                terjemahan:
                    'Wahai manusia, sesungguhnya Allah telah mewajibkan '
                    'Haji ke atas kamu, maka tunaikanlah Haji.',
                sumber: 'Riwayat Muslim daripada Abu Hurairah r.a',
              ),
            ],
            teksKitab:
                'Imam an-Nawawi menyebut dalam Fasal "Idza arada al-Hajj" '
                '(apabila seseorang hendak menunaikan Haji) bahawa fardu '
                'ain baginya mempelajari kaifiyat (tatacara) Haji secara '
                'terperinci — rukun, syarat, wajib dan perkara yang '
                'membatalkannya — kerana "ibadah tidak sah daripada '
                'orang yang tidak mengetahuinya".',
            permasalahan: <String>[
              'Sesiapa yang tidak mahir tatacara Haji wajib sama ada '
                  'belajar terlebih dahulu, atau mengupah/mengikut '
                  'seorang yang arif (mursyid) yang boleh dipercayai '
                  'bagi memandu setiap langkah semasa pelaksanaan.',
            ],
          ),
        ),
        LearningSection(
          title: 'Syarat wajib Haji',
          points: <String>[
            'Beragama Islam.',
            'Baligh dan berakal.',
            'Merdeka.',
            'Mempunyai kemampuan dari sudut kewangan, kesihatan dan keselamatan perjalanan.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'وَلِلَّهِ عَلَى النَّاسِ حِجُّ الْبَيْتِ مَنِ '
                    'اسْتَطَاعَ إِلَيْهِ سَبِيلًا',
                terjemahan:
                    '...dan sesiapa yang mampu mengadakan perjalanan '
                    'kepadanya — dalil utama syarat istita’ah '
                    '(kemampuan).',
                sumber: 'Ali-Imran (3):97',
              ),
              DalilItem(
                arabic:
                    'رُفِعَ الْقَلَمُ عَنْ ثَلَاثَةٍ: عَنِ النَّائِمِ '
                    'حَتَّى يَسْتَيْقِظَ، وَعَنِ الصَّبِيِّ حَتَّى '
                    'يَحْتَلِمَ، وَعَنِ الْمَجْنُونِ حَتَّى يَعْقِلَ',
                terjemahan:
                    'Diangkat pena (tidak dikira dosa) daripada tiga '
                    'golongan: orang tidur sehingga dia bangun, '
                    'kanak-kanak sehingga dia baligh (bermimpi), dan '
                    'orang gila sehingga dia siuman (berakal) — asas '
                    'syarat baligh dan berakal.',
                sumber: 'Riwayat Abu Dawud dan at-Tirmidhi',
              ),
            ],
            teksKitab:
                'Al-Idah menyatakan: wajib haji al-Islam (kewajipan '
                'Haji sebagai rukun Islam) mempunyai lima syarat: Islam, '
                'baligh, berakal, merdeka, dan istita’ah (kemampuan). '
                'Istita’ah pula terbahagi dua: istita’ah mubasyarah '
                '(mampu melaksanakan sendiri) dan istita’ah tahsil '
                'bighairih (mampu melalui wakil/badal, khusus bagi yang '
                'uzur kekal atau telah meninggal dunia).',
            permasalahan: <String>[
              'Istita’ah mubasyarah disyaratkan lima perkara: kenderaan '
                  '(jika jarak 2 marhalah atau lebih), bekalan (zad), '
                  'keselamatan perjalanan (nafs, harta, kehormatan), '
                  'kesihatan badan, dan waktu yang mencukupi untuk sampai.',
              'Kanak-kanak dan hamba yang menunaikan Haji sah Hajinya '
                  'tetapi tidak terkira sebagai Haji fardu (Hajjatul '
                  'Islam) — wajib mengulang semula selepas baligh/merdeka, '
                  'berdasarkan hadis: "Mana-mana kanak-kanak yang '
                  'menunaikan Haji kemudian baligh, wajib ke atasnya '
                  'Haji lagi; dan mana-mana hamba yang menunaikan Haji '
                  'kemudian dimerdekakan, wajib ke atasnya Haji lagi."',
              'Wanita disyaratkan tambahan: mesti disertai suami, '
                  'mahram, atau rombongan wanita yang thiqah (dipercayai) '
                  'sepanjang perjalanan.',
            ],
          ),
        ),
        LearningSection(
          title: 'Gambaran perjalanan',
          points: <String>[
            'Berihram dan berniat di miqat.',
            'Wukuf di Arafah.',
            'Bermalam di Muzdalifah dan Mina.',
            'Melontar jamrah, bertahallul, Tawaf dan Sa’i.',
          ],
          deepDive: SectionDeepDive(
            permasalahan: <String>[
              'Ifrad — berihram dengan Haji sahaja, tanpa Umrah dalam '
                  'ihram yang sama.',
              'Tamattu’ — berihram Umrah dahulu dalam bulan-bulan Haji, '
                  'bertahallul, kemudian berihram semula dengan Haji '
                  'daripada Makkah; jenis ini mewajibkan dam sebagai '
                  'tanda kesyukuran kerana tidak perlu kembali ke miqat.',
              'Qiran — berihram dengan Haji dan Umrah serentak dalam '
                  'satu ihram tanpa bertahallul di antaranya; turut '
                  'mewajibkan dam yang sama seperti Tamattu’.',
              'Jumhur ulama Syafi’i berpendapat Ifrad lebih afdal bagi '
                  'yang berkemampuan menunaikan Umrah berasingan '
                  'selepas itu, walaupun terdapat khilaf kecil mengenai '
                  'keutamaan antara ketiga-tiga jenis ini.',
            ],
          ),
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
          title: 'Rukun Haji (lima)',
          points: <String>[
            'Ihram (niat).',
            'Wukuf di Arafah.',
            'Tawaf Ifadah.',
            'Sa’i antara Safa dan Marwah.',
            'Bercukur atau bergunting (halq/taqsir).',
          ],
          deepDive: SectionDeepDive(
            teksKitabArabic: 'أَمَّا الْأَرْكَانُ: فَخَمْسَةٌ',
            teksKitab:
                'Dalam Fasal "A’mal al-Hajj thalathah aqsam: arkan wa '
                'wajibat wa sunan" (amalan Haji terbahagi tiga bahagian: '
                'rukun, wajib dan sunat), Imam an-Nawawi menyebut petikan '
                'di atas — bermaksud "adapun rukun-rukun itu ada lima" '
                '— iaitu Ihram, Wukuf, Tawaf Ifadah, Sa’i dan Halq. '
                'Beliau turut menegaskan tertib (susunan) sengaja tidak '
                'dikira sebagai rukun keenam yang berasingan.',
            permasalahan: <String>[
              'Rukun ialah komponen yang MESTI ada dan TIDAK boleh '
                  'digantikan dengan dam — Haji tidak sempurna sehingga '
                  'rukun itu dilaksanakan, walaupun terlepas musim.',
              'Sesetengah ulama Hanbali dan sebahagian riwayat mazhab '
                  'lain mengira "tertib" sebagai rukun tambahan; Imam '
                  'an-Nawawi memilih pendapat yang tidak menganggapnya '
                  'rukun berasingan, sebaliknya syarat bagi kesahan '
                  'kebanyakan rukun tersebut.',
              'Halq/taqsir (bercukur/bergunting) sebagai rukun (bukan '
                  'sekadar wajib) adalah pendapat termu’tamad mazhab '
                  'Syafi’i; sebahagian mazhab lain (seperti Hanafi) '
                  'menganggapnya wajib sahaja yang boleh diganti dam.',
            ],
          ),
        ),
        LearningSection(
          title: 'Wajib Haji (enam)',
          points: <String>[
            'Berihram dari miqat yang ditetapkan.',
            'Jam’ (berada) siang dan malam di Arafah sebelum meninggalkannya.',
            'Bermalam (mabit) di Muzdalifah.',
            'Bermalam (mabit) di Mina pada malam-malam Tasyriq.',
            'Melontar ketiga-tiga jamrah mengikut susunan.',
            'Melaksanakan Tawaf Wada’.',
          ],
          deepDive: SectionDeepDive(
            teksKitab:
                'Al-Idah menyenaraikan wajib Haji sebagai: dua perkara '
                'yang disepakati (ihram dari miqat, melontar jamrah) dan '
                'empat lagi yang diperselisihkan tetapi diambil sebagai '
                'ashah (paling sahih) — jam’ siang-malam di Arafah, '
                'mabit Muzdalifah, mabit malam-malam Mina, dan Tawaf '
                'Wada’.',
            permasalahan: <String>[
              'Wajib berbeza daripada rukun — jika ditinggalkan tanpa '
                  'uzur, Hajinya tetap SAH tetapi wajib membayar dam '
                  'sebagai gantian.',
              'Status Tawaf Wada’ sebagai wajib turut diperselisihkan '
                  'ulama — sebahagian menganggapnya sunat bagi golongan '
                  'tertentu (contoh: wanita haid yang tidak sempat '
                  'bertawaf sebelum bertolak).',
              'Mabit di Muzdalifah dianggap sempurna sekadar hadir '
                  'sesaat sahaja selepas tengah malam, manakala mabit di '
                  'Mina memerlukan kehadiran majoriti (kebanyakan) '
                  'malam tersebut menurut pendapat mu’tamad.',
            ],
          ),
        ),
        LearningSection(
          title: 'Perbezaan ringkas',
          points: <String>[
            'Rukun yang ditinggalkan menyebabkan Haji tidak sempurna sehingga rukun itu dilaksanakan — tertib (susunan) hanya syarat bagi kebanyakan rukun, bukan rukun keenam yang berasingan.',
            'Wajib Haji yang ditinggalkan boleh menyebabkan kewajipan dam, tertakluk kepada keadaan dan hukum — Hajinya tetap sah.',
            'Larangan ihram (muharramat / محظورات) adalah topik berasingan daripada wajib Haji, masing-masing dengan kifaratnya sendiri.',
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
          'menentukan kesahan dan kesempurnaan ibadah. Menurut al-Idah '
          'karangan Imam an-Nawawi, rukun Haji ada lima: Ihram, Wukuf di '
          'Arafah, Tawaf Ifadah, Sa\u2019i, dan bercukur/bergunting — '
          'Imam an-Nawawi sengaja tidak mengira "tertib" (susunan) '
          'sebagai rukun keenam yang berasingan, sebaliknya ia hanya '
          'syarat sah bagi kebanyakan rukun tersebut. Wajib Haji pula '
          'berbeza daripada rukun kerana ia boleh digantikan dengan dam '
          'jika ditinggalkan tanpa uzur, sementara Hajinya tetap sah — '
          'termasuk berihram dari miqat, jam\u2019 di Arafah, mabit '
          'Muzdalifah, mabit Mina, melontar ketiga-tiga jamrah, dan '
          'Tawaf Wada\u2019. Perbezaan pendapat kecil turut wujud antara '
          'mazhab mengenai sesetengah perkara (contoh: status Tawaf '
          'Wada\u2019 sebagai wajib atau sunat bagi golongan tertentu), '
          'justeru jemaah digalakkan merujuk pembimbing Haji bertauliah '
          'bagi isu yang lebih terperinci.',
      reflectionQuestions: <String>[
        'Mengapakah Imam an-Nawawi tidak mengira "tertib" (susunan) '
            'sebagai rukun keenam yang berasingan, sebaliknya hanya '
            'syarat bagi kebanyakan rukun Haji?',
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
          title: 'Tujuh Larangan Ihram (al-Muharramat as-Sab’ah)',
          points: <String>[
            '1. Pakaian — lelaki dilarang memakai pakaian berjahit yang mengikut bentuk badan; wanita pula dilarang menutup wajah dan memakai sarung tangan.',
            '2. Wangian — tidak memakai atau menyapu bahan berbau wangi pada badan, pakaian atau makanan selepas niat ihram.',
            '3. Meminyakkan rambut — tidak meminyakkan atau meletak bahan solek pada rambut kepala dan janggut.',
            '4. Mencukur & memotong kuku — tidak mencukur/mencabut rambut badan atau memotong kuku tanpa uzur syarie.',
            '5. Akad nikah — tidak boleh menikah atau menikahkan orang lain semasa dalam ihram.',
            '6. Jimak dan pendahuluannya — dilarang sepenuhnya sehingga tahallul; membatalkan Haji jika berlaku sebelum tahallul awal.',
            '7. Memburu — dilarang membunuh atau memburu binatang buruan darat yang halal dimakan.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'فَلَا رَفَثَ وَلَا فُسُوقَ وَلَا جِدَالَ فِي '
                    'الْحَجِّ',
                terjemahan:
                    '...maka tidak boleh berkata kotor, berbuat fasiq '
                    'dan berbantah-bantahan dalam masa mengerjakan Haji '
                    '— asas larangan jimak dan perbuatan tidak elok '
                    'semasa ihram.',
                sumber: 'Al-Baqarah (2):197',
              ),
              DalilItem(
                arabic:
                    'يَا أَيُّهَا الَّذِينَ آمَنُوا لَا تَقْتُلُوا '
                    'الصَّيْدَ وَأَنتُمْ حُرُمٌ',
                terjemahan:
                    'Wahai orang-orang yang beriman, janganlah kamu '
                    'membunuh binatang buruan sedang kamu dalam ihram '
                    '(Haji atau Umrah).',
                sumber: 'Al-Ma’idah (5):95',
              ),
              DalilItem(
                arabic:
                    'لَا يَلْبَسُ الْقَمِيصَ وَلَا الْعَمَائِمَ وَلَا '
                    'السَّرَاوِيلَاتِ وَلَا الْبَرَانِسَ وَلَا الْخِفَافَ',
                terjemahan:
                    '(Orang yang berihram) tidak boleh memakai qamis '
                    '(baju berjahit), serban, seluar, burnus (jubah '
                    'bertudung) atau khuf (kasut menutup buku lali).',
                sumber: 'Riwayat al-Bukhari daripada Ibnu Umar r.a',
              ),
            ],
            teksKitab:
                'Al-Idah menyusun larangan ihram dalam Fasal '
                '"Muharramat al-Ihram" kepada tujuh jenis (an-naw’ '
                'al-awwal hingga as-sabi’): pakaian, wangian, minyak '
                'rambut, cukur/potong kuku, akad nikah, jimak dan '
                'pendahuluannya, serta memburu — masing-masing dengan '
                'kifarat tersendiri.',
            permasalahan: <String>[
              'Fidyah tidak menghalalkan pelanggaran — sesiapa yang '
                  'sengaja melanggar sambil berkata "aku akan bayar '
                  'fidyah" tetap berdosa walaupun fidyahnya sah, kerana '
                  'fidyah tidak mengangkat keharaman perbuatan itu '
                  'sendiri.',
              'Setiap 7 kategori mempunyai kifarat berlainan: sebahagian '
                  'wajib fidyah walau sedikit (contoh: mencukur beberapa '
                  'helai rambut), sebahagian mengikut nilai barang yang '
                  'dimusnahkan (memburu), dan jimak sebelum tahallul '
                  'awal membatalkan Haji serta wajib qada pada tahun '
                  'berikutnya di samping dam.',
            ],
          ),
        ),
        LearningSection(
          title: 'Persamaan lelaki dan wanita',
          points: <String>[
            'Wanita dikenakan ketujuh-tujuh larangan yang sama seperti lelaki, kecuali dua perkara: dibenarkan memakai pakaian berjahit dan menutup kepala, tetapi dilarang menutup wajah dan memakai sarung tangan.',
            'Kejahilan hukum atau terlupa memaafkan dosa tetapi tidak semestinya menggugurkan fidyah bagi sesetengah larangan — segera hentikan sebaik menyedari kesilapan.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'لَا تَنْتَقِبُ الْمَرْأَةُ الْمُحْرِمَةُ وَلَا '
                    'تَلْبَسُ الْقُفَّازَيْنِ',
                terjemahan:
                    'Wanita yang berihram tidak boleh memakai niqab '
                    '(penutup muka) dan tidak boleh memakai sarung '
                    'tangan.',
                sumber: 'Riwayat al-Bukhari daripada Ibnu Umar r.a',
              ),
            ],
            permasalahan: <String>[
              'Jumhur ulama Syafi’i bersepakat kesalahan yang '
                  'dilakukan secara terlupa, tidak sengaja, atau kerana '
                  'jahil (tidak tahu hukum) dimaafkan dosanya dan tidak '
                  'diwajibkan dam bagi larangan tertentu — namun wajib '
                  'berhenti serta-merta sebaik menyedari kesilapan; '
                  'bagi larangan lain (seperti memburu) fidyah tetap '
                  'wajib walaupun tidak sengaja.',
              'Jika wanita perlu menutup wajah kerana fitnah/pandangan '
                  'lelaki ajnabi, dibenarkan menggunakan kain yang '
                  'dijarakkan daripada wajah (tidak melekat terus pada '
                  'kulit), bukan niqab biasa.',
            ],
          ),
        ),
        LearningSection(
          title: 'Adab dan akhlak sepanjang ihram',
          points: <String>[
            'Menjaga percakapan, kesabaran dan adab sepanjang ibadah.',
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
          'Fasal Muharramat al-Ihram dalam al-Idah menyusun larangan '
          'ihram kepada tujuh jenis (an-naw\u2019 al-awwal hingga '
          'as-sabi\u2019): pakaian, wangian, minyak rambut, cukur/potong '
          'kuku, akad nikah, jimak dan pendahuluannya, serta memburu '
          '— masing-masing dengan hukum kifarat yang tersendiri. Secara '
          'kolektif ia berfungsi sebagai latihan mujahadah (pengekangan '
          'diri) yang intensif. Jemaah dilatih meninggalkan tabiat '
          'harian demi menghayati status ihram sebagai keadaan suci '
          'yang istimewa, mengingatkan kepada fitrah manusia yang '
          'bersih daripada sebarang perhiasan duniawi. Imam an-Nawawi '
          'turut menegaskan bahawa fidyah bukanlah "tiket" yang '
          'mengharuskan pelanggaran — sesiapa yang sengaja melanggar '
          'sambil berkata "aku akan bayar fidyah" tetap berdosa '
          'walaupun fidyahnya sah, kerana fidyah tidak mengangkat '
          'keharaman perbuatan itu sendiri. Jumhur ulama turut '
          'bersepakat bahawa kesalahan yang dilakukan secara terlupa, '
          'tidak sengaja, atau kerana jahil (tidak tahu hukum) '
          'dimaafkan dan tidak diwajibkan dam — namun jemaah wajib '
          'berhenti serta merta sebaik sahaja menyedari kesilapan.',
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
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'فَمَن كَانَ مِنكُم مَّرِيضًا أَوْ بِهِ أَذًى مِّن '
                    'رَّأْسِهِ فَفِدْيَةٌ مِّن صِيَامٍ أَوْ صَدَقَةٍ '
                    'أَوْ نُسُكٍ',
                terjemahan:
                    '...maka sesiapa di antara kamu yang sakit atau ada '
                    'gangguan di kepalanya (lalu terpaksa bercukur), '
                    'wajiblah dia membayar fidyah, iaitu berpuasa, atau '
                    'bersedekah, atau berkorban.',
                sumber: 'Al-Baqarah (2):196',
              ),
              DalilItem(
                arabic:
                    'فَإِذَا أَمِنتُمْ فَمَن تَمَتَّعَ بِالْعُمْرَةِ '
                    'إِلَى الْحَجِّ فَمَا اسْتَيْسَرَ مِنَ الْهَدْيِ',
                terjemahan:
                    'Kemudian apabila kamu berada dalam keadaan aman, '
                    'maka sesiapa yang ingin mengerjakan Umrah sebelum '
                    'Haji (dalam bulan-bulan Haji), wajiblah dia '
                    'menyembelih korban yang mudah didapati — dalil dam '
                    'Tamattu’.',
                sumber: 'Al-Baqarah (2):196',
              ),
            ],
            teksKitab:
                'Bab Ketujuh al-Idah — "Fima yajib ala man taraka min '
                'nusukihi ma’muran aw irtakaba muharraman" (perkara '
                'yang wajib ke atas sesiapa yang meninggalkan perkara '
                'diperintah atau melakukan perkara yang dilarang) — '
                'menjelaskan dam sebagai mekanisme penyelesaian, bukan '
                'pembatal ibadah.',
          ),
        ),
        LearningSection(
          title: 'Dua kategori utama dam',
          points: <String>[
            'Dam tertib-taqdir — bagi meninggalkan wajib Haji (contoh: tidak bermalam di Muzdalifah/Mina): wajib sembelih kambing; jika tak mampu, puasa 3 hari semasa Haji dan 7 hari selepas pulang.',
            'Dam takhyir-taqdir — bagi larangan ihram akibat uzur (contoh: mencukur kerana sakit): pilih antara sembelih, sedekah kepada 6 orang miskin, atau puasa 3 hari.',
            'Dam Tamattu’ dan Qiran — wajib ke atas jemaah yang menggabungkan Umrah dan Haji dalam satu musim tanpa kembali ke miqat asal.',
          ],
          deepDive: SectionDeepDive(
            permasalahan: <String>[
              'Dam tertib-taqdir dinamakan "tertib" kerana susunannya '
                  'wajib diikuti — sembelih dahulu, jika tidak mampu '
                  'barulah beralih kepada puasa; tidak boleh terus '
                  'memilih puasa walaupun mampu berpuasa dengan mudah.',
              'Dam takhyir-taqdir pula membenarkan jemaah memilih '
                  'terus antara tiga kaedah tanpa perlu mengikut '
                  'susunan tertentu, kerana puncanya (uzur) berbeza '
                  'sifatnya daripada meninggalkan wajib.',
              'Dam Tamattu’/Qiran tergolong dalam kategori "dam '
                  'nusuk" (dam kesyukuran), bukan dam jenayah/kesalahan '
                  '— justeru masih boleh dimakan sebahagian dagingnya '
                  'oleh yang berkorban, berbeza daripada dam kifarat '
                  'yang wajib dihabiskan kepada fakir miskin.',
            ],
          ),
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
          'Syariat dam mencerminkan sifat rahmat Allah SWT dalam ibadah '
          'Haji — kesilapan atau kekurangan yang berlaku tidak '
          'semestinya membatalkan seluruh ibadah, sebaliknya boleh '
          'diselesaikan melalui mekanisme tertentu. Bab Ketujuh al-Idah '
          'membahagikan dam kepada dua kategori utama: dam tertib dan '
          'taqdir (bagi meninggalkan wajib Haji, urutannya mesti '
          'diikuti — sembelih dahulu, jika tak mampu barulah berpuasa) '
          'dan dam takhyir dan taqdir (bagi larangan ihram akibat '
          'uzur, jemaah bebas memilih antara tiga kaedah tanpa '
          'urutan). Asas pensyariatan dam turut disebut dalam '
          'Al-Baqarah ayat 196 berkaitan Haji Tamattu\u2019. Sikap '
          'paling bijaksana bagi jemaah ialah mencatat sebarang '
          'keraguan dan merujuk pihak berautoriti, bukan membuat '
          'kesimpulan sendiri yang mungkin tidak tepat.',
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
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا '
                    'شَرِيكَ لَكَ لَبَّيْكَ، إِنَّ الْحَمْدَ '
                    'وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ',
                terjemahan:
                    'Aku sahut panggilan-Mu ya Allah, aku sahut '
                    'panggilan-Mu. Aku sahut panggilan-Mu, tiada '
                    'sekutu bagi-Mu, aku sahut panggilan-Mu. '
                    'Sesungguhnya segala puji, nikmat dan kerajaan '
                    'adalah milik-Mu, tiada sekutu bagi-Mu.',
                sumber: 'Riwayat al-Bukhari dan Muslim daripada Ibnu Umar r.a',
              ),
            ],
            permasalahan: <String>[
              'Talbiyah disunatkan diperbanyak dan dikuatkan suara bagi '
                  'lelaki (mengikut kemampuan tanpa membebankan diri), '
                  'manakala wanita cukup sekadar didengari oleh dirinya '
                  'sendiri.',
              'Talbiyah diputuskan (dihentikan) apabila memulakan Tawaf '
                  '— berbeza pendapat sama ada dihentikan serentak '
                  'dengan permulaan Tawaf atau selepas melihat Kaabah, '
                  'dan mazhab Syafi’i mengambil pendapat yang pertama.',
            ],
          ),
        ),
        LearningSection(
          title: 'Doa kebaikan dunia dan akhirat',
          points: <String>[
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
            'Ya Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan di akhirat serta peliharalah kami daripada azab neraka.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي '
                    'الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
                terjemahan:
                    'Wahai Tuhan kami, berikanlah kepada kami kebaikan '
                    'di dunia dan kebaikan di akhirat, dan peliharalah '
                    'kami daripada azab neraka.',
                sumber: 'Al-Baqarah (2):201',
              ),
              DalilItem(
                terjemahan:
                    'Doa ini adalah doa yang paling kerap dibaca oleh '
                    'Rasulullah SAW.',
                sumber:
                    'Riwayat al-Bukhari dan Muslim daripada Anas bin '
                    'Malik r.a',
              ),
            ],
            permasalahan: <String>[
              'Ulama tafsir menjelaskan "kebaikan di dunia" merangkumi '
                  'kesihatan, rezeki halal, ilmu bermanfaat dan '
                  'keluarga soleh; "kebaikan di akhirat" pula merujuk '
                  'syurga dan keredaan Allah — doa ini ringkas tetapi '
                  'merangkumi seluruh kebaikan hidup.',
            ],
          ),
        ),
        LearningSection(
          title: 'Amalan umum',
          points: <String>[
            'Berdoa menggunakan bahasa yang difahami.',
            'Perbanyakkan istighfar, selawat, tasbih, tahmid dan takbir.',
            'Utamakan keikhlasan dan kefahaman berbanding menghafal tanpa menghayati.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic: 'الدُّعَاءُ هُوَ الْعِبَادَةُ',
                terjemahan:
                    'Doa itu adalah ibadah — menunjukkan kedudukan doa '
                    'setaraf dengan ibadah lain seperti solat dan '
                    'puasa.',
                sumber: 'Riwayat at-Tirmidhi dan Abu Dawud',
              ),
            ],
            permasalahan: <String>[
              'Ulama membahagikan doa kepada dua kategori: doa ma’thur '
                  '(bersumberkan Al-Quran dan hadis sahih) dan doa '
                  'peribadi dalam bahasa sendiri — kedua-duanya '
                  'digalakkan digabungkan, bukan salah satu sahaja.',
              'Berdoa dalam bahasa yang tidak difahami (menghafal '
                  'semata-mata tanpa erti) tidak salah dari sudut hukum, '
                  'tetapi kurang sempurna dari sudut kekhusyukan — '
                  'justeru memahami makna doa lebih diutamakan.',
            ],
          ),
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
      subtitle: 'Jawab 21 soalan dan capai sekurang-kurangnya 80% untuk lulus.',
      icon: HajjIconType.quiz,
      accent: Color(0xFFCE7A38),
      sections: <LearningSection>[
        LearningSection(
          title: 'Format penilaian',
          points: <String>[
            'Penilaian mengandungi 21 soalan pilihan jawapan.',
            'Markah lulus ialah 80% atau sekurang-kurangnya 17 jawapan betul.',
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
        child: Stack(
          children: <Widget>[
            const IslamicPatternOverlay(),
            SafeArea(
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
                                                 certificatesBox: certificatesBox,
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
          ],
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
                    ...module.sections.expand((LearningSection section) {
                      return <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _LearningSectionCard(
                            section: section,
                            accent: module.accent,
                          ),
                        ),
                        // Kad "Perbahasan Lanjut" — kotak BERASINGAN, hanya
                        // dipaparkan jika tajuk ini ada kandungan lanjut.
                        // Diinden sedikit ke kanan (margin kiri) supaya
                        // kelihatan sebagai kotak sisipan berlainan
                        // daripada kad penerangan utama di atasnya.
                        if (section.deepDive != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 22,
                              bottom: 14,
                            ),
                            child: _DeepDiveCard(
                              deepDive: section.deepDive!,
                            ),
                          )
                        else
                          const SizedBox(height: 4),
                      ];
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
  const LearningSection({
    required this.title,
    required this.points,
    this.deepDive,
  });

  final String title;
  final List<String> points;

  /// Kajian lanjut (dalil, teks kitab, permasalahan) bagi tajuk ini.
  /// `null` bermakna tiada kajian lanjut disediakan untuk tajuk ini —
  /// penerangan ringkas di `points` di atas sudah memadai. Dipaparkan
  /// dalam kad BERASINGAN daripada kad senarai `points`, supaya
  /// pembaca awam kekal cukup dengan penerangan ringkas manakala
  /// pembaca yang mahu menelaah lebih mendalam boleh membuka kad ini.
  final SectionDeepDive? deepDive;
}

/// Kandungan kajian lanjut bagi satu tajuk (`LearningSection`) — dalil
/// (ayat Al-Quran/hadis dengan sumber), petikan/rujukan teks kitab, dan
/// permasalahan/khilaf fiqh yang berkaitan. Direka untuk pembaca yang
/// mahu menelaah lebih mendalam daripada penerangan ringkas sedia ada.
class SectionDeepDive {
  const SectionDeepDive({
    this.dalil = const <DalilItem>[],
    this.teksKitab,
    this.teksKitabArabic,
    this.permasalahan = const <String>[],
  });

  /// Senarai dalil (ayat Al-Quran, hadis) — setiap satu berstruktur
  /// (teks Arab, terjemahan, sumber) supaya teks Arab boleh dipaparkan
  /// dengan fon yang betul, berasingan daripada terjemahannya.
  final List<DalilItem> dalil;

  /// Penerangan/parafrasa ringkas (Bahasa Melayu) daripada fasal atau
  /// bab kitab al-Idah yang berkaitan, termasuk nama fasal itu sendiri.
  final String? teksKitab;

  /// Petikan teks Arab sebenar daripada kitab al-Idah (jika ada),
  /// dipaparkan berasingan daripada [teksKitab] dengan fon Arab.
  final String? teksKitabArabic;

  /// Permasalahan, khilaf ulama, atau isu fiqh lanjut yang berkaitan
  /// dengan tajuk ini.
  final List<String> permasalahan;
}

/// Satu dalil (ayat Al-Quran atau hadis) lengkap dengan teks Arab,
/// terjemahan Bahasa Melayu, dan sumber/rujukannya.
class DalilItem {
  const DalilItem({
    this.arabic,
    required this.terjemahan,
    required this.sumber,
  });

  /// Teks Arab asal berserta tashkeel (jika ada). `null` jika dalil ini
  /// dirujuk secara umum tanpa petikan lafaz penuh.
  final String? arabic;

  /// Terjemahan makna dalam Bahasa Melayu.
  final String terjemahan;

  /// Sumber/rujukan (contoh: "Al-Baqarah 2:196" atau "Riwayat al-Bukhari").
  final String sumber;
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

class _LearningModuleCard extends StatelessWidget {
  const _LearningModuleCard({required this.module, required this.onTap});

  final LearningModuleData module;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;

    return HajjHoverCard(
      accent: module.accent,
      onTap: onTap,
      borderRadius: 24,
      padding: const EdgeInsets.all(20),
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

/// Kad "Perbahasan Lanjut" — BERASINGAN sepenuhnya daripada
/// [_LearningSectionCard] di atas. Tertutup (collapsed) secara lalai
/// supaya pembaca awam tidak terganggu; pembaca yang mahu menelaah
/// dalil, teks kitab dan permasalahan lanjut boleh membukanya sendiri.
/// Label kecil "KAD SUBTAJUK" (DALIL / TEKS KITAB / PERMASALAHAN) di
/// dalam kad Perbahasan Lanjut \u2014 ikon dalam badge bulat + tajuk berhuruf
/// besar, gaya konsisten merentasi ketiga-tiga subseksyen.
class _DeepDiveSubheading extends StatelessWidget {
  const _DeepDiveSubheading({
    required this.icon,
    required this.label,
    required this.accent,
    this.iconSize = 13,
  });

  final IconData icon;
  final String label;
  final Color accent;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.16),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: iconSize, color: accent),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: accent,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}

/// Satu kad mini memaparkan satu [DalilItem] \u2014 teks Arab (fon Amiri,
/// susunan kanan-ke-kiri) di atas, terjemahan Bahasa Melayu di bawah,
/// dan sumber rujukan di penghujung. Latar/sempadan disesuaikan
/// mengikut mod gelap/terang supaya kekal jelas dibaca dalam kedua-dua
/// tema.
class _DalilTile extends StatelessWidget {
  const _DalilTile({required this.item, required this.accent});

  final DalilItem item;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final bool isDark = context.isDarkMode;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.04)
            : accent.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.10)
              : accent.withValues(alpha: 0.14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (item.arabic != null) ...<Widget>[
            Text(
              item.arabic!,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.amiri(
                color: colors.onSurface,
                fontSize: 19,
                height: 1.9,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Container(height: 1, color: accent.withValues(alpha: 0.12)),
            const SizedBox(height: 8),
          ],
          Text(
            item.terjemahan,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 12.5,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.bookmark_rounded, size: 12, color: accent),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  item.sumber,
                  style: TextStyle(
                    color: palette.mutedText,
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Cip kecil ikon + label memaparkan subseksyen yang tersedia di dalam
/// kad Perbahasan Lanjut \u2014 kekal kelihatan pada header walaupun kad masih
/// tertutup, supaya pembaca tahu apa yang ada di dalamnya tanpa perlu
/// membukanya dahulu.
class _DeepDivePreviewChip extends StatelessWidget {
  const _DeepDivePreviewChip({
    required this.icon,
    required this.label,
    required this.accent,
  });

  final IconData icon;
  final String label;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 11, color: accent),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: accent,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Kad "Perbahasan Lanjut" \u2014 BERASINGAN sepenuhnya daripada penerangan
/// ringkas sedia ada. Tertutup (collapsed) secara lalai supaya pembaca
/// awam tidak terganggu; pembaca yang mahu menelaah dalil, teks kitab
/// dan permasalahan lanjut boleh membukanya sendiri. Reka bentuk dan
/// warna disesuaikan mengikut mod gelap/terang.
class _DeepDiveCard extends StatefulWidget {
  const _DeepDiveCard({required this.deepDive});

  final SectionDeepDive deepDive;

  @override
  State<_DeepDiveCard> createState() => _DeepDiveCardState();
}

class _DeepDiveCardState extends State<_DeepDiveCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final HajjColors palette = context.hajjColors;
    final ColorScheme colors = context.appColorScheme;
    final bool isDark = context.isDarkMode;
    final SectionDeepDive data = widget.deepDive;
    // Warna identiti tetap "Perbahasan Lanjut" — sengaja TIDAK ikut
    // aksen modul (yang berbeza-beza), supaya kotak ini kekal konsisten
    // dan pekat merentasi semua modul, pada kedua-dua mod gelap/terang.
    final Color accent = palette.gold;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark
            ? accent.withValues(alpha: 0.16)
            : accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? accent.withValues(alpha: 0.55)
              : accent.withValues(alpha: 0.45),
          width: 1.4,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: accent.withValues(alpha: isDark ? 0.18 : 0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 34,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: isDark ? 0.20 : 0.13),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.auto_stories_rounded,
                        color: accent,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Perbahasan Lanjut',
                            style: TextStyle(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 3),
                          // Pratonton ikon subseksyen yang tersedia \u2014
                          // kekal kelihatan walaupun kad masih tertutup,
                          // supaya pembaca tahu apa yang ada di dalam
                          // tanpa perlu membukanya dahulu.
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 4,
                            children: <Widget>[
                              if (data.dalil.isNotEmpty)
                                _DeepDivePreviewChip(
                                  icon: Icons.menu_book_rounded,
                                  label: 'Dalil',
                                  accent: accent,
                                ),
                              if (data.teksKitab != null)
                                _DeepDivePreviewChip(
                                  icon: Icons.rate_review_rounded,
                                  label: 'Teks kitab',
                                  accent: accent,
                                ),
                              if (data.permasalahan.isNotEmpty)
                                _DeepDivePreviewChip(
                                  icon: Icons.warning_amber_rounded,
                                  label: 'Permasalahan',
                                  accent: accent,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 220),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: accent,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  child: !expanded
                      ? const SizedBox(width: double.infinity)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 14),
                            Container(
                              height: 1,
                              color: accent.withValues(alpha: 0.15),
                            ),
                            const SizedBox(height: 16),
                            if (data.dalil.isNotEmpty) ...<Widget>[
                              _DeepDiveSubheading(
                                icon: Icons.menu_book_rounded,
                                label: 'DALIL',
                                accent: accent,
                              ),
                              const SizedBox(height: 10),
                              ...data.dalil.map(
                                (DalilItem item) =>
                                    _DalilTile(item: item, accent: accent),
                              ),
                              const SizedBox(height: 4),
                            ],
                            if (data.teksKitab != null) ...<Widget>[
                              _DeepDiveSubheading(
                                icon: Icons.rate_review_rounded,
                                label: 'TEKS KITAB',
                                accent: accent,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.white.withValues(alpha: 0.04)
                                      : accent.withValues(alpha: 0.045),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: isDark
                                        ? Colors.white.withValues(alpha: 0.10)
                                        : accent.withValues(alpha: 0.14),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    if (data.teksKitabArabic != null) ...<Widget>[
                                      Text(
                                        data.teksKitabArabic!,
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        style: GoogleFonts.amiri(
                                          color: colors.onSurface,
                                          fontSize: 19,
                                          height: 1.9,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 1,
                                        color: accent.withValues(alpha: 0.12),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                    Text(
                                      data.teksKitab!,
                                      style: TextStyle(
                                        color: colors.onSurface,
                                        fontSize: 12.5,
                                        height: 1.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 14),
                            ],
                            if (data.permasalahan.isNotEmpty) ...<Widget>[
                              _DeepDiveSubheading(
                                icon: Icons.warning_amber_rounded,
                                iconSize: 15,
                                label: 'PERMASALAHAN',
                                accent: accent,
                              ),
                              const SizedBox(height: 10),
                              ...data.permasalahan.map(
                                (String item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: accent,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            color: colors.onSurface,
                                            fontSize: 12.5,
                                            height: 1.55,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
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
              'Kandungan ini adalah prototaip yang diambil '
              'daripada kitab al-Idah fi Manasik al-Hajj wa '
              'al-Umrah karangan Imam an-Nawawi (mazhab '
              'Syafi’i). Semak kandungan akhir bersama '
              'pembimbing Haji atau panel syariah yang '
              'berautoriti sebelum dijadikan rujukan hukum.',
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
              Icon(Icons.check_circle_rounded, color: accent, size: 22),
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
