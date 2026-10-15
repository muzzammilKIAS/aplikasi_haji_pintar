import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'final_assessment_screen.dart';
import 'islamic_icons.dart';
import 'interactive_ihram_module.dart';
import 'interactive_learning_module.dart';
import 'kandungan/idah_bab1_bab2.dart';
import 'kandungan/idah_bab3_arafah_muzdalifah.dart';
import 'kandungan/idah_bab3_nahr_tasyriq.dart';
import 'kandungan/idah_bab3_tawaf_sai.dart';
import 'kandungan/idah_bab4_umrah.dart';
import 'kandungan/idah_bab5_bab6.dart';
import 'kandungan/idah_bab7_bab8.dart';
import 'prismatic_widgets.dart';

// ---------------------------------------------------------------------------
// KOLEKSI DOA & ZIKIR MANASIK — dipetik daripada al-Idah fi Manasik al-Hajj
// wa al-‘Umrah karangan Imam an-Nawawi (Shamela, book_id 96232), disusun
// mengikut turutan perjalanan. Teks Arab disalin huruf demi huruf daripada
// matan al-Idah (kecuali yang dinyatakan berasal daripada nota kaki
// al-Ifsah), dengan baris standard. Sumber setiap doa menyatakan statusnya
// secara jujur: hadis marfu’ hanya disebut apabila takhrijnya disahkan.
// ---------------------------------------------------------------------------

// 1. Musafir dan keluar rumah
const ModuleDua _duaKeluarRumah = ModuleDua(
  title: 'Doa Keluar Rumah',
  arabic:
      'بِسْمِ اللَّهِ، تَوَكَّلْتُ عَلَى اللَّهِ، لَا حَوْلَ وَلَا قُوَّةَ '
      'إِلَّا بِاللَّهِ',
  translation:
      'Dengan nama Allah, aku bertawakal kepada Allah; tiada daya dan '
      'tiada kekuatan melainkan dengan (pertolongan) Allah.',
  source:
      'Riwayat Abu Dawud dan at-Tirmidhi daripada Anas r.a.; al-Idah (Bab '
      'Adab Musafir) — sunat bagi setiap orang yang keluar rumah',
);

const ModuleDua _duaMenaikiKenderaan = ModuleDua(
  title: 'Doa Menaiki Kenderaan',
  arabic:
      'بِسْمِ اللَّهِ، الْحَمْدُ لِلَّهِ، سُبْحَانَ الَّذِي سَخَّرَ '
      'لَنَا هَـٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ، وَإِنَّا إِلَىٰ '
      'رَبِّنَا لَمُنْقَلِبُونَ. اللَّهُمَّ إِنَّا نَسْأَلُكَ فِي '
      'سَفَرِنَا هَـٰذَا الْبِرَّ وَالتَّقْوَىٰ، وَمِنَ الْعَمَلِ مَا '
      'تُحِبُّ وَتَرْضَىٰ. اللَّهُمَّ هَوِّنْ عَلَيْنَا سَفَرَنَا '
      'وَاطْوِ عَنَّا بُعْدَهُ. اللَّهُمَّ أَنْتَ الصَّاحِبُ فِي '
      'السَّفَرِ وَالْخَلِيفَةُ فِي الْأَهْلِ وَالْمَالِ. اللَّهُمَّ '
      'إِنَّا نَعُوذُ بِكَ مِنْ وَعْثَاءِ السَّفَرِ، وَكَآبَةِ '
      'الْمُنْقَلَبِ، وَسُوءِ الْمَنْظَرِ فِي الْأَهْلِ وَالْمَالِ '
      'وَالْوَلَدِ',
  translation:
      'Segala puji bagi Allah. Maha Suci Tuhan yang telah menundukkan '
      'kenderaan ini untuk kami, sedangkan kami tidak mampu menguasainya, '
      'dan sesungguhnya kepada Tuhan kamilah kami akan kembali. Ya Allah, '
      'kami memohon kepada-Mu dalam perjalanan kami ini kebajikan dan '
      'takwa, serta amalan yang Engkau sukai dan redai. Ya Allah, '
      'permudahkanlah perjalanan kami dan dekatkanlah jaraknya yang jauh. '
      'Ya Allah, Engkaulah Teman dalam perjalanan dan Pengganti yang '
      'menjaga keluarga dan harta. Ya Allah, kami berlindung kepada-Mu '
      'daripada kesukaran perjalanan, kesedihan ketika kembali, dan '
      'pemandangan yang buruk pada keluarga, harta dan anak.',
  source:
      'Al-Idah (Bab Adab Musafir) — an-Nawawi menghimpunnya daripada '
      'hadis sahih; asas lafaznya riwayat Muslim daripada Ibnu Umar r.a. '
      '(ringkasan)',
);

const ModuleDua _duaMelepaskanMusafir = ModuleDua(
  title: 'Doa Ketika Berpisah dengan Keluarga',
  arabic:
      'أَسْتَوْدِعُ اللَّهَ دِينَكَ وَأَمَانَتَكَ وَخَوَاتِيمَ عَمَلِكَ، '
      'زَوَّدَكَ اللَّهُ التَّقْوَى، وَغَفَرَ ذَنْبَكَ، وَيَسَّرَ لَكَ '
      'الْخَيْرَ حَيْثُ كُنْتَ',
  translation:
      'Aku titipkan kepada Allah agamamu, amanahmu dan penghujung '
      'amalanmu. Semoga Allah membekalkanmu dengan takwa, mengampunkan '
      'dosamu dan memudahkan kebaikan untukmu di mana jua engkau berada.',
  source:
      'Al-Idah (Bab Adab Musafir) — diucapkan oleh musafir dan keluarga '
      'yang ditinggalkan antara satu sama lain; nota kaki al-Ifsah: '
      'dihimpun daripada dua hadis sahih',
);

// 2. Ihram dan talbiyah
const ModuleDua _duaNiatHaji = ModuleDua(
  title: 'Lafaz Niat Ihram Haji',
  arabic: 'نَوَيْتُ الْحَجَّ وَأَحْرَمْتُ بِهِ لِلَّهِ تَعَالَى',
  translation:
      'Aku berniat Haji dan aku berihram dengannya kerana Allah Taala.',
  source:
      'Al-Idah (Fasal Sifat Ihram) — dilafazkan sambil menghadirkan niat '
      'di dalam hati, lalu disusuli talbiyah; lafaz anjuran fuqaha, bukan '
      'hadis',
);

const ModuleDua _duaTalbiyahPertamaUmrah = ModuleDua(
  title: 'Talbiyah Pertama Umrah',
  arabic: 'لَبَّيْكَ اللَّهُمَّ بِعُمْرَةٍ',
  translation: 'Aku menyahut seruan-Mu ya Allah, dengan Umrah.',
  source:
      'Al-Idah (Fasal Sifat Ihram) — dinukil daripada asy-Syeikh Abu '
      'Muhammad al-Juwaini: sunat menyebut nusuk dalam talbiyah pertama '
      'ketika berihram dan membacanya perlahan',
);

const ModuleDua _duaTalbiyah = ModuleDua(
  title: 'Talbiyah',
  arabic:
      'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ، '
      'إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ',
  translation:
      'Aku sahut panggilan-Mu ya Allah, aku sahut panggilan-Mu. Aku sahut '
      'panggilan-Mu, tiada sekutu bagi-Mu, aku sahut panggilan-Mu. '
      'Sesungguhnya segala puji, nikmat dan kerajaan adalah milik-Mu, '
      'tiada sekutu bagi-Mu.',
  source:
      'Riwayat al-Bukhari dan Muslim daripada Ibnu Umar r.a.; al-Idah '
      '(Fasal at-Talbiyah): selepasnya sunat berselawat, memohon reda '
      'Allah dan syurga serta berlindung daripada neraka',
);

const ModuleDua _duaLabbaikAlAisy = ModuleDua(
  title: 'Talbiyah Ketika Melihat Sesuatu yang Menakjubkan',
  arabic: 'لَبَّيْكَ إِنَّ الْعَيْشَ عَيْشُ الْآخِرَةِ',
  translation:
      'Aku menyahut seruan-Mu; sesungguhnya kehidupan yang sebenar ialah '
      'kehidupan akhirat.',
  source:
      'Al-Idah (Fasal at-Talbiyah) — disebut an-Nawawi sebagai sunnah '
      'ketika dalam ihram; takhrij riwayatnya tidak disemak di sini',
);

// 3. Tanah Haram, Kaabah dan Masjidil Haram
const ModuleDua _duaTanahHaram = ModuleDua(
  title: 'Doa Memasuki Tanah Haram',
  arabic:
      'اللَّهُمَّ هَـٰذَا حَرَمُكَ وَأَمْنُكَ، فَحَرِّمْنِي عَلَى '
      'النَّارِ، وَآمِنِّي مِنْ عَذَابِكَ يَوْمَ تَبْعَثُ عِبَادَكَ، '
      'وَاجْعَلْنِي مِنْ أَوْلِيَائِكَ وَأَهْلِ طَاعَتِكَ',
  translation:
      'Ya Allah, inilah tanah haram-Mu dan tempat aman-Mu, maka '
      'haramkanlah diriku daripada neraka, amankanlah aku daripada '
      'azab-Mu pada hari Engkau membangkitkan hamba-hamba-Mu, dan '
      'jadikanlah aku dalam kalangan wali-Mu dan ahli ketaatan kepada-Mu.',
  source:
      'Al-Idah (Bab Memasuki Makkah) — dianjurkan sebahagian ulama mazhab '
      'Syafi’i; al-Idah tidak menyandarkannya kepada hadis marfu’',
);

const ModuleDua _duaMelihatKaabah = ModuleDua(
  title: 'Doa Ketika Melihat Kaabah',
  arabic:
      'اللَّهُمَّ زِدْ هَـٰذَا الْبَيْتَ تَشْرِيفًا وَتَعْظِيمًا '
      'وَتَكْرِيمًا وَمَهَابَةً، وَزِدْ مَنْ شَرَّفَهُ وَعَظَّمَهُ '
      'مِمَّنْ حَجَّهُ وَاعْتَمَرَهُ تَشْرِيفًا وَتَكْرِيمًا وَتَعْظِيمًا '
      'وَبِرًّا، اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، '
      'فَحَيِّنَا رَبَّنَا بِالسَّلَامِ',
  translation:
      'Ya Allah, tambahkanlah kemuliaan, keagungan, kehormatan dan '
      'kehebatan Baitullah ini, dan tambahkanlah bagi sesiapa yang '
      'memuliakan dan mengagungkannya dalam kalangan orang yang menunaikan '
      'Haji dan Umrah kemuliaan, kehormatan, keagungan dan kebajikan. Ya '
      'Allah, Engkaulah as-Salam, dan daripada-Mu datangnya kesejahteraan; '
      'maka hidupkanlah kami, wahai Tuhan kami, dengan kesejahteraan.',
  source:
      'Al-Idah (Bab Memasuki Makkah) — dibaca sambil mengangkat tangan '
      'ketika mula melihat Kaabah; an-Nawawi tidak menyebut takhrijnya',
);

const ModuleDua _duaMasukMasjid = ModuleDua(
  title: 'Doa Masuk Masjidil Haram',
  arabic:
      'أَعُوذُ بِاللَّهِ الْعَظِيمِ، وَبِوَجْهِهِ الْكَرِيمِ، وَسُلْطَانِهِ '
      'الْقَدِيمِ، مِنَ الشَّيْطَانِ الرَّجِيمِ. بِسْمِ اللَّهِ وَالْحَمْدُ '
      'لِلَّهِ، اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ '
      'وَسَلِّمْ، اللَّهُمَّ اغْفِرْ لِي ذُنُوبِي وَافْتَحْ لِي أَبْوَابَ '
      'رَحْمَتِكَ',
  translation:
      'Aku berlindung kepada Allah Yang Maha Agung, dengan Wajah-Nya Yang '
      'Mulia dan kekuasaan-Nya yang azali, daripada syaitan yang direjam. '
      'Dengan nama Allah, dan segala puji bagi Allah. Ya Allah, '
      'limpahkanlah selawat dan salam ke atas Muhammad dan keluarga '
      'Muhammad. Ya Allah, ampunilah dosa-dosaku dan bukakanlah untukku '
      'pintu-pintu rahmat-Mu.',
  source:
      'Al-Idah (Bab Memasuki Makkah) — an-Nawawi menyatakan lafaz ini '
      'dihimpun daripada beberapa hadis dalam as-Sahih dan selainnya; '
      'masuk dengan kaki kanan',
);

// 4. Tawaf dan Zamzam
const ModuleDua _duaMulaTawaf = ModuleDua(
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
);

const ModuleDua _duaRamal = ModuleDua(
  title: 'Doa Ketika Ramal (Tiga Pusingan Pertama)',
  arabic:
      'اللَّهُمَّ اجْعَلْهُ حَجًّا مَبْرُورًا، وَذَنْبًا مَغْفُورًا، '
      'وَسَعْيًا مَشْكُورًا',
  translation:
      'Ya Allah, jadikanlah ia Haji yang mabrur, dosa yang diampunkan dan '
      'usaha yang diterima.',
  source:
      'Al-Idah (Fasal Kaifiyat Tawaf) — doa yang disukai Imam as-Syafi’i '
      'ketika ramal; nota kaki muhaqqiq: turut dibaca jemaah Umrah kerana '
      'Umrah juga dinamakan "haji"',
);

const ModuleDua _duaEmpatPusinganAkhir = ModuleDua(
  title: 'Doa Empat Pusingan Terakhir',
  arabic:
      'اللَّهُمَّ اغْفِرْ وَارْحَمْ، وَاعْفُ عَمَّا تَعْلَمُ، وَأَنْتَ '
      'الْأَعَزُّ الْأَكْرَمُ',
  translation:
      'Ya Allah, ampunilah, rahmatilah dan maafkanlah apa yang Engkau '
      'ketahui; dan Engkaulah Yang Maha Perkasa lagi Maha Mulia.',
  source:
      'Al-Idah (Fasal Kaifiyat Tawaf) — doa yang disukai Imam as-Syafi’i '
      'bagi empat pusingan terakhir; bukan hadis marfu’',
);

const ModuleDua _duaAntaraDuaRukun = ModuleDua(
  title: 'Doa Antara Rukun Yamani dan Hajar Aswad',
  arabic:
      'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً '
      'وَقِنَا عَذَابَ النَّارِ',
  translation:
      'Wahai Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan '
      'di akhirat, serta peliharalah kami daripada azab neraka.',
  source:
      'Al-Baqarah 2:201. Al-Idah (Fasal Kaifiyat Tawaf): Imam as-Syafi’i '
      'menyebutnya paling disukai dalam tawaf (didahului "Allahumma"); '
      'ashab: lebih dituntut antara dua rukun. Doa paling kerap Nabi SAW '
      '(al-Bukhari dan Muslim daripada Anas r.a.)',
);

const ModuleDua _duaZamzam = ModuleDua(
  title: 'Doa Ketika Minum Air Zamzam',
  arabic:
      'اللَّهُمَّ إِنَّهُ بَلَغَنِي أَنَّ رَسُولَكَ ﷺ قَالَ: «مَاءُ زَمْزَمَ '
      'لِمَا شُرِبَ لَهُ»، اللَّهُمَّ وَإِنِّي أَشْرَبُهُ لِتَغْفِرَ لِي، '
      'اللَّهُمَّ فَاغْفِرْ لِي',
  translation:
      'Ya Allah, telah sampai kepadaku bahawa Rasul-Mu SAW bersabda: '
      '"Air Zamzam itu menurut apa yang diniatkan ketika meminumnya." Ya '
      'Allah, aku meminumnya agar Engkau mengampuniku, maka ampunilah aku.',
  source:
      'Al-Idah (Bab Bermukim di Makkah) — dibaca menghadap kiblat; boleh '
      'diganti dengan hajat lain seperti memohon sembuh. Hadis "Ma’ '
      'Zamzam lima syuriba lah" riwayat Ibnu Majah dan Ahmad daripada '
      'Jabir r.a.',
);

// 5. Sa'i
const ModuleDua _duaZikirSafa = ModuleDua(
  title: 'Zikir di Bukit Safa dan Marwah',
  arabic:
      'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، وَلِلَّهِ '
      'الْحَمْدُ، اللَّهُ أَكْبَرُ عَلَىٰ مَا هَدَانَا، وَالْحَمْدُ '
      'لِلَّهِ عَلَىٰ مَا أَوْلَانَا، لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ '
      'لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي '
      'وَيُمِيتُ، بِيَدِهِ الْخَيْرُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ، '
      'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، أَنْجَزَ '
      'وَعْدَهُ، وَنَصَرَ عَبْدَهُ، وَهَزَمَ الْأَحْزَابَ وَحْدَهُ، لَا '
      'إِلَٰهَ إِلَّا اللَّهُ، وَلَا نَعْبُدُ إِلَّا إِيَّاهُ، '
      'مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرِهَ الْكَافِرُونَ',
  translation:
      'Allah Maha Besar (3x), dan bagi Allah segala puji. Allah Maha '
      'Besar atas hidayah-Nya kepada kami, dan segala puji bagi Allah atas '
      'nikmat yang dikurniakan-Nya kepada kami. Tiada Tuhan melainkan Allah '
      'Yang Esa, tiada sekutu bagi-Nya; bagi-Nya kerajaan dan segala puji; '
      'Dia menghidupkan dan mematikan; di tangan-Nya segala kebaikan, dan '
      'Dia Maha Berkuasa atas segala sesuatu. Tiada Tuhan melainkan Allah '
      'Yang Esa; Dia menunaikan janji-Nya, menolong hamba-Nya dan '
      'mengalahkan golongan al-Ahzab dengan sendiri-Nya. Tiada Tuhan '
      'melainkan Allah, dan kami tidak menyembah selain-Nya, dengan '
      'mengikhlaskan agama bagi-Nya walaupun orang kafir membencinya.',
  source:
      'Al-Idah (Fasal as-Sa’i) — dibaca menghadap Kaabah dan diulang tiga '
      'kali di Safa dan Marwah; nota kaki al-Ifsah: lafaz nas Imam '
      'as-Syafi’i, berasaskan hadis Jabir r.a. riwayat Muslim',
);

const ModuleDua _duaDiSafa = ModuleDua(
  title: 'Doa di Bukit Safa',
  arabic:
      'اللَّهُمَّ إِنَّكَ قُلْتَ وَقَوْلُكَ الْحَقُّ: ادْعُونِي أَسْتَجِبْ '
      'لَكُمْ، وَإِنَّكَ لَا تُخْلِفُ الْمِيعَادَ، وَإِنِّي أَسْأَلُكَ كَمَا '
      'هَدَيْتَنِي لِلْإِسْلَامِ أَنْ لَا تَنْزِعَهُ مِنِّي، وَأَنْ تَتَوَفَّانِي '
      'مُسْلِمًا',
  translation:
      'Ya Allah, sesungguhnya Engkau telah berfirman, dan firman-Mu adalah '
      'benar: "Berdoalah kepada-Ku, nescaya Aku perkenankan bagi kamu", '
      'dan Engkau tidak memungkiri janji. Aku memohon kepada-Mu, '
      'sebagaimana Engkau telah memberiku hidayah kepada Islam, agar '
      'Engkau tidak mencabutnya daripadaku dan mematikan aku sebagai '
      'seorang Muslim.',
  source:
      'Al-Idah (Fasal as-Sa’i) — dianggap baik oleh ashab, dibaca selepas '
      'zikir di Safa; nota kaki al-Ifsah: athar Ibnu Umar r.a. riwayat '
      'Malik dalam al-Muwatta’, bukan hadis marfu’',
);

const ModuleDua _duaSaie = ModuleDua(
  title: 'Doa Sepanjang Sa’i dan di Lampu Hijau',
  arabic:
      'رَبِّ اغْفِرْ وَارْحَمْ، وَتَجَاوَزْ عَمَّا تَعْلَمُ، إِنَّكَ '
      'أَنْتَ الْأَعَزُّ الْأَكْرَمُ، اللَّهُمَّ آتِنَا فِي الدُّنْيَا '
      'حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
  translation:
      'Wahai Tuhanku, ampunilah, rahmatilah dan maafkanlah apa yang Engkau '
      'ketahui; sesungguhnya Engkaulah Yang Maha Perkasa lagi Maha Mulia. '
      'Ya Allah, berikanlah kami kebaikan di dunia dan kebaikan di '
      'akhirat, serta peliharalah kami daripada azab neraka.',
  source:
      'Al-Idah (Sunat-sunat Sa’i) — dibaca ketika berjalan dan berlari '
      'anak antara Safa dan Marwah; nota kaki al-Ifsah: riwayat Ibnu Abi '
      'Syaibah daripada Ibnu Umar r.a. (mauquf)',
);

// 6. Arafah
const ModuleDua _duaMenujuArafah = ModuleDua(
  title: 'Doa Dalam Perjalanan ke Arafah',
  arabic:
      'اللَّهُمَّ إِلَيْكَ تَوَجَّهْتُ، وَلِوَجْهِكَ الْكَرِيمِ '
      'أَرَدْتُ، فَاجْعَلْ ذَنْبِي مَغْفُورًا، وَحَجِّي مَبْرُورًا، '
      'ارْحَمْنِي وَلَا تُخَيِّبْنِي، إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ '
      'قَدِيرٌ',
  translation:
      'Ya Allah, kepada-Mu aku menghadap, dan Wajah-Mu Yang Mulia yang aku '
      'harapkan; maka jadikanlah dosaku diampunkan dan Hajiku mabrur. '
      'Rahmatilah aku dan janganlah Engkau hampakan aku; sesungguhnya '
      'Engkau Maha Berkuasa atas segala sesuatu.',
  source:
      'Al-Idah (Fasal Wukuf di Arafah) — dianggap baik oleh sebahagian '
      'ulama; bukan hadis marfu’',
);

const ModuleDua _duaTahlilArafah = ModuleDua(
  title: 'Zikir Terbaik Hari Arafah',
  arabic:
      'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ '
      'الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Tiada Tuhan melainkan Allah Yang Esa, tiada sekutu bagi-Nya; '
      'bagi-Nya kerajaan dan bagi-Nya segala puji, dan Dia Maha Berkuasa '
      'atas segala sesuatu.',
  source:
      'Riwayat at-Tirmidhi: "Sebaik-baik doa ialah doa hari Arafah, dan '
      'sebaik-baik ucapanku dan para nabi sebelumku…"; dinukil an-Nawawi '
      'dalam al-Idah',
);

const ModuleDua _duaNabiDiArafah = ModuleDua(
  title: 'Doa Nabi SAW di Arafah',
  arabic:
      'اللَّهُمَّ لَكَ الْحَمْدُ كَالَّذِي نَقُولُ وَخَيْرًا مِمَّا '
      'نَقُولُ، اللَّهُمَّ لَكَ صَلَاتِي وَنُسُكِي وَمَحْيَايَ '
      'وَمَمَاتِي، وَإِلَيْكَ مَآبِي، وَلَكَ رَبِّي تُرَاثِي، '
      'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، '
      'وَوَسْوَسَةِ الصَّدْرِ، وَشَتَاتِ الْأَمْرِ، اللَّهُمَّ إِنِّي '
      'أَعُوذُ بِكَ مِنْ شَرِّ مَا تَجِيءُ بِهِ الرِّيحُ',
  translation:
      'Ya Allah, bagi-Mu segala puji seperti yang kami ucapkan, dan lebih '
      'baik daripada apa yang kami ucapkan. Ya Allah, bagi-Mu '
      'solatku, ibadahku, hidupku dan matiku; kepada-Mu tempat kembaliku, '
      'dan milik-Mu, wahai Tuhanku, segala peninggalanku. Ya Allah, aku '
      'berlindung kepada-Mu daripada azab kubur, was-was di dalam dada dan '
      'urusan yang bercelaru. Ya Allah, aku berlindung kepada-Mu daripada '
      'keburukan yang dibawa oleh angin.',
  source:
      'Riwayat at-Tirmidhi daripada Ali r.a. — doa yang paling kerap '
      'dibaca Nabi SAW di Arafah, dinukil an-Nawawi dalam al-Idah; '
      'darjat sanadnya tidak disemak di sini',
);

const ModuleDua _duaAmpunArafah = ModuleDua(
  title: 'Doa Memohon Keampunan di Arafah',
  arabic:
      'اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي ظُلْمًا كَثِيرًا، وَإِنَّهُ لَا '
      'يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ، فَاغْفِرْ لِي مَغْفِرَةً مِنْ '
      'عِنْدِكَ، وَارْحَمْنِي، إِنَّكَ أَنْتَ الْغَفُورُ الرَّحِيمُ',
  translation:
      'Ya Allah, sesungguhnya aku telah banyak menzalimi diriku, dan tiada '
      'yang mengampunkan dosa melainkan Engkau; maka ampunilah aku dengan '
      'keampunan daripada sisi-Mu dan rahmatilah aku, sesungguhnya '
      'Engkaulah Yang Maha Pengampun lagi Maha Penyayang.',
  source:
      'Al-Idah (Fasal Wukuf) — antara "doa-doa pilihan" an-Nawawi; '
      'asalnya hadis Abu Bakar r.a. riwayat al-Bukhari dan Muslim',
);

const ModuleDua _duaKemuliaanTaat = ModuleDua(
  title: 'Doa Memohon Kemuliaan Taat',
  arabic:
      'اللَّهُمَّ انْقُلْنِي مِنْ ذُلِّ الْمَعْصِيَةِ إِلَىٰ عِزِّ '
      'الطَّاعَةِ، وَأَغْنِنِي بِحَلَالِكَ عَنْ حَرَامِكَ، وَبِطَاعَتِكَ '
      'عَنْ مَعْصِيَتِكَ، وَبِفَضْلِكَ عَمَّنْ سِوَاكَ، وَنَوِّرْ قَلْبِي '
      'وَقَبْرِي، وَأَعِذْنِي مِنَ الشَّرِّ كُلِّهِ، وَاجْمَعْ لِي الْخَيْرَ '
      'كُلَّهُ',
  translation:
      'Ya Allah, pindahkanlah aku daripada kehinaan maksiat kepada '
      'kemuliaan taat; cukupkanlah aku dengan yang halal daripada yang '
      'haram, dengan ketaatan daripada maksiat, dan dengan kurnia-Mu '
      'daripada bergantung kepada selain-Mu. Terangilah hatiku dan '
      'kuburku, lindungilah aku daripada segala keburukan, dan '
      'himpunkanlah bagiku segala kebaikan.',
  source:
      'Al-Idah (Fasal Wukuf) — antara "doa-doa pilihan" yang disusun '
      'an-Nawawi untuk hari Arafah (ringkasan); doa anjuran ulama, bukan '
      'hadis marfu’',
);

// 7. Muzdalifah dan Masy'aril Haram
const ModuleDua _duaMasyaril = ModuleDua(
  title: 'Doa di Masy’aril Haram',
  arabic:
      'اللَّهُمَّ كَمَا أَوْقَفْتَنَا فِيهِ وَأَرَيْتَنَا إِيَّاهُ، '
      'فَوَفِّقْنَا لِذِكْرِكَ كَمَا هَدَيْتَنَا، وَاغْفِرْ لَنَا '
      'وَارْحَمْنَا كَمَا وَعَدْتَنَا بِقَوْلِكَ وَقَوْلُكَ الْحَقُّ',
  translation:
      'Ya Allah, sebagaimana Engkau telah menghentikan kami di tempat ini '
      'dan memperlihatkannya kepada kami, maka berilah kami taufik untuk '
      'mengingati-Mu sebagaimana Engkau telah memberi kami hidayah; '
      'ampunilah dan rahmatilah kami sebagaimana Engkau janjikan dengan '
      'firman-Mu, dan firman-Mu adalah benar.',
  source:
      'Al-Idah (Fasal Bertolak ke Mina) — dianjurkan ulama ketika wuquf '
      'di Masy’aril Haram, disusuli al-Baqarah 2:198–199 serta '
      'memperbanyak doa "Rabbana atina…" (ringkasan)',
);

// 8. Jamrah dan hari-hari Tasyriq
const ModuleDua _duaTakbirJamrah = ModuleDua(
  title: 'Takbir Ketika Melontar Jamrah',
  arabic:
      'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ كَبِيرًا، '
      'وَالْحَمْدُ لِلَّهِ كَثِيرًا، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلًا، '
      'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ '
      'وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيتُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Allah Maha Besar, Allah Maha Besar, Allah Maha Besar dengan '
      'sebesar-besarnya; segala puji bagi Allah dengan sebanyak-banyaknya; '
      'Maha Suci Allah pagi dan petang. Tiada Tuhan melainkan Allah Yang '
      'Esa, tiada sekutu bagi-Nya; bagi-Nya kerajaan dan segala puji; Dia '
      'menghidupkan dan mematikan, dan Dia Maha Berkuasa atas segala '
      'sesuatu.',
  source:
      'Al-Idah (Fasal Amalan di Mina) — sunnahnya bertakbir bersama '
      'setiap batu sebagai ganti talbiyah (hadis Jabir r.a. riwayat '
      'Muslim); lafaz lanjut ini anjuran sebahagian ashab (ringkasan)',
);

const ModuleDua _duaSelepasJamrah = ModuleDua(
  title: 'Doa Selepas Jamrah Ula dan Wusta',
  arabic:
      'اللَّهُمَّ إِلَيْكَ رَغِبْتُ، وَمِنْكَ رَهِبْتُ، وَمِنْ عَذَابِكَ '
      'أَشْفَقْتُ، فَاقْبَلْ نُسُكِي، وَأَصْلِحْهُ وَأَتْمِمْهُ، وَاجْعَلْهُ '
      'حَجًّا مَبْرُورًا وَذَنْبًا مَغْفُورًا',
  translation:
      'Ya Allah, kepada-Mu aku berharap, daripada-Mu aku gerun, dan '
      'daripada azab-Mu aku takut; maka terimalah ibadahku, perbaikilah '
      'dan sempurnakanlah ia, serta jadikanlah ia Haji yang mabrur dan '
      'dosa yang diampunkan.',
  source:
      'Nota kaki al-Ifsah (Abdul Fattah Rawah), bukan teks an-Nawawi '
      '(ringkasan). Al-Idah hanya menyebut berdiri lama menghadap kiblat '
      'selepas Jamrah Ula dan Wusta untuk bertahmid, bertakbir, bertahlil, '
      'bertasbih dan berdoa',
);

// 9. Wada'
const ModuleDua _duaMultazamWada = ModuleDua(
  title: 'Doa di Multazam Ketika Wada’',
  arabic:
      'اللَّهُمَّ الْبَيْتُ بَيْتُكَ، وَالْعَبْدُ عَبْدُكَ وَابْنُ '
      'أَمَتِكَ، حَمَلْتَنِي عَلَىٰ مَا سَخَّرْتَ لِي مِنْ خَلْقِكَ '
      'حَتَّىٰ صَيَّرْتَنِي فِي بِلَادِكَ، وَبَلَّغْتَنِي بِنِعْمَتِكَ '
      'حَتَّىٰ أَعَنْتَنِي عَلَىٰ قَضَاءِ مَنَاسِكِكَ، فَإِنْ كُنْتَ '
      'رَضِيتَ عَنِّي فَازْدَدْ عَنِّي رِضًا، وَإِلَّا فَمُنَّ الْآنَ '
      'قَبْلَ أَنْ تَنْأَىٰ عَنْ بَيْتِكَ دَارِي وَيَبْعُدَ عَنْهُ '
      'مَزَارِي، هَـٰذَا أَوَانُ انْصِرَافِي إِنْ أَذِنْتَ لِي، غَيْرَ '
      'مُسْتَبْدِلٍ بِكَ وَلَا بَيْتِكَ، وَلَا رَاغِبٍ عَنْكَ وَلَا '
      'عَنْ بَيْتِكَ، اللَّهُمَّ فَأَصْحِبْنِي الْعَافِيَةَ فِي '
      'بَدَنِي، وَالْعِصْمَةَ فِي دِينِي، وَأَحْسِنْ مُنْقَلَبِي، '
      'وَارْزُقْنِي طَاعَتَكَ مَا أَبْقَيْتَنِي، وَاجْمَعْ لِي خَيْرَيِ '
      'الدُّنْيَا وَالْآخِرَةِ، إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Ya Allah, rumah ini rumah-Mu, dan hamba ini hamba-Mu, anak kepada '
      'hamba perempuan-Mu. Engkau membawaku dengan apa yang Engkau '
      'tundukkan untukku daripada makhluk-Mu sehingga sampai ke negeri-Mu, '
      'dan Engkau menyampaikan aku dengan nikmat-Mu sehingga Engkau '
      'membantuku menunaikan manasik-Mu. Jika Engkau telah reda kepadaku, '
      'tambahkanlah keredaan-Mu; jika belum, kurniakanlah sekarang sebelum '
      'rumahku jauh daripada rumah-Mu dan jauh tempat ziarahku. Inilah '
      'masa aku beredar, jika Engkau izinkan, tanpa menggantikan-Mu atau '
      'rumah-Mu, dan tanpa berpaling daripada-Mu atau rumah-Mu. Ya Allah, '
      'iringilah aku dengan '
      'kesihatan tubuh dan pemeliharaan agama, perelokkanlah kepulanganku, '
      'kurniakanlah aku ketaatan kepada-Mu sepanjang hayatku, dan '
      'himpunkanlah bagiku kebaikan dunia dan akhirat; sesungguhnya Engkau '
      'Maha Berkuasa atas segala sesuatu.',
  source:
      'Al-Idah (Bab Tawaf Wada’) — dibaca di Multazam selepas solat sunat '
      'tawaf Wada’; nota kaki al-Ifsah menukil al-Hasyiah: doa '
      'ini tidak diriwayatkan secara marfu’',
);

// 10. Pulang ke tanah air
const ModuleDua _duaPulang = ModuleDua(
  title: 'Zikir Ketika Pulang dari Haji atau Umrah',
  arabic:
      'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ '
      'وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، آئِبُونَ '
      'تَائِبُونَ عَابِدُونَ سَاجِدُونَ، لِرَبِّنَا حَامِدُونَ، صَدَقَ اللَّهُ '
      'وَعْدَهُ، وَنَصَرَ عَبْدَهُ، وَهَزَمَ الْأَحْزَابَ وَحْدَهُ',
  translation:
      'Tiada Tuhan melainkan Allah Yang Esa, tiada sekutu bagi-Nya; '
      'bagi-Nya kerajaan dan segala puji, dan Dia Maha Berkuasa atas '
      'segala sesuatu. Kami kembali, bertaubat, beribadah, sujud dan memuji '
      'Tuhan kami. Allah telah menepati janji-Nya, menolong hamba-Nya dan '
      'mengalahkan golongan al-Ahzab dengan sendiri-Nya.',
  source:
      'Riwayat al-Bukhari dan Muslim daripada Ibnu Umar r.a.; al-Idah '
      '(Fasal Adab Pulang) — dibaca selepas tiga kali takbir di setiap '
      'tempat tinggi',
);

const ModuleDua _duaMasukRumah = ModuleDua(
  title: 'Doa Ketika Masuk ke Rumah Sekembali',
  arabic: 'تَوْبًا تَوْبًا، لِرَبِّنَا أَوْبًا، لَا يُغَادِرُ حَوْبًا',
  translation:
      'Kami memohon taubat yang sempurna; kepada Tuhan kami kami kembali, '
      'taubat yang tidak meninggalkan sebarang dosa.',
  source:
      'Al-Idah (Fasal Adab Pulang) — an-Nawawi menukilnya daripada '
      'al-Adhkar, daripada Ibnu Abbas r.a.; takhrijnya tidak disemak di '
      'sini',
);

// Doa untuk modul lain
const ModuleDua _duaIstighfarIhram = ModuleDua(
  title: 'Doa Taubat dan Istighfar',
  arabic:
      'اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي ظُلْمًا كَثِيرًا، وَإِنَّهُ لَا '
      'يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ، فَاغْفِرْ لِي مَغْفِرَةً مِنْ '
      'عِنْدِكَ، وَارْحَمْنِي، إِنَّكَ أَنْتَ الْغَفُورُ الرَّحِيمُ',
  translation:
      'Ya Allah, sesungguhnya aku telah banyak menzalimi diriku, dan tiada '
      'yang mengampunkan dosa melainkan Engkau; maka ampunilah aku dengan '
      'keampunan daripada sisi-Mu dan rahmatilah aku, sesungguhnya '
      'Engkaulah Yang Maha Pengampun lagi Maha Penyayang.',
  source:
      'Al-Idah (Fasal Wukuf) — antara doa pilihan an-Nawawi; asalnya hadis '
      'Abu Bakar r.a. riwayat al-Bukhari dan Muslim. Sesuai dibaca segera '
      'apabila tersilap melanggar larangan ihram',
);

const ModuleDua _duaSembelihan = ModuleDua(
  title: 'Doa Ketika Menyembelih Hadyu atau Dam',
  arabic:
      'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ، وَصَلَّى اللَّهُ عَلَىٰ '
      'رَسُولِهِ مُحَمَّدٍ وَعَلَىٰ آلِهِ وَصَحْبِهِ وَسَلَّمَ، '
      'اللَّهُمَّ مِنْكَ وَإِلَيْكَ فَتَقَبَّلْ مِنِّي',
  translation:
      'Dengan nama Allah, dan Allah Maha Besar. Semoga Allah melimpahkan '
      'selawat dan salam ke atas Rasul-Nya Muhammad, keluarga dan sahabat '
      'baginda. Ya Allah, (sembelihan ini) daripada-Mu dan untuk-Mu, maka '
      'terimalah daripadaku.',
  source:
      'Al-Idah (Fasal Amalan di Mina Hari Nahar) — sunat ketika '
      'menyembelih hadyu, termasuk hadyu wajib (dam); jika menyembelih bagi '
      'pihak orang lain, sebut "taqabbal min fulan"',
);

/// Penilaian Akhir sentiasa modul terakhir selepas semua modul bab al-Idah.
const String kNomborModulPenilaian = '18';

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
            teksKitabArabic:
                'إِذَا أَرَادَ الْحَجَّ أَنْ يَتَعَلَّمَ كَيْفِيَّتَهُ، '
                'وَهَذَا فَرْضُ عَيْنٍ؛ إِذْ لَا تَصِحُّ الْعِبَادَةُ '
                'مِمَّنْ لَا يَعْرِفُهَا',
            teksKitab:
                'Dalam masalah kesepuluh Bab Pertama al-Idah (adab '
                'perjalanan), Imam an-Nawawi menyatakan bahawa apabila '
                'seseorang hendak menunaikan Haji, dia hendaklah '
                'mempelajari kaifiyat (tatacara) Haji, dan hal ini fardu '
                'ain kerana "ibadah tidak sah daripada orang yang tidak '
                'mengetahuinya". Nota kaki muhaqqiq (al-Ifsah) '
                'menghuraikan kaifiyat itu sebagai rukun, syarat, wajib '
                'dan perkara yang merosakkan Haji.',
            permasalahan: <String>[
              'Imam an-Nawawi turut menggalakkan jemaah membawa sebuah '
                  'kitab manasik yang jelas dan menyeluruh, lalu '
                  'mengulang-ulang bacaannya sepanjang perjalanan supaya '
                  'tatacara Haji benar-benar difahami.',
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
                sumber: 'Riwayat Abu Dawud dan at-Tirmidhi daripada Ali r.a',
              ),
            ],
            teksKitab:
                'Al-Idah menyatakan: wajib Haji al-Islam (kewajipan '
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
            dalil: <DalilItem>[
              DalilItem(
                arabic: 'الْحَجُّ عَرَفَةُ',
                terjemahan:
                    'Haji itu (ialah) Arafah — sesiapa yang sempat '
                    'berada di Arafah pada waktunya, dia telah mendapat '
                    'Haji.',
                sumber:
                    'Riwayat at-Tirmidhi, an-Nasa’i, Abu Dawud dan '
                    'Ibn Majah',
              ),
              DalilItem(
                arabic: 'خُذُوا عَنِّي مَنَاسِكَكُمْ',
                terjemahan:
                    'Ambillah (ikutlah) daripadaku cara-cara manasik '
                    'kamu.',
                sumber:
                    'Riwayat an-Nasa’i dan Ahmad daripada Jabir bin '
                    'Abdullah r.a',
              ),
            ],
            teksKitab:
                'Al-Idah disusun Imam an-Nawawi mengikut tertib '
                'perjalanan sebenar jemaah: Bab Pertama (adab sepanjang '
                'perjalanan), Bab Kedua (ihram dan miqat), kemudian Bab '
                'Ketiga yang merangkumi lapan fasal — adab memasuki '
                'Makkah, kaifiyat tawaf, sa’i, wukuf di Arafah, '
                'perpindahan ke Muzdalifah, perpindahan ke Mina, amalan '
                'hari Nahar (lontar jamrah, sembelih, bercukur, tawaf '
                'ifadah) dan amalan hari-hari Tasyriq. Susunan kitab '
                'ini sendiri mencerminkan tertib sebenar perjalanan '
                'Haji dari permulaan hingga penghujungnya.',
            permasalahan: <String>[
              'Ifrad — berihram dengan Haji sahaja, tanpa Umrah dalam '
                  'ihram yang sama.',
              'Tamattu’ — berihram Umrah dahulu dalam bulan-bulan Haji, '
                  'bertahallul, kemudian berihram semula dengan Haji '
                  'daripada Makkah; jenis ini mewajibkan dam (seekor '
                  'kambing) kerana tidak berihram Haji dari miqat — '
                  'al-Idah menggolongkannya dalam dam jubran (dam '
                  'gantian), bukan dam kesyukuran.',
              'Qiran — berihram dengan Haji dan Umrah serentak dalam '
                  'satu ihram tanpa bertahallul di antaranya; turut '
                  'mewajibkan dam yang sama seperti Tamattu’.',
              'Menurut al-Idah, yang paling afdal ialah Ifrad, kemudian '
                  'Tamattu’, kemudian Qiran — dengan syarat Umrah '
                  'dikerjakan pada tahun yang sama; Qiran lebih afdal '
                  'daripada Ifrad yang tidak diiringi Umrah pada tahun '
                  'itu. Nota kaki muhaqqiq mencatat bahawa mazhab Hanafi '
                  'mengutamakan Qiran dan mazhab Hanbali mengutamakan '
                  'Tamattu’.',
            ],
          ),
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Doa Haji Mabrur',
          arabic:
              'اللَّهُمَّ اجْعَلْهُ حَجًّا مَبْرُورًا، وَذَنْبًا '
              'مَغْفُورًا، وَسَعْيًا مَشْكُورًا',
          translation:
              'Ya Allah, jadikanlah ia Haji yang mabrur, dosa yang '
              'diampunkan dan usaha yang diterima.',
          source:
              'Al-Idah, Fasal Kaifiyat Tawaf — doa yang disukai Imam '
              'as-Syafi’i dibaca ketika ramal',
        ),
        _duaMelepaskanMusafir,
        _duaMenaikiKenderaan,
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
          'Tamattu\u2019, yang mewajibkan dam (seekor kambing) kerana '
          'tidak berihram Haji dari miqat. Sejarah ibadah ini pula '
          'berakar umbi daripada peristiwa Nabi Ibrahim AS dan Nabi '
          'Ismail AS meninggikan asas Kaabah atas perintah Allah SWT.',
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
            dalil: <DalilItem>[
              DalilItem(
                arabic: 'الْحَجُّ عَرَفَةُ',
                terjemahan:
                    'Haji itu (ialah) Arafah — dalil utama kewajipan '
                    'Wukuf sebagai rukun yang menentukan sah atau '
                    'tidaknya Haji.',
                sumber:
                    'Riwayat at-Tirmidhi, an-Nasa’i, Abu Dawud dan '
                    'Ibn Majah',
              ),
              DalilItem(
                arabic:
                    'ثُمَّ لْيَقْضُوا تَفَثَهُمْ وَلْيُوفُوا نُذُورَهُمْ '
                    'وَلْيَطَّوَّفُوا بِالْبَيْتِ الْعَتِيقِ',
                terjemahan:
                    'Kemudian hendaklah mereka menyempurnakan kebersihan '
                    'diri, menyempurnakan nazar mereka, dan hendaklah '
                    'mereka bertawaf di Baitul Atiq (Kaabah) — dalil '
                    'kewajipan Tawaf Ifadah.',
                sumber: 'Al-Hajj (22):29',
              ),
              DalilItem(
                arabic: 'إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ',
                terjemahan:
                    'Sesungguhnya Safa dan Marwah adalah sebahagian '
                    'daripada syiar-syiar Allah — dalil kewajipan Sa’i '
                    'antara kedua-duanya.',
                sumber: 'Al-Baqarah (2):158',
              ),
            ],
            teksKitabArabic:
                'أَمَّا الْأَرْكَانُ: فَخَمْسَةٌ: الْإِحْرَامُ '
                'وَالْوُقُوفُ وَطَوَافُ الْإِفَاضَةِ وَالسَّعْيُ '
                'وَالْحَلْقُ إِذَا قُلْنَا بِالْأَصَحِّ إِنَّهُ نُسُكٌ',
            teksKitab:
                'Dalam Fasal "A’mal al-Hajj thalathah aqsam: arkan wa '
                'wajibat wa sunan" (amalan Haji terbahagi tiga bahagian: '
                'rukun, wajib dan sunat), Imam an-Nawawi menyebut petikan '
                'di atas — "adapun rukun-rukun itu ada lima: Ihram, '
                'Wukuf, Tawaf Ifadah, Sa’i dan bercukur, jika kita '
                'berpegang dengan pendapat asah bahawa bercukur itu '
                'suatu nusuk". Beliau kemudian menegaskan bahawa tertib '
                'wajib dalam rukun-rukun ini — ihram mesti mendahului '
                'semuanya, dan wukuf mesti mendahului Tawaf Ifadah dan '
                'bercukur — tanpa mengira tertib sebagai rukun keenam.',
            permasalahan: <String>[
              'Rukun ialah komponen yang MESTI ada dan TIDAK boleh '
                  'digantikan dengan dam. Tawaf, Sa’i dan bercukur tiada '
                  'had akhir waktunya, manakala Wukuf yang terlepas '
                  'menyebabkan Haji luput (fawat).',
              'Nota kaki muhaqqiq al-Idah menjelaskan bahawa tertib '
                  'tidak dikira sebagai rukun berasingan kerana ia hanya '
                  'berlaku pada kebanyakan rukun — tiada tertib antara '
                  'bercukur dan Tawaf Ifadah. Sebahagian kitab Syafi’i '
                  'terkemudian (seperti Manhaj at-Tullab) mengira '
                  '"tertib kebanyakan rukun" sebagai rukun keenam; ini '
                  'perbezaan cara mengira, bukan perbezaan hukum.',
              'Halq/taqsir (bercukur/bergunting) dikira rukun (bukan '
                  'sekadar wajib) berdasarkan pendapat asah dalam mazhab '
                  'Syafi’i bahawa ia suatu nusuk; sebahagian mazhab lain '
                  'menganggapnya wajib sahaja yang boleh diganti dengan '
                  'dam.',
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
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'لَا يَنْفِرْ أَحَدٌ حَتَّى يَكُونَ آخِرُ عَهْدِهِ '
                    'بِالْبَيْتِ',
                terjemahan:
                    'Janganlah seseorang itu bertolak (pulang) sehingga '
                    'perkara terakhirnya adalah (tawaf) di Baitullah — '
                    'dalil kewajipan Tawaf Wada’.',
                sumber: 'Riwayat Muslim daripada Ibnu Abbas r.a',
              ),
              DalilItem(
                arabic:
                    'رَخَّصَ لِرِعَاءِ الْإِبِلِ فِي الْبَيْتُوتَةِ عَنْ '
                    'مِنًى',
                terjemahan:
                    '(Rasulullah SAW) memberi keringanan kepada para '
                    'penggembala unta untuk tidak bermalam di Mina — '
                    'menunjukkan mabit itu pada asalnya wajib bagi '
                    'jemaah lain, kerana keringanan hanya diberi kepada '
                    'golongan yang mempunyai uzur menjaga unta.',
                sumber:
                    'Riwayat at-Tirmidhi, an-Nasa’i, Abu Dawud, Ibn '
                    'Majah dan Imam Malik dalam al-Muwatta’',
              ),
            ],
            teksKitab:
                'Al-Idah menyenaraikan wajib Haji sebagai: dua perkara '
                'yang disepakati (ihram dari miqat, melontar jamrah) dan '
                'empat lagi yang diperselisihkan, dan pendapat asah '
                '(paling sahih) menurut al-Idah ialah keempat-empatnya '
                'wajib — jam’ siang-malam di Arafah, mabit Muzdalifah, '
                'mabit malam-malam Mina, dan Tawaf Wada’.',
            permasalahan: <String>[
              'Wajib berbeza daripada rukun — jika ditinggalkan, sama '
                  'ada sengaja atau terlupa, Hajinya tetap SAH tetapi '
                  'wajib membayar dam sebagai gantian; yang sengaja '
                  'meninggalkannya turut berdosa.',
              'Tawaf Wada’ termasuk empat perkara yang diperselisihkan '
                  'kewajipannya. Wanita haid dan nifas tidak dituntut '
                  'melakukannya dan tiada dam ke atas mereka jika '
                  'bertolak tanpanya (al-Idah, Bab Kelima).',
              'Tentang jam’ siang-malam di Arafah, nota kaki muhaqqiq '
                  'al-Idah mencatat bahawa ia juga disebut sebagai sunat '
                  'dalam fasal Wukuf kitab yang sama; status wajib atau '
                  'sunatnya merupakan khilaf dalam mazhab.',
              'Mabit di Muzdalifah dianggap sempurna sekadar hadir '
                  'sesaat sahaja selepas tengah malam, manakala mabit di '
                  'Mina memerlukan kehadiran majoriti (kebanyakan) '
                  'malam tersebut menurut pendapat asah dalam al-Idah.',
            ],
          ),
        ),
        LearningSection(
          title: 'Perbezaan ringkas',
          points: <String>[
            'Rukun yang ditinggalkan menyebabkan Haji tidak sempurna sehingga rukun itu dilaksanakan — tertib (susunan) wajib dalam kebanyakan rukun, tetapi tidak dikira sebagai rukun keenam yang berasingan.',
            'Wajib Haji yang ditinggalkan boleh menyebabkan kewajipan dam, tertakluk kepada keadaan dan hukum — Hajinya tetap sah.',
            'Larangan ihram (muharramat al-ihram / مُحَرَّمَاتُ الْإِحْرَامِ) adalah topik berasingan daripada wajib Haji, masing-masing dengan kifaratnya sendiri.',
          ],
          deepDive: SectionDeepDive(
            teksKitabArabic:
                'فَالأَرْكَانُ لَا يَتُمُّ الْحَجُّ وَلَا يُجْزِئُ حَتَّى '
                'يَأْتِيَ بِجَمِيعِهَا... وَلَا يُجْبَرُ شَيْءٌ مِنَ '
                'الْأَرْكَانِ بِدَمٍ وَلَا غَيْرِهِ، وَأَمَّا '
                'الْوَاجِبَاتُ: فَمَنْ تَرَكَ مِنْهَا شَيْئًا لَزِمَهُ '
                'دَمٌ وَيَصِحُّ الْحَجُّ بِدُونِهِ... وَأَمَّا السُّنَنُ: '
                'فَمَنْ تَرَكَهَا لَا شَيْءَ عَلَيْهِ',
            teksKitab:
                'Imam an-Nawawi menjelaskan dalam Fasal "A’mal al-Hajj '
                'thalathah aqsam" (Bab Ketiga, al-Idah) hukum bagi '
                'ketiga-tiga bahagian amalan Haji ini secara berasingan: '
                'rukun tidak boleh digantikan dengan apa-apa jua — '
                'Haji tidak sempurna dan tidak sah sehingga semuanya '
                'dilaksanakan, tanpa mengira berapa lama tempoh yang '
                'berlalu; wajib pula boleh ditinggalkan dengan kewajipan '
                'membayar dam sebagai gantian, sama ada ditinggalkan '
                'secara sengaja atau terlupa, namun Hajinya tetap sah; '
                'manakala sunat jika ditinggalkan tidak mengakibatkan '
                'apa-apa — tiada dosa dan tiada dam — tetapi jemaah '
                'kehilangan kesempurnaan dan kelebihan pahalanya.',
            permasalahan: <String>[
              'Tiga daripada lima rukun — Tawaf, Sa’i dan Halq — tidak '
                  'mempunyai had waktu akhir; ia tidak akan "luput" '
                  'selagi jemaah masih hidup, berbeza dengan Wukuf yang '
                  'terikat waktu di Arafah.',
              'Larangan ihram (muharramat) adalah kategori berasingan '
                  'yang tidak termasuk dalam rukun atau wajib Haji — '
                  'ia timbul daripada perbuatan yang dilakukan semasa '
                  'ihram, bukan daripada meninggalkan sesuatu amalan '
                  'manasik, justeru kifaratnya juga berbeza mengikut '
                  'jenis larangan yang dilanggar.',
            ],
          ),
        ),
      ],
      duas: <ModuleDua>[_duaMulaTawaf, _duaTahlilArafah],
      academicInsight:
          'Rukun dan Wajib Haji membentuk rangka kerja fiqh yang '
          'menentukan kesahan dan kesempurnaan ibadah. Menurut al-Idah '
          'karangan Imam an-Nawawi, rukun Haji ada lima: Ihram, Wukuf di '
          'Arafah, Tawaf Ifadah, Sa\u2019i, dan bercukur/bergunting — '
          'Imam an-Nawawi tidak mengira "tertib" (susunan) sebagai '
          'rukun keenam yang berasingan, walaupun beliau menegaskan '
          'tertib itu wajib dalam kebanyakan rukun tersebut. Wajib Haji '
          'pula berbeza daripada rukun kerana ia boleh digantikan dengan '
          'dam jika ditinggalkan, sama ada sengaja atau terlupa, '
          'sementara Hajinya tetap sah — '
          'iaitu berihram dari miqat, jam\u2019 di Arafah, mabit '
          'Muzdalifah, mabit Mina, melontar jamrah, dan '
          'Tawaf Wada\u2019. Al-Idah sendiri menyebut empat daripada '
          'enam wajib itu diperselisihkan (contoh: jam’ di Arafah dan '
          'Tawaf '
          'Wada\u2019), '
          'justeru jemaah digalakkan merujuk pembimbing Haji bertauliah '
          'bagi isu yang lebih terperinci.',
      reflectionQuestions: <String>[
        'Mengapakah Imam an-Nawawi tidak mengira "tertib" (susunan) '
            'sebagai rukun keenam yang berasingan, walaupun tertib itu '
            'wajib dalam kebanyakan rukun Haji?',
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
            '3. Meminyakkan rambut — tidak meminyakkan rambut kepala dan janggut.',
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
                sumber:
                    'Riwayat al-Bukhari dan Muslim (lafaz Muslim) '
                    'daripada Ibnu Umar r.a',
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
            teksKitab:
                'Imam an-Nawawi menegaskan dalam fasal selepas '
                'Muharramat al-Ihram, Bab Kedua al-Idah, bahawa '
                'ketujuh-tujuh larangan ihram terpakai sama rata kepada '
                'wanita seperti lelaki, melainkan apa yang telah '
                'dikecualikan — iaitu wanita diharuskan memakai '
                'pakaian berjahit dan menutup kepala, tetapi tetap '
                'diharamkan menutup wajah. Beliau turut mengingatkan '
                'bahawa sesiapa (lelaki atau wanita) yang sengaja '
                'melanggar sambil berkata "aku akan berfidyah" adalah '
                'suatu kesilapan yang nyata dan kejahilan yang keji, '
                'kerana fidyah tidak mengharuskan perbuatan haram itu '
                'dan tidak mengangkat dosanya.',
            permasalahan: <String>[
              'Kesalahan yang dilakukan secara terlupa atau kerana jahil '
                  '(tidak tahu hukum) dimaafkan dosanya. Bagi larangan '
                  'yang bersifat bersenang-senang (tarafuh) seperti '
                  'wangian dan pakaian, tiada fidyah — namun wajib '
                  'berhenti atau menanggalkannya serta-merta sebaik '
                  'menyedari kesilapan. Bagi larangan yang bersifat '
                  'itlaf (memusnahkan) seperti mencukur/mencabut rambut, '
                  'memotong kuku dan memburu, fidyah tetap wajib '
                  'walaupun terlupa atau jahil menurut pendapat asah, '
                  'kerana itlaf tidak gugur ganti ruginya dengan uzur '
                  '(al-Idah, Bab Kedua: an-Naw’ ar-Rabi’).',
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
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'مَنْ حَجَّ فَلَمْ يَرْفُثْ وَلَمْ يَفْسُقْ رَجَعَ '
                    'كَيَوْمِ وَلَدَتْهُ أُمُّهُ',
                terjemahan:
                    'Sesiapa yang menunaikan Haji lalu tidak melakukan '
                    'rafath (percakapan/perbuatan lucah) dan tidak '
                    'berbuat fasiq, dia kembali (bersih daripada dosa) '
                    'seperti hari dia dilahirkan oleh ibunya.',
                sumber:
                    'Riwayat al-Bukhari daripada Abu Hurairah r.a; '
                    'makna yang sama diriwayatkan oleh Muslim',
              ),
            ],
            teksKitab:
                'Imam an-Nawawi dalam Fasal Adab al-Ihram, Bab Kedua '
                'al-Idah, menggalakkan jemaah mandi sunat sebelum '
                'berihram, memakai pakaian ihram yang bersih (afdal '
                'berwarna putih), serta menunaikan solat sunat dua '
                'rakaat sebelum berniat — kesemuanya bertujuan '
                'menghadirkan hati dengan penuh kesedaran dan '
                'keikhlasan sebelum memasuki status suci ihram.',
            permasalahan: <String>[
              'Lelaki dituntut menanggalkan pakaian berjahit sebelum '
                  'berniat ihram (tajarrud). Jika dia berniat ihram '
                  'sedang masih memakai pakaian berjahit, ihramnya tetap '
                  'sah, tetapi dia wajib menanggalkannya serta-merta; '
                  'jika terus memakainya, dia melanggar larangan ihram '
                  'dan wajib membayar fidyah.',
              'Akhlak sepanjang ihram bukan sekadar adab peribadi, '
                  'tetapi sebahagian daripada syarat Haji yang mabrur '
                  '— jemaah digalakkan menjauhi pertikaian, perbuatan '
                  'fasiq dan percakapan lucah sepanjang tempoh ibadah '
                  'demi meraih pengampunan dosa yang dijanjikan.',
            ],
          ),
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
        _duaLabbaikAlAisy,
        _duaIstighfarIhram,
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
          'keharaman perbuatan itu sendiri. Kesalahan yang dilakukan '
          'secara terlupa atau kerana jahil (tidak tahu hukum) pula '
          'dimaafkan dosanya; bagi wangian dan pakaian tiada fidyah, '
          'tetapi bagi mencukur rambut, memotong kuku dan memburu '
          'fidyah tetap wajib kerana ia bersifat itlaf (memusnahkan) '
          '— dan jemaah wajib berhenti serta-merta sebaik sahaja '
          'menyedari kesilapan.',
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
            permasalahan: <String>[
              'Hasyiah Ibn Hajar al-Haytami (dinukil dalam nota kaki '
                  'pada permulaan Bab Ketujuh al-Idah) membahagikan '
                  'wajib dam mengikut dua paksi: cara pelaksanaan (tertib — mesti '
                  'ikut susunan tertentu; atau takhyir — bebas memilih) '
                  'dan jenis gantian (taqdir — ditetapkan kadarnya oleh '
                  'syarak, seperti puasa tiga hari; atau ta’dil — '
                  'dinilai mengikut harga pasaran semasa). Gabungan '
                  'kedua-dua paksi ini menghasilkan empat kombinasi '
                  'asas yang menentukan jenis dam setiap kesalahan.',
              'Kesilapan biasa jemaah ialah menganggap semua dam '
                  'bermaksud menyembelih seekor kambing atau unta — '
                  'sedangkan sebahagian dam sebenarnya gantian ringan '
                  'seperti bersedekah beberapa cupak makanan atau '
                  'berpuasa tiga hari sahaja, bergantung kepada jenis '
                  'pelanggaran dan kemampuan kewangan jemaah.',
            ],
          ),
        ),
        LearningSection(
          title: 'Dua kategori utama dam',
          points: <String>[
            'Dam tertib-taqdir — bagi meninggalkan wajib Haji (contoh: tidak bermalam di Muzdalifah/Mina): wajib sembelih kambing; jika tidak mampu, puasa 3 hari dan 7 hari selepas pulang. Puasa 3 hari "semasa Haji" hanya dapat dilakukan jika wajib itu tertinggal sebelum wukuf (contoh: melepasi miqat tanpa ihram); jika tertinggal selepasnya, puasa 3 hari itu dilakukan selepas Haji.',
            'Dam takhyir-taqdir — bagi larangan ihram seperti mencukur, memotong kuku, memakai wangian atau pakaian berjahit (sama ada kerana uzur atau tidak): pilih antara sembelih seekor kambing, sedekah tiga gantang (3 sa’) makanan kepada 6 orang miskin, atau puasa 3 hari.',
            'Dam Tamattu’ dan Qiran — wajib ke atas jemaah yang menggabungkan Umrah dan Haji dalam satu musim tanpa kembali ke miqat asal.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'فَإِذَا أَمِنتُمْ فَمَن تَمَتَّعَ بِالْعُمْرَةِ '
                    'إِلَى الْحَجِّ فَمَا اسْتَيْسَرَ مِنَ الْهَدْيِ، '
                    'فَمَن لَّمْ يَجِدْ فَصِيَامُ ثَلَاثَةِ أَيَّامٍ فِي '
                    'الْحَجِّ وَسَبْعَةٍ إِذَا رَجَعْتُم',
                terjemahan:
                    '...maka sesiapa yang ingin mengerjakan Umrah '
                    'sebelum Haji, wajiblah dia menyembelih korban yang '
                    'mudah didapati; sesiapa yang tidak mampu, '
                    'hendaklah dia berpuasa tiga hari semasa Haji dan '
                    'tujuh hari apabila kamu kembali — dalil dam '
                    'tertib-taqdir (mesti sembelih dahulu, jika tidak '
                    'mampu barulah berpuasa).',
                sumber: 'Al-Baqarah (2):196',
              ),
              DalilItem(
                arabic:
                    'لَعَلَّكَ آذَاكَ هَوَامُّ رَأْسِكَ؟ قَالَ: نَعَمْ. '
                    'فَقَالَ: احْلِقْ رَأْسَكَ وَصُمْ ثَلَاثَةَ أَيَّامٍ '
                    'أَوْ أَطْعِمْ سِتَّةَ مَسَاكِينَ أَوِ انْسُكْ '
                    'شَاةً',
                terjemahan:
                    '(Nabi SAW bertanya kepada Ka’ab bin Ujrah r.a yang '
                    'diganggu kutu di kepalanya semasa ihram): '
                    '"Barangkali kutu di kepalamu menyusahkanmu?" '
                    'Jawabnya: "Ya." Sabda Baginda: "Bercukurlah, dan '
                    'berpuasalah tiga hari, atau berilah makan enam '
                    'orang miskin, atau sembelihlah seekor kambing" — '
                    'dalil dam takhyir-taqdir (bebas memilih antara '
                    'tiga kaedah).',
                sumber:
                    'Riwayat al-Bukhari dan Muslim daripada Ka’ab '
                    'bin Ujrah r.a',
              ),
            ],
            teksKitab:
                'Hasyiah Ibn Hajar al-Haytami, yang dinukil dalam nota '
                'kaki pada permulaan Bab Ketujuh al-Idah, merumuskan '
                'bahawa wajib dam sama ada tertib (mesti ikut susunan tertentu, tidak '
                'boleh berpindah kepada gantian seterusnya melainkan '
                'setelah tidak berdaya pada yang pertama) atau takhyir '
                '(bebas memilih terus tanpa sebarang susunan), '
                'digabungkan pula dengan sama ada gantiannya taqdir '
                '(ditetapkan kadarnya oleh syarak) atau ta’dil '
                '(dinilai mengikut harga pasaran semasa).',
            permasalahan: <String>[
              'Dam tertib-taqdir dinamakan "tertib" kerana susunannya '
                  'wajib diikuti — sembelih dahulu, jika tidak mampu '
                  'barulah beralih kepada puasa; tidak boleh terus '
                  'memilih puasa walaupun mampu berpuasa dengan mudah.',
              'Dam takhyir-taqdir pula membenarkan jemaah memilih '
                  'terus antara tiga kaedah tanpa perlu mengikut '
                  'susunan tertentu; ia dikenakan kerana melakukan '
                  'larangan ihram, bukan kerana meninggalkan wajib.',
              'Al-Idah menggolongkan dam Tamattu’/Qiran sebagai dam '
                  'kerana meninggalkan wajib yang diizinkan (iaitu '
                  'ihram dari miqat bagi salah satu nusuk) dan '
                  'menyamakan waktunya dengan "dam-dam jubran" lain — '
                  'ia dam tertib-taqdir yang sama seperti dam '
                  'meninggalkan wajib Haji.',
            ],
          ),
        ),
        LearningSection(
          title: 'Tindakan jemaah',
          points: <String>[
            'Jangan menentukan dam sendiri hanya berdasarkan andaian.',
            'Catat perkara yang berlaku dan rujuk pembimbing Haji atau pegawai bertauliah.',
          ],
          deepDive: SectionDeepDive(
            teksKitab:
                'Oleh sebab hukum dam melibatkan pelbagai kombinasi '
                '(tertib/takhyir digabung taqdir/ta’dil) seperti yang '
                'dirumuskan dalam hasyiah Ibn Hajar pada permulaan Bab '
                'Ketujuh al-Idah, jemaah '
                'yang tidak pasti status pelanggarannya digalakkan '
                'mencatat kejadian sebenar — bila, di mana, dan dalam '
                'keadaan apa ia berlaku — lalu merujuk pembimbing Haji '
                'yang mahir, bukan menentukan sendiri jenis dam '
                'berdasarkan sangkaan.',
            permasalahan: <String>[
              'Menurut al-Idah, mencukur rambut kerana uzur (seperti '
                  'kutu atau luka di kepala) tetap mewajibkan fidyah '
                  'takhyir-taqdir yang sama seperti mencukur tanpa uzur '
                  '— yang berbeza hanyalah dosa: tiada dosa bagi yang '
                  'beruzur, berdosa bagi yang sengaja tanpa uzur. Mazhab '
                  'Hanafi pula menghadkan pilihan (takhyir) kepada yang '
                  'beruzur sahaja.',
              'Status jemaah (mampu/tidak mampu dari sudut kewangan, '
                  'ada/tiada di Tanah Suci semasa pelanggaran berlaku) '
                  'turut mengubah jenis gantian yang wajib — justeru '
                  'rujukan kepada pembimbing bertauliah lebih selamat '
                  'berbanding membuat kesimpulan sendiri.',
            ],
          ),
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
        _duaSembelihan,
      ],
      academicInsight:
          'Syariat dam mencerminkan sifat rahmat Allah SWT dalam ibadah '
          'Haji — kesilapan atau kekurangan yang berlaku tidak '
          'semestinya membatalkan seluruh ibadah, sebaliknya boleh '
          'diselesaikan melalui mekanisme tertentu. Bab Ketujuh al-Idah '
          'membahagikan punca dam kepada dua: meninggalkan perkara yang '
          'diperintahkan dan melakukan perkara yang dilarang. Dua jenis '
          'dam yang paling kerap ialah dam tertib dan taqdir (bagi '
          'Tamattu’, Qiran dan meninggalkan wajib Haji — sembelih '
          'dahulu, jika tidak mampu barulah berpuasa) dan dam takhyir '
          'dan taqdir (bagi larangan ihram seperti mencukur, memotong '
          'kuku dan wangian — jemaah bebas memilih antara tiga kaedah '
          'tanpa urutan). Asas pensyariatan dam turut disebut dalam '
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
      subtitle: 'Doa dan zikir al-Idah mengikut turutan perjalanan Haji.',
      icon: HajjIconType.doa,
      accent: Color(0xFF3887B6),
      sections: <LearningSection>[
        LearningSection(
          title: 'Talbiyah',
          points: <String>[
            'Perbanyak talbiyah selepas berniat ihram sehingga mula bertahallul (bagi Haji) atau memulakan tawaf (bagi Umrah).',
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
            teksKitabArabic:
                'الْمُسْتَحَبُّ فِيهَا أَنْ يَقْتَصِرَ عَلَى تَلْبِيَةِ '
                'رَسُولِ اللهِ ﷺ',
            teksKitab:
                'Imam an-Nawawi dalam Fasal at-Talbiyah, Bab Kedua '
                'al-Idah, menyatakan yang disunatkan adalah berpada '
                'dengan talbiyah Rasulullah SAW tanpa tambahan, '
                'digalakkan diulang tiga kali setiap kali, serta '
                'disertai selawat ke atas Nabi SAW dan doa selepasnya. '
                'Talbiyah disunatkan dibaca dalam segala keadaan — '
                'ketika berdiri, duduk, menaiki kenderaan, turun, dan '
                'pada setiap kali keadaan atau tempat berubah. Waktunya '
                'bermula sejak berihram dan berterusan sehingga jemaah '
                'mula bertahallul.',
            permasalahan: <String>[
              'Talbiyah disunatkan diperbanyak dan dikuatkan suara bagi '
                  'lelaki (mengikut kemampuan tanpa membebankan diri), '
                  'manakala wanita cukup sekadar didengari oleh dirinya '
                  'sendiri.',
              'Bagi Haji, talbiyah berterusan sehingga mula bertahallul '
                  '— nota kaki muhaqqiq menjelaskannya sebagai lontaran '
                  'batu pertama di Jamrah Aqabah pada Hari Nahar. '
                  'Menurut pendapat asah, talbiyah tidak dibaca semasa '
                  'Tawaf Qudum dan Sa’i kerana kedua-duanya mempunyai '
                  'zikir khusus. Bagi Umrah pula, talbiyah diputuskan '
                  'sebaik sahaja memulakan tawaf.',
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
            teksKitabArabic:
                'قَالَ الشَّافِعِيُّ رَحِمَهُ اللَّهُ تَعَالَى: هَذَا '
                'أَحَبُّ مَا يُقَالُ فِي الطَّوَافِ، قَالَ: وَأُحِبُّ '
                'أَنْ يُقَالَ فِي كُلِّهِ. قَالَ أَصْحَابُنَا: وَهُوَ '
                'فِيمَا بَيْنَ الرُّكْنِ الْيَمَانِي وَالْأَسْوَدِ آكَدُ',
            teksKitab:
                'Dalam Fasal Kaifiyat Tawaf (Bab Ketiga al-Idah), Imam '
                'an-Nawawi menyebut hadis Anas r.a tentang doa ini, '
                'lalu menukilkan kata-kata Imam as-Syafi’i bahawa doa '
                'ini paling disukai untuk dibaca dalam tawaf dan '
                'sepanjang tawaf, manakala ashab Syafi’i menyatakan ia '
                'lebih dituntut (akad) di antara Rukun Yamani dan Hajar '
                'Aswad. Ia juga sesuai dibaca pada bila-bila masa kerana '
                'ia doa ma’thur daripada Al-Quran sendiri.',
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
            'Perbanyak istighfar, selawat, tasbih, tahmid dan takbir.',
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
            teksKitab:
                'Imam an-Nawawi menyebut dalam Fasal at-Talbiyah bahawa '
                'selepas talbiyah dan selawat ke atas Nabi SAW, jemaah '
                'disunatkan terus berdoa dengan apa-apa yang disukainya '
                'untuk dirinya dan untuk orang lain — menunjukkan '
                'keluasan ruang doa peribadi di samping doa-doa '
                'ma’thur yang khusus bagi sesuatu tempat atau amalan.',
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
        // Disusun mengikut turutan perjalanan Haji.
        _duaKeluarRumah,
        _duaMenaikiKenderaan,
        _duaNiatHaji,
        _duaTalbiyah,
        _duaTanahHaram,
        _duaMelihatKaabah,
        _duaMasukMasjid,
        _duaMulaTawaf,
        _duaRamal,
        _duaEmpatPusinganAkhir,
        _duaAntaraDuaRukun,
        _duaZamzam,
        _duaZikirSafa,
        _duaDiSafa,
        _duaSaie,
        _duaMenujuArafah,
        _duaTahlilArafah,
        _duaNabiDiArafah,
        _duaAmpunArafah,
        _duaKemuliaanTaat,
        _duaMasyaril,
        _duaTakbirJamrah,
        _duaSelepasJamrah,
        _duaMultazamWada,
        _duaPulang,
        _duaMasukRumah,
        ModuleDua(
          title: 'Sayyidul Istighfar (Penghulu Segala Istighfar)',
          arabic:
              'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَـٰهَ إِلَّا أَنْتَ، '
              'خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَىٰ عَهْدِكَ '
              'وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا '
              'صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ '
              'لَكَ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ '
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
          source: 'Riwayat al-Bukhari daripada Syaddad bin Aus r.a',
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
    ...idahModulesBab1Bab2,
    ...idahModulesTawafSai,
    ...idahModulesArafahMuzdalifah,
    ...idahModulesNahrTasyriq,
    ...idahModulesBab5Bab6,
    ...idahModulesBab7Bab8,
    LearningModuleData(
      number: kNomborModulPenilaian,
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
            const Positioned.fill(child: KaleidoscopeBackdrop(opacity: 0.22)),
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
                        ScrollReveal(
                          child: Row(
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
                                      style: TextStyle(
                                        fontFamily: AppFonts.display,
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
                        ),
                        const SizedBox(height: 26),
                        ScrollReveal(
                          delay: const Duration(milliseconds: 80),
                          child: _LearningIntroCard(
                            moduleCount: modules.length,
                          ),
                        ),
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
                                    style: TextStyle(
                                      fontFamily: AppFonts.display,
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
                                  color: palette.emerald.withValues(
                                    alpha: 0.22,
                                  ),
                                ),
                              ),
                              child: Text(
                                '${modules.length} topik',
                                style: TextStyle(
                                  color: palette.emerald,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        LayoutBuilder(
                          builder:
                              (
                                BuildContext context,
                                BoxConstraints constraints,
                              ) {
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
                                  children: modules.asMap().entries.map((
                                    MapEntry<int, LearningModuleData> entry,
                                  ) {
                                    final int index = entry.key;
                                    final LearningModuleData module =
                                        entry.value;
                                    return SizedBox(
                                      width: width,
                                      child: ScrollReveal(
                                        delay: Duration(
                                          milliseconds: 50 * (index % 6),
                                        ),
                                        child: _LearningModuleCard(
                                          module: module,
                                          onTap: () {
                                            if (module.number ==
                                                kNomborModulPenilaian) {
                                              Navigator.of(context).push(
                                                MaterialPageRoute<void>(
                                                  builder: (_) {
                                                    return FinalAssessmentScreen(
                                                      assessmentBox:
                                                          assessmentBox,
                                                      certificatesBox:
                                                          certificatesBox,
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

/// Modul Belajar Umrah — kotak silibus berasingan daripada Modul Belajar
/// Haji, tetapi menggunakan struktur data ([LearningModuleData],
/// [LearningSection], [SectionDeepDive]), ikon ([HajjIconType]) dan
/// widget-widget (`_LearningIntroCard`, `_LearningModuleCard`,
/// [LearningDetailScreen]) yang sama seperti Modul Belajar Haji, selaras
/// dengan Bab 4 (Umrah / العمرة) kitab al-Idah karangan Imam an-Nawawi.
///
/// Nombor modul sengaja bermula dengan "U" (U1-U4) supaya tidak berlanggar
/// dengan `_interactiveConfigFor` yang dipetakan khusus untuk nombor modul
/// Haji ('01'-'05') — Modul Umrah tiada kuiz interaktif buat masa ini.
class UmrahLearningModuleScreen extends StatelessWidget {
  const UmrahLearningModuleScreen({super.key});

  static const List<LearningModuleData> modules = <LearningModuleData>[
    LearningModuleData(
      number: 'U1',
      title: 'Asas Umrah',
      subtitle: 'Kenali maksud, hukum, miqat dan gambaran perjalanan Umrah.',
      icon: HajjIconType.kaaba,
      accent: Color(0xFF2F8F79),
      sections: <LearningSection>[
        LearningSection(
          title: 'Pengertian Umrah',
          points: <String>[
            'Umrah ialah menziarahi Baitullah untuk melaksanakan ihram, Tawaf, Sa’i dan bercukur/bergunting.',
            'Umrah turut dikenali sebagai "Haji Kecil" kerana rukunnya sebahagian daripada rukun Haji.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic: 'وَأَتِمُّوا الْحَجَّ وَالْعُمْرَةَ لِلَّهِ',
                terjemahan:
                    'Dan sempurnakanlah ibadat Haji dan Umrah kerana Allah.',
                sumber: 'Al-Baqarah (2):196',
              ),
              DalilItem(
                terjemahan:
                    'Berhajilah untuk bapamu dan ber-Umrahlah — jawapan '
                    'Nabi SAW kepada seorang lelaki yang bapanya telah '
                    'tua dan tidak mampu menunaikan Haji atau Umrah.',
                sumber: 'Riwayat Abu Dawud dan at-Tirmidhi',
              ),
            ],
            teksKitab:
                'Bab Keempat al-Idah (tentang Umrah) mengambil pendapat '
                'yang sahih (al-madzhab as-sahih) daripada dua pendapat '
                'Imam as-Syafi’i bahawa Umrah adalah fardu ke atas yang '
                'berkemampuan, sama seperti Haji, dan hanya wajib sekali '
                'seumur hidup.',
            permasalahan: <String>[
              'Nota kaki muhaqqiq al-Idah mencatat bahawa Imam Malik '
                  'dan Imam Abu Hanifah berpendapat Umrah adalah sunat '
                  'seumur hidup, bukan fardu — khilaf ini tidak menjejaskan '
                  'kesahan Umrah, hanya status wajib/sunatnya.',
              'Digalakkan memperbanyakkan Umrah sunat tambahan selepas '
                  'menunaikan Umrah fardu, terutama dalam bulan Ramadan.',
            ],
          ),
        ),
        LearningSection(
          title: 'Miqat Umrah',
          points: <String>[
            'Miqat makani sama seperti miqat Haji bagi yang datang dari luar Makkah.',
            'Bagi yang sudah berada di Makkah, wajib keluar ke Tanah Halal terdekat sebelum berniat.',
            'Miqat zamani: sepanjang tahun, tiada had waktu tertentu (berbeza daripada Haji).',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'هُنَّ لَهُنَّ، وَلِمَنْ أَتَى عَلَيْهِنَّ مِنْ '
                    'غَيْرِ أَهْلِهِنَّ، مِمَّنْ أَرَادَ الْحَجَّ أَوِ '
                    'الْعُمْرَةَ',
                terjemahan:
                    '(Tempat-tempat miqat) itu ditetapkan bagi '
                    'penduduknya, dan juga bagi sesiapa yang melaluinya '
                    'walaupun bukan penduduk asalnya, daripada mereka '
                    'yang hendak menunaikan Haji atau Umrah.',
                sumber:
                    'Riwayat al-Bukhari dan Muslim daripada Ibnu '
                    'Abbas r.a',
              ),
              DalilItem(
                terjemahan:
                    'Baginda SAW mengutus Abdul Rahman bin Abu Bakar '
                    'r.a bersama Aisyah r.a ke Tan’im supaya dia '
                    'berihram semula dari sana bagi menunaikan Umrah '
                    'yang berasingan daripada Hajinya.',
                sumber: 'Riwayat Muslim daripada Aisyah r.a',
              ),
            ],
            teksKitabArabic:
                'لِلْعُمْرَةِ الْمُفْرَدَةِ عَنِ الْحَجّ مِيقَاتَانِ '
                'زَمَانِي وَمَكَانِي',
            teksKitab:
                'Umrah yang berasingan daripada Haji mempunyai dua miqat: '
                'zamani dan makani. Mazhab Syafi’i meletakkan Ji’ranah '
                'sebagai tempat paling afdal untuk berihram Umrah kerana '
                'Nabi SAW pernah berihram dari sana, diikuti Tan’im, '
                'kemudian Hudaibiyah.',
            permasalahan: <String>[
              'Ihram Umrah tidak sah bagi jemaah yang masih berihram '
                  'Haji, dan juga selepas kedua-dua tahallul selagi dia '
                  'masih bermukim di Mina untuk melontar.',
              'Selepas nafar (bertolak) daripada Mina, jemaah boleh '
                  'mengerjakan Umrah pada baki hari Tasyriq, tetapi lebih '
                  'afdal menunggu sehingga hari Tasyriq berakhir.',
            ],
          ),
        ),
        LearningSection(
          title: 'Gambaran Perjalanan Umrah',
          points: <String>[
            'Berihram dari miqat dengan niat Umrah.',
            'Tawaf tujuh pusingan mengelilingi Kaabah.',
            'Sa’i tujuh kali antara Safa dan Marwah.',
            'Bercukur atau bergunting — Umrah selesai dengan SATU tahallul sahaja.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'الْعُمْرَةُ إِلَى الْعُمْرَةِ كَفَّارَةٌ لِمَا '
                    'بَيْنَهُمَا وَالْحَجُّ الْمَبْرُورُ لَيْسَ لَهُ '
                    'جَزَاءٌ إِلَّا الْجَنَّةُ',
                terjemahan:
                    'Umrah ke Umrah adalah kifarah (penghapus dosa) bagi '
                    'tempoh antara keduanya, dan Haji yang mabrur tiada '
                    'balasan baginya melainkan syurga.',
                sumber: 'Riwayat al-Bukhari dan Muslim',
              ),
              DalilItem(
                arabic: 'وَأَتِمُّوا الْحَجَّ وَالْعُمْرَةَ لِلَّهِ',
                terjemahan:
                    'Dan sempurnakanlah ibadat Haji dan Umrah kerana '
                    'Allah — dalil kewajipan menyempurnakan setiap '
                    'rukun Umrah sebaik sahaja dimulakan.',
                sumber: 'Al-Baqarah (2):196',
              ),
            ],
            teksKitabArabic:
                'فَإِذَا فَعَلَ ذَلِكَ تَمَّتْ عُمْرَتُهُ وَحَل مِنْهَا '
                'حَلاًّ كَامِلاً وَلَمْ يَبْقَ مِنْهَا شَيْءٌ وَلَيْسَ '
                'لَهَا إِلاَّ تَحَللٌ وَاحِدٌ',
            teksKitab:
                'Apabila selesai bercukur/bergunting, sempurnalah '
                'Umrahnya dan terlepas sepenuhnya daripada ihram, tiada '
                'tinggal apa-apa lagi daripadanya, dan Umrah tidak '
                'mempunyai melainkan SATU tahallul — berbeza daripada '
                'Haji yang mempunyai tahallul awal dan tahallul thani.',
            permasalahan: <String>[
              'Nota kaki muhaqqiq al-Idah mencatat bahawa Imam Malik '
                  'memandang makruh mengulangi Umrah dalam satu tahun, '
                  'kerana Nabi SAW tidak berulang-ulang melakukannya; '
                  'manakala ulama lain (termasuk mazhab Syafi’i) '
                  'mengharuskannya, berdasarkan hadis Aisyah r.a yang '
                  'mengerjakan dua Umrah dalam tahun yang sama. '
                  'An-Nawawi sendiri menyatakan bahawa memperbanyakkan '
                  'Umrah itu disunatkan.',
            ],
          ),
        ),
      ],
      duas: <ModuleDua>[
        ModuleDua(
          title: 'Doa Haji dan Umrah Mabrur',
          arabic:
              'اللَّهُمَّ اجْعَلْهُ حَجًّا مَبْرُورًا، وَذَنْبًا '
              'مَغْفُورًا، وَسَعْيًا مَشْكُورًا',
          translation:
              'Ya Allah, jadikanlah ia Haji yang mabrur, dosa yang '
              'diampunkan dan usaha yang diterima.',
          source:
              'Al-Idah, Fasal Kaifiyat Tawaf — dibaca ketika ramal; '
              'nota kaki muhaqqiq menjelaskan ia dibaca oleh jemaah '
              'Haji dan Umrah kerana Umrah juga dinamakan "haji"',
        ),
        _duaMelepaskanMusafir,
        _duaMenaikiKenderaan,
      ],
      academicInsight:
          'Umrah sering digelar "Haji Kecil" kerana empat daripada lima '
          'rukun Haji — Ihram, Tawaf, Sa’i dan bercukur — turut menjadi '
          'rukun Umrah; yang tiada dalam Umrah hanyalah Wukuf di '
          'Arafah. Kelebihan Umrah '
          'turut disebut Rasulullah SAW: "Umrah ke Umrah adalah kifarah '
          'dosa antara keduanya" (riwayat al-Bukhari dan Muslim), dan '
          '"Umrah dalam Ramadan menyamai (pahala) Haji bersamaku" '
          '(riwayat al-Bukhari dan Muslim daripada Ibnu Abbas r.a).',
      reflectionQuestions: <String>[
        'Mengapakah Umrah digelar "Haji Kecil", dan apakah rukun Haji '
            'yang tidak terdapat dalam Umrah?',
        'Apakah hikmah Umrah tidak terikat dengan bulan-bulan tertentu, '
            'berbeza dengan Haji?',
      ],
    ),
    LearningModuleData(
      number: 'U2',
      title: 'Rukun & Wajib Umrah',
      subtitle: 'Fahami perkara yang menentukan sah atau sempurnanya Umrah.',
      icon: HajjIconType.rukun,
      accent: Color(0xFFB18443),
      sections: <LearningSection>[
        LearningSection(
          title: 'Rukun Umrah (Empat)',
          points: <String>[
            'Ihram (niat).',
            'Tawaf.',
            'Sa’i.',
            'Bercukur atau bergunting (halq/taqsir).',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'ثُمَّ لْيَقْضُوا تَفَثَهُمْ وَلْيُوفُوا نُذُورَهُمْ '
                    'وَلْيَطَّوَّفُوا بِالْبَيْتِ الْعَتِيقِ',
                terjemahan:
                    'Hendaklah mereka menyempurnakan kebersihan diri, '
                    'menyempurnakan nazar mereka, dan hendaklah mereka '
                    'bertawaf di Baitul Atiq (Kaabah) — dalil kewajipan '
                    'Tawaf.',
                sumber: 'Al-Hajj (22):29',
              ),
              DalilItem(
                arabic: 'إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ',
                terjemahan:
                    'Sesungguhnya Safa dan Marwah adalah sebahagian '
                    'daripada syiar-syiar Allah — dalil kewajipan Sa’i.',
                sumber: 'Al-Baqarah (2):158',
              ),
            ],
            teksKitabArabic:
                'وَأَرْكَانُ العُمْرَةِ أَرْبَعَةٌ: الإِْحْرَامُ '
                'وَالطَّوَافُ وَالسَّعْيُ وَالْحَلْقُ إِذَا قُلْنَا '
                'بِالأَصَحِّ إِنَّهُ نُسُكٌ',
            teksKitab:
                'Rukun Umrah ada empat: Ihram, Tawaf, Sa’i, dan '
                'bercukur — mengikut pendapat yang asah (paling sahih) '
                'bahawa bercukur itu adalah nusuk (sebahagian ibadah), '
                'bukan sekadar wajib.',
            permasalahan: <String>[
              'Nota kaki muhaqqiq al-Idah menyatakan bahawa tertib '
                  'dalam kesemua rukun Umrah ialah rukun kelima yang '
                  'difahami daripada kata-kata Imam an-Nawawi, walaupun '
                  'beliau tidak menyebutnya secara berasingan. Berbeza '
                  'dengan Haji, tertib dalam Umrah merangkumi semua '
                  'rukun: ihram, kemudian tawaf, kemudian sa’i, '
                  'kemudian bercukur.',
            ],
          ),
        ),
        LearningSection(
          title: 'Wajib Umrah (Satu)',
          points: <String>[
            'Berihram dari miqat yang betul — satu-satunya wajib Umrah.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic:
                    'هُنَّ لَهُنَّ، وَلِمَنْ أَتَى عَلَيْهِنَّ مِنْ '
                    'غَيْرِ أَهْلِهِنَّ، مِمَّنْ أَرَادَ الْحَجَّ أَوِ '
                    'الْعُمْرَةَ',
                terjemahan:
                    '(Tempat-tempat miqat) itu ditetapkan bagi '
                    'penduduknya, dan juga bagi sesiapa yang melaluinya '
                    'walaupun bukan penduduk asalnya, daripada mereka '
                    'yang hendak menunaikan Haji atau Umrah — dalil '
                    'kewajipan berihram dari miqat yang betul.',
                sumber:
                    'Riwayat al-Bukhari dan Muslim daripada Ibnu '
                    'Abbas r.a',
              ),
            ],
            teksKitabArabic:
                'وَوَاجِبَاتُهَا التَّقَيُّدُ بِالإِْحْرَامِ مِنَ '
                'الْمِيقَاتِ وَسُنَنُهَا مَا زَادَ عَلَى ذَلِكَ',
            teksKitab:
                'Wajib Umrah ialah terikat dengan ihram dari miqat yang '
                'betul; manakala sunatnya pula ialah apa-apa yang lebih '
                'daripada itu.',
            permasalahan: <String>[
              'Umrah jauh lebih ringkas berbanding Haji yang mempunyai '
                  'enam wajib (ihram dari miqat, jam’ di Arafah, mabit '
                  'Muzdalifah, mabit Mina, lontar tiga jamrah, Tawaf '
                  'Wada’) — kerana Umrah tiada Wukuf, mabit atau '
                  'lontaran jamrah.',
            ],
          ),
        ),
        LearningSection(
          title: 'Perbezaan dengan Haji',
          points: <String>[
            'Umrah tiada Wukuf di Arafah, tiada mabit Muzdalifah/Mina, dan tiada lontar jamrah.',
            'Umrah hanya satu tahallul; Haji mempunyai dua (tahallul awal dan tahallul thani).',
            'Umrah boleh dilakukan bila-bila masa sepanjang tahun; Haji terikat bulan-bulan tertentu.',
          ],
          deepDive: SectionDeepDive(
            teksKitab:
                'Imam an-Nawawi menyatakan dalam Bab Keempat al-Idah '
                'bahawa sepanjang tahun ialah waktu bagi Umrah. Dalam '
                'perbahasan fawat (luput) Haji pada Bab Ketujuh pula, '
                'nota kaki muhaqqiq (al-Ifsah) menjelaskan bahawa Umrah '
                'tidak tergambar luput kerana seluruh tahun ialah '
                'waktunya — berbeza sepenuhnya dengan Haji yang terikat musim '
                'tertentu dan boleh tertinggal (fawat) jika jemaah '
                'gagal Wukuf di Arafah pada waktunya, lalu diwajibkan '
                'qada dan dam.',
            permasalahan: <String>[
              'Oleh sebab Umrah tidak mempunyai had waktu yang boleh '
                  'luput, ia tidak pernah "fawat" (tertinggal) seperti '
                  'Haji — jemaah yang memulakan Umrah hanya mungkin '
                  'merosakkannya (fasid, contohnya kerana jimak sebelum '
                  'tahallul), bukan terlepas waktu pelaksanaannya.',
              'Apabila jemaah Qiran (Haji dan Umrah serentak dalam '
                  'satu ihram) terlepas Wukuf dan Hajinya fawat, '
                  'Umrahnya turut luput kerana ia mengikut Hajinya — '
                  'menurut ulama Syafi’i (seperti dinukil nota kaki '
                  'muhaqqiq daripada al-Majmu’), dia dikenakan tiga dam '
                  'sekali gus: dam fawat, dam Qiran, dan dam qada '
                  '(walaupun qadanya dikerjakan secara Ifrad).',
            ],
          ),
        ),
      ],
      duas: <ModuleDua>[_duaMulaTawaf, _duaSaie],
      academicInsight:
          'Perbandingan rukun dan wajib antara Umrah dan Haji '
          'menunjukkan Umrah sebagai versi "dipermudahkan" daripada '
          'Haji — empat rukun berbanding lima, dan satu wajib '
          'berbanding enam. Kesederhanaan ini menjelaskan mengapa '
          'Umrah boleh dilaksanakan berulang kali sepanjang tahun tanpa '
          'membebankan jemaah, sekali gus menepati sifat Islam yang '
          'memudahkan umatnya beribadah.',
      reflectionQuestions: <String>[
        'Mengapakah Umrah hanya mempunyai satu wajib berbanding enam '
            'wajib Haji, dan apakah kaitannya dengan struktur rukunnya '
            'yang lebih ringkas?',
        'Bagaimana kesederhanaan Umrah berbanding Haji mencerminkan '
            'sifat kemudahan dalam syariat Islam?',
      ],
    ),
    LearningModuleData(
      number: 'U3',
      title: 'Larangan Ihram Umrah',
      subtitle: 'Kenali perkara yang perlu dijaga sepanjang ihram Umrah.',
      icon: HajjIconType.ihram,
      accent: Color(0xFFC05C65),
      sections: <LearningSection>[
        LearningSection(
          title: 'Tujuh Larangan Ihram (sama seperti Haji)',
          points: <String>[
            '1. Pakaian — lelaki dilarang memakai pakaian berjahit; wanita dilarang menutup wajah dan memakai sarung tangan.',
            '2. Wangian — tidak memakai atau menyapu bahan berbau wangi selepas niat ihram.',
            '3. Meminyakkan rambut — tidak meminyakkan rambut kepala dan janggut.',
            '4. Mencukur & memotong kuku — tidak dibenarkan tanpa uzur syarie.',
            '5. Akad nikah — tidak boleh menikah atau menikahkan orang lain.',
            '6. Jimak dan pendahuluannya — dilarang sepenuhnya sehingga tahallul.',
            '7. Memburu — dilarang membunuh atau memburu binatang buruan darat.',
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
                    'semasa ihram, termasuk ihram Umrah.',
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
                sumber:
                    'Riwayat al-Bukhari dan Muslim (lafaz Muslim) '
                    'daripada Ibnu Umar r.a',
              ),
            ],
            teksKitab:
                'Larangan ihram (muharramat al-ihram / مُحَرَّمَاتُ '
                'الْإِحْرَامِ) bagi Umrah adalah '
                'sama persis dengan larangan ihram Haji yang disenaraikan '
                'dalam Fasal Muharramat al-Ihram, Bab Kedua al-Idah — '
                'rujuk Modul Belajar Haji, "Larangan Ihram" untuk '
                'perincian penuh setiap kategori.',
            permasalahan: <String>[
              'Jimak sebelum tahallul membatalkan (fasid) Umrah — '
                  'jemaah tetap wajib meneruskan Umrah yang rosak itu '
                  'sehingga selesai, kemudian wajib meng-qada’ pada '
                  'masa lain serta membayar dam badanah (unta), lebih '
                  'berat daripada kifarat larangan ihram yang lain.',
              'Jika telah bercukur dua helai rambut sebelum jimak berlaku '
                  'pada helai ketiga, Umrah tetap dikira rosak — kerana '
                  'rukun halq belum sempurna sepenuhnya.',
            ],
          ),
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
          source: 'Al-Mu’minun 23:97–98',
        ),
        _duaLabbaikAlAisy,
        _duaIstighfarIhram,
      ],
      academicInsight:
          'Bab keempat al-Idah menjelaskan hukum fasad (rosaknya) '
          'Umrah akibat jimak sebelum tahallul disamakan dengan hukum '
          'fasad Haji — jemaah wajib meneruskan ibadah yang rosak '
          'itu (tidak boleh membatalkan terus), kemudian meng-qada’nya '
          'pada masa lain, di samping membayar dam badanah. Ini '
          'menegaskan keseriusan menjaga larangan ihram sepanjang '
          'tempoh Umrah, walaupun tempohnya lebih singkat berbanding '
          'Haji.',
      reflectionQuestions: <String>[
        'Mengapakah hukum fasad Umrah akibat jimak disamakan dengan '
            'fasad Haji, walaupun Umrah adalah ibadah yang lebih '
            'ringkas?',
        'Apakah pengajaran daripada kewajipan meneruskan ibadah yang '
            'rosak sehingga selesai, berbanding terus membatalkannya?',
      ],
    ),
    LearningModuleData(
      number: 'U4',
      title: 'Doa & Zikir Umrah',
      subtitle: 'Doa dan zikir al-Idah mengikut turutan perjalanan Umrah.',
      icon: HajjIconType.doa,
      accent: Color(0xFF3887B6),
      sections: <LearningSection>[
        LearningSection(
          title: 'Talbiyah Umrah',
          points: <String>[
            'لَبَّيْكَ اللَّهُمَّ بِعُمْرَةٍ',
            'Aku sahut seruan-Mu ya Allah, dengan Umrah.',
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
                sumber:
                    'Riwayat al-Bukhari dan Muslim daripada Ibnu '
                    'Umar r.a',
              ),
            ],
            teksKitab:
                'Imam an-Nawawi dalam Bab Keempat (Fasal al-Umrah) '
                'al-Idah menyatakan sifat ihram dan talbiyah Umrah '
                'adalah sama seperti Haji dalam segala perkara yang '
                'telah dijelaskan sebelumnya — jemaah terus melafazkan '
                'talbiyah sehingga memasuki Makkah dan memutuskannya '
                'sebaik sahaja memulakan tawaf.',
            permasalahan: <String>[
              'Al-Idah menukilkan Abu Muhammad al-Juwaini bahawa '
                  'disunatkan menyebut nusuk dalam talbiyah pertama '
                  'ketika berihram — "Labbaika Allahumma bi-‘umratin" '
                  'bagi Umrah, "bi-hajjatin" bagi Haji — dengan suara '
                  'perlahan; talbiyah seterusnya dibaca dengan lafaz '
                  'biasa tanpa menyebut nusuk menurut pendapat asah.',
            ],
          ),
        ),
        LearningSection(
          title: 'Doa Antara Rukun Yamani dan Hajar Aswad',
          points: <String>[
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
            'Ya Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan di akhirat, serta peliharalah kami daripada azab neraka.',
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
            ],
            teksKitabArabic:
                'قَالَ الشَّافِعِيُّ رَحِمَهُ اللَّهُ تَعَالَى: هَذَا '
                'أَحَبُّ مَا يُقَالُ فِي الطَّوَافِ، قَالَ: وَأُحِبُّ '
                'أَنْ يُقَالَ فِي كُلِّهِ. قَالَ أَصْحَابُنَا: وَهُوَ '
                'فِيمَا بَيْنَ الرُّكْنِ الْيَمَانِي وَالْأَسْوَدِ آكَدُ',
            teksKitab:
                'Dalam Fasal Kaifiyat Tawaf (Bab Ketiga al-Idah), Imam '
                'an-Nawawi menukilkan kata-kata Imam as-Syafi’i bahawa '
                'doa ini paling disukai untuk dibaca dalam tawaf, '
                'manakala ashab Syafi’i menyatakan ia lebih dituntut '
                '(akad) di antara Rukun Yamani dan Hajar Aswad. '
                'Kedudukan yang sama terpakai dalam tawaf Umrah kerana '
                'Bab Keempat al-Idah menyatakan tawaf Umrah dilakukan '
                'sebagaimana yang telah dihuraikan bagi Haji.',
            permasalahan: <String>[
              'Doa sepanjang tawaf secara umum adalah sunat tanpa lafaz '
                  'tertentu yang diwajibkan; jemaah boleh berdoa dengan '
                  'apa-apa yang disukainya untuk urusan agama dan dunia, '
                  'tetapi doa ini lebih "akad" (dititikberatkan) di '
                  'antara Rukun Yamani dan Hajar Aswad.',
            ],
          ),
        ),
        LearningSection(
          title: 'Amalan Umum',
          points: <String>[
            'Berdoa menggunakan bahasa yang difahami.',
            'Perbanyak istighfar, selawat, tasbih, tahmid dan takbir.',
            'Utamakan keikhlasan dan kefahaman berbanding menghafal tanpa menghayati.',
          ],
          deepDive: SectionDeepDive(
            dalil: <DalilItem>[
              DalilItem(
                arabic: 'الدُّعَاءُ هُوَ الْعِبَادَةُ',
                terjemahan:
                    'Doa itu adalah ibadah — menunjukkan kedudukan doa '
                    'setaraf dengan ibadah lain seperti solat dan '
                    'puasa, termasuk sepanjang ibadah Umrah.',
                sumber: 'Riwayat at-Tirmidhi dan Abu Dawud',
              ),
            ],
            teksKitab:
                'Sama seperti Haji, Imam an-Nawawi menyatakan dalam '
                'Fasal at-Talbiyah bahawa selepas talbiyah dan selawat '
                'ke atas Nabi SAW, jemaah disunatkan terus berdoa '
                'dengan apa-apa yang disukainya untuk dirinya dan '
                'untuk orang lain — Bab Keempat al-Idah menegaskan '
                'perkara ini berlaku sama bagi Umrah kerana sifat '
                'ihram dan doanya disamakan dengan Haji.',
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
        // Subset doa al-Idah yang berkaitan dengan Umrah, ikut turutan.
        _duaKeluarRumah,
        _duaMenaikiKenderaan,
        _duaTalbiyahPertamaUmrah,
        _duaTalbiyah,
        _duaTanahHaram,
        _duaMelihatKaabah,
        _duaMasukMasjid,
        _duaMulaTawaf,
        _duaRamal,
        _duaEmpatPusinganAkhir,
        _duaAntaraDuaRukun,
        _duaZamzam,
        _duaZikirSafa,
        _duaDiSafa,
        _duaSaie,
        _duaMultazamWada,
        _duaPulang,
        _duaMasukRumah,
      ],
      academicInsight:
          'Talbiyah dan doa-doa Umrah pada dasarnya sama dengan Haji, '
          'kerana kedua-dua ibadah berkongsi rukun Ihram, Tawaf dan '
          'Sa’i yang serupa. Perbezaan hanya pada niat dan talbiyah '
          'pertama (bi-‘umratin vs bi-hajjatin) dan ketiadaan doa-doa khusus lokasi yang hanya '
          'wujud dalam Haji (seperti doa hari Arafah dan zikir di '
          'Masy’aril Haram), kerana Umrah tidak melalui lokasi-lokasi '
          'tersebut.',
      reflectionQuestions: <String>[
        'Apakah persamaan dan perbezaan antara talbiyah Umrah dan '
            'talbiyah Haji?',
        'Mengapakah sebahagian doa khusus Haji (seperti doa hari '
            'Arafah) tidak terdapat dalam Umrah?',
      ],
    ),
    ...idahModulesUmrah,
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
            const Positioned.fill(child: KaleidoscopeBackdrop(opacity: 0.22)),
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
                        ScrollReveal(
                          child: Row(
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
                                      'BELAJAR UMRAH',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFonts.display,
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
                        ),
                        const SizedBox(height: 26),
                        ScrollReveal(
                          delay: const Duration(milliseconds: 80),
                          child: _LearningIntroCard(
                            moduleCount: modules.length,
                          ),
                        ),
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
                                    style: TextStyle(
                                      fontFamily: AppFonts.display,
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
                                  color: palette.emerald.withValues(
                                    alpha: 0.22,
                                  ),
                                ),
                              ),
                              child: Text(
                                '${modules.length} topik',
                                style: TextStyle(
                                  color: palette.emerald,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        LayoutBuilder(
                          builder:
                              (
                                BuildContext context,
                                BoxConstraints constraints,
                              ) {
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
                                  children: modules.asMap().entries.map((
                                    MapEntry<int, LearningModuleData> entry,
                                  ) {
                                    final int index = entry.key;
                                    final LearningModuleData module =
                                        entry.value;
                                    return SizedBox(
                                      width: width,
                                      child: ScrollReveal(
                                        delay: Duration(
                                          milliseconds: 50 * (index % 6),
                                        ),
                                        child: _LearningModuleCard(
                                          module: module,
                                          onTap: () {
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
                            style: TextStyle(
                              fontFamily: AppFonts.display,
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  module.title,
                                  style: TextStyle(
                                    fontFamily: AppFonts.display,
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
                            child: _DeepDiveCard(deepDive: section.deepDive!),
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
                              style: TextStyle(
                                fontFamily: AppFonts.display,
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
                'Belajar Sebelum & Semasa Ibadah',
                style: TextStyle(
                  fontFamily: AppFonts.display,
                  color: colors.onSurface,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'Modul tersusun mengikut bab kitab al-Idah karangan '
                'Imam an-Nawawi — untuk difahami sebelum berangkat '
                'dan dirujuk semasa perjalanan.',
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
                style: TextStyle(
                  fontFamily: AppFonts.display,
                  color: module.accent.withValues(alpha: 0.80),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            module.title,
            style: TextStyle(
              fontFamily: AppFonts.display,
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
              Icon(Icons.menu_book_rounded, color: palette.mutedText, size: 15),
              const SizedBox(width: 5),
              Text(
                '${module.sections.length} bahagian',
                style: TextStyle(
                  color: palette.mutedText,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Text(
                module.number == kNomborModulPenilaian
                    ? 'Mula penilaian'
                    : 'Buka modul',
                style: TextStyle(
                  color: module.accent,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 7),
              Icon(Icons.arrow_forward_rounded, color: module.accent, size: 18),
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
                  style: TextStyle(
                    fontFamily: AppFonts.display,
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
                        fontSize: 12,
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
                          ? HajjArabic.recitation(colors.onSurface)
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
            fontSize: 12,
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
              style: HajjArabic.citation(colors.onSurface),
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
                    fontSize: 12,
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
          Icon(icon, size: 13, color: accent),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: accent,
              fontSize: 12,
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
        child: Semantics(
          button: true,
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
                                      if (data.teksKitabArabic !=
                                          null) ...<Widget>[
                                        Text(
                                          data.teksKitabArabic!,
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: HajjArabic.citation(
                                            colors.onSurface,
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
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                          ),
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
              'Kandungan ini ialah prototaip yang disusun '
              'berpandukan kitab al-Idah fi Manasik al-Hajj wa al-Umrah '
              '(الإيضاح في مناسك الحج والعمرة) karangan Imam an-Nawawi '
              '(الإمام النووي, w. 676H). Semak kandungan akhir bersama '
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
/// interaktif lagi (contoh: Penilaian Akhir dan modul bab al-Idah).
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
    // Koleksi panjang (modul Doa & Zikir) dinomborkan supaya jemaah mudah
    // menjejak kedudukan doa dalam turutan perjalanan.
    final bool isCollection = duas.length > 3;

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
                  style: TextStyle(
                    fontFamily: AppFonts.display,
                    color: colors.onSurface,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          if (isCollection) ...<Widget>[
            const SizedBox(height: 6),
            Text(
              '${duas.length} doa \u00b7 disusun mengikut turutan perjalanan',
              style: TextStyle(color: palette.mutedText, fontSize: 12.5),
            ),
          ],
          for (int i = 0; i < duas.length; i++)
            ScrollReveal(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: i == 0 ? 18 : 24),
                  Text(
                    isCollection
                        ? '${(i + 1).toString().padLeft(2, '0')} \u00b7 '
                              '${duas[i].title.toUpperCase()}'
                        : duas[i].title.toUpperCase(),
                    style: TextStyle(
                      color: accent,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 22,
                    ),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.07),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: accent.withValues(alpha: 0.18)),
                    ),
                    child: Text(
                      duas[i].arabic,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: HajjArabic.recitation(colors.onSurface),
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
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                  style: TextStyle(
                    fontFamily: AppFonts.display,
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
            textAlign: TextAlign.start,
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
                  style: TextStyle(
                    fontFamily: AppFonts.display,
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
                          fontSize: 12,
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
