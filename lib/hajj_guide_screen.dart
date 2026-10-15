import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'app_theme.dart';
import 'shared_widgets.dart';
import 'islamic_icons.dart';
import 'prismatic_widgets.dart';

// ---------------------------------------------------------------------------
// Doa & zikir yang dikongsi antara panduan Haji dan Umrah.
//
// Teks Arab disalin daripada al-Idah fi Manasik al-Hajj wa al-'Umrah
// (Imam an-Nawawi, Shamela no. 96232) atau daripada indeks hadis. "Matan
// al-Idah" bermaksud teks an-Nawawi sendiri; "nota kaki al-Ifsah" bermaksud
// syarah 'Abd al-Fattah Rawah (kadangkala menukil hasyiah Ibn Hajar) dan
// BUKAN kata-kata an-Nawawi. Medan `source` menyatakan status sebenar setiap
// doa: hadis, athar, atau doa anjuran ulama.
// ---------------------------------------------------------------------------

const GuideDua _duaKeluarRumah = GuideDua(
  title: 'Doa Keluar Rumah',
  arabic:
      'بِسْمِ اللَّهِ، تَوَكَّلْتُ عَلَى اللَّهِ، لَا حَوْلَ وَلَا قُوَّةَ '
      'إِلَّا بِاللَّهِ',
  translation:
      'Dengan nama Allah, aku bertawakal kepada Allah; tiada daya dan tiada '
      'kekuatan melainkan dengan (pertolongan) Allah.',
  source:
      'Riwayat Abu Dawud (no. 5095) dan at-Tirmidhi (no. 3426) daripada '
      'Anas r.a.; dinukil dalam al-Idah, Bab 1 (adab safar)',
);

const GuideDua _duaBerlindungKeluarRumah = GuideDua(
  title: 'Doa Berlindung Ketika Keluar Rumah',
  arabic:
      'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ أَنْ أَضِلَّ أَوْ أُضَلَّ، أَوْ '
      'أَزِلَّ أَوْ أُزَلَّ، أَوْ أَظْلِمَ أَوْ أُظْلَمَ، أَوْ أَجْهَلَ أَوْ '
      'يُجْهَلَ عَلَيَّ',
  translation:
      'Ya Allah, sesungguhnya aku berlindung kepada-Mu daripada sesat atau '
      'disesatkan, tergelincir atau digelincirkan, menzalimi atau dizalimi, '
      'berlaku jahil atau diperlakukan secara jahil.',
  source:
      'Riwayat Abu Dawud (no. 5094), at-Tirmidhi (no. 3427), an-Nasa’i '
      'dan Ibn Majah; al-Idah, Bab 1 menyebutnya sebagai doa sahih yang '
      'dibaca Nabi SAW ketika keluar rumah',
);

const GuideDua _duaNaikKenderaan = GuideDua(
  title: 'Doa Menaiki Kenderaan',
  arabic:
      'بِسْمِ اللَّهِ، الْحَمْدُ لِلَّهِ، سُبْحَانَ الَّذِي سَخَّرَ لَنَا '
      'هَـٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ، وَإِنَّا إِلَىٰ رَبِّنَا '
      'لَمُنْقَلِبُونَ',
  translation:
      'Dengan nama Allah. Segala puji bagi Allah. Maha Suci (Allah) yang '
      'telah menundukkan (kenderaan) ini untuk kami, sedangkan kami tidak '
      'mampu menguasainya; dan sesungguhnya kepada Tuhan kamilah kami akan '
      'kembali.',
  source:
      'Al-Idah, Bab 1 (masalah ke-17): "Bismillah" ketika hendak naik, '
      'selebihnya setelah duduk; kemudian "Alhamdulillah" dan "Allahu akbar" '
      '3 kali serta istighfar (diringkaskan). Bacaan ayat az-Zukhruf 43:13–14 '
      'ini ketika bermusafir: Riwayat Muslim (no. 1342)',
);

const GuideDua _duaMusafir = GuideDua(
  title: 'Doa Musafir',
  arabic:
      'اللَّهُمَّ إِنَّا نَسْأَلُكَ فِي سَفَرِنَا هَـٰذَا الْبِرَّ '
      'وَالتَّقْوَىٰ، وَمِنَ الْعَمَلِ مَا تَرْضَىٰ',
  translation:
      'Ya Allah, sesungguhnya kami memohon kepada-Mu dalam '
      'perjalanan kami ini kebaikan dan ketakwaan, serta amalan '
      'yang Engkau redai.',
  source:
      'Riwayat Muslim; turut dianjurkan dalam al-Idah, Bab 1 '
      '(adab safar)',
);

const GuideDua _duaSinggah = GuideDua(
  title: 'Doa Ketika Singgah di Sesuatu Tempat',
  arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
  translation:
      'Aku berlindung dengan kalimah-kalimah Allah yang sempurna daripada '
      'kejahatan makhluk yang diciptakan-Nya.',
  source:
      'Riwayat Muslim (no. 2708) daripada Khaulah binti Hakim r.a.: tiada '
      'sesuatu pun memudaratkannya sehingga dia berangkat; dinukil dalam '
      'al-Idah, Bab 1',
);

const GuideDua _duaTalbiyah = GuideDua(
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
);

const GuideDua _duaSelawatTalbiyah = GuideDua(
  title: 'Selawat Selepas Talbiyah',
  arabic: 'اللَّهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ وَسَلِّمْ',
  translation:
      'Ya Allah, limpahkanlah selawat ke atas Muhammad dan ke atas keluarga '
      'Muhammad, serta kurniakanlah kesejahteraan.',
  source:
      'Al-Idah, Fasal Talbiyah: sunat berselawat selepas talbiyah dengan '
      'suara lebih perlahan, kemudian memohon reda Allah dan syurga serta '
      'berlindung daripada neraka. Al-Idah tidak menetapkan lafaz khusus; '
      'lafaz ringkas ini daripada doa masuk masjid dalam al-Idah, Bab 3',
);

const GuideDua _duaLabbaikaAisy = GuideDua(
  title: 'Ketika Melihat Sesuatu yang Menakjubkan',
  arabic: 'لَبَّيْكَ إِنَّ الْعَيْشَ عَيْشُ الْآخِرَةِ',
  translation:
      'Aku sahut panggilan-Mu; sesungguhnya kehidupan (yang sebenar) ialah '
      'kehidupan akhirat.',
  source:
      'Al-Idah, Fasal Talbiyah — disebut sebagai sunnah bagi orang '
      'berihram apabila melihat sesuatu yang menakjubkannya',
);

const GuideDua _duaNiatUmrah = GuideDua(
  title: 'Lafaz Niat Umrah',
  arabic: 'لَبَّيْكَ اللَّهُمَّ بِعُمْرَةٍ',
  translation: 'Aku sahut seruan-Mu ya Allah, untuk menunaikan Umrah.',
  source:
      'Al-Idah, Bab 2 — dinukil daripada Abu Muhammad al-Juwaini: '
      'disunatkan menyebut nusuk dalam talbiyah pertama ketika '
      'berniat',
);

const GuideDua _duaTanahHaram = GuideDua(
  title: 'Doa Ketika Sampai di Tanah Haram',
  arabic:
      'اللَّهُمَّ هَـٰذَا حَرَمُكَ وَأَمْنُكَ، فَحَرِّمْنِي عَلَى النَّارِ، '
      'وَآمِنِّي مِنْ عَذَابِكَ يَوْمَ تَبْعَثُ عِبَادَكَ، وَاجْعَلْنِي مِنْ '
      'أَوْلِيَائِكَ وَأَهْلِ طَاعَتِكَ',
  translation:
      'Ya Allah, inilah Tanah Haram-Mu dan tempat aman-Mu, maka haramkanlah '
      'diriku daripada api neraka, amankanlah aku daripada azab-Mu pada hari '
      'Engkau membangkitkan hamba-hamba-Mu, dan jadikanlah aku dalam '
      'kalangan wali-wali-Mu dan orang yang taat kepada-Mu.',
  source:
      'Al-Idah, Bab 3 (Fasal 1, masalah ke-2) — dianjurkan oleh sebahagian '
      'ulama mazhab Syafi’i; doa anjuran ulama, al-Idah tidak '
      'menyandarkannya kepada hadis',
);

const GuideDua _duaMelihatKaabah = GuideDua(
  title: 'Doa Ketika Melihat Kaabah',
  arabic:
      'اللَّهُمَّ زِدْ هَـٰذَا الْبَيْتَ تَشْرِيفًا وَتَعْظِيمًا وَتَكْرِيمًا '
      'وَمَهَابَةً، وَزِدْ مَنْ شَرَّفَهُ وَعَظَّمَهُ مِمَّنْ حَجَّهُ '
      'وَاعْتَمَرَهُ تَشْرِيفًا وَتَكْرِيمًا وَتَعْظِيمًا وَبِرًّا، اللَّهُمَّ '
      'أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، فَحَيِّنَا رَبَّنَا بِالسَّلَامِ',
  translation:
      'Ya Allah, tambahkanlah kemuliaan, keagungan, penghormatan dan '
      'kehebatan Baitullah ini; dan tambahkanlah kepada sesiapa yang '
      'memuliakan dan mengagungkannya dalam kalangan orang yang berhaji dan '
      'berumrah kemuliaan, penghormatan, keagungan dan kebajikan. Ya Allah, '
      'Engkaulah as-Salam dan daripada-Mu datangnya kesejahteraan, maka '
      'hidupkanlah kami, wahai Tuhan kami, dengan kesejahteraan.',
  source:
      'Al-Idah, Bab 3 (Fasal 1, masalah ke-9) — dibaca sambil mengangkat '
      'tangan sebaik terpandang Kaabah, lalu berdoa (terutamanya memohon '
      'keampunan); al-Idah tidak menyandarkan lafaz ini kepada hadis',
);

const GuideDua _duaMulaTawaf = GuideDua(
  title: 'Memulakan Tawaf (Istilam Hajar Aswad)',
  arabic:
      'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ، اللَّهُمَّ إِيمَانًا بِكَ، '
      'وَتَصْدِيقًا بِكِتَابِكَ، وَوَفَاءً بِعَهْدِكَ، وَاتِّبَاعًا لِسُنَّةِ '
      'نَبِيِّكَ مُحَمَّدٍ ﷺ',
  translation:
      'Dengan nama Allah, dan Allah Maha Besar. Ya Allah, (aku bertawaf) '
      'kerana beriman kepada-Mu, membenarkan Kitab-Mu, menunaikan janji-Mu '
      'dan mengikut sunnah Nabi-Mu Muhammad SAW.',
  source:
      'Al-Idah, Bab 3 (Fasal 2: zikir-zikir Tawaf) — dibaca ketika istilam '
      'Hajar Aswad pada permulaan Tawaf dan setiap kali sejajar dengannya; '
      'doa anjuran ulama, al-Idah tidak menyandarkannya kepada hadis',
);

const GuideDua _duaRamal = GuideDua(
  title: 'Doa Semasa Ramal (Tiga Pusingan Pertama)',
  arabic:
      'اللَّهُمَّ اجْعَلْهُ حَجًّا مَبْرُورًا، وَذَنْبًا مَغْفُورًا، '
      'وَسَعْيًا مَشْكُورًا',
  translation:
      'Ya Allah, jadikanlah ia haji yang mabrur, dosa yang diampunkan dan '
      'usaha yang diterima.',
  source:
      'Al-Idah, Bab 3 (Fasal 2) — nukilan an-Nawawi daripada Imam '
      'asy-Syafi’i; doa anjuran ulama. Nota kaki al-Ifsah: turut dibaca '
      'dalam Umrah kerana Umrah juga dinamakan haji',
);

const GuideDua _duaEmpatPusinganAkhir = GuideDua(
  title: 'Doa Empat Pusingan Terakhir',
  arabic:
      'اللَّهُمَّ اغْفِرْ وَارْحَمْ، وَاعْفُ عَمَّا تَعْلَمُ، وَأَنْتَ '
      'الْأَعَزُّ الْأَكْرَمُ',
  translation:
      'Ya Allah, ampunkanlah dan rahmatilah, serta maafkanlah apa yang '
      'Engkau ketahui; Engkaulah Yang Maha Perkasa lagi Maha Pemurah.',
  source:
      'Al-Idah, Bab 3 (Fasal 2) — nukilan an-Nawawi daripada Imam '
      'asy-Syafi’i bagi empat pusingan terakhir; doa anjuran ulama',
);

const GuideDua _duaRabbanaTawaf = GuideDua(
  title: 'Doa Antara Rukun Yamani dan Hajar Aswad',
  arabic:
      'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ '
      'حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
  translation:
      'Ya Tuhan kami, berikanlah kami kebaikan di dunia dan '
      'kebaikan di akhirat, serta peliharalah kami daripada azab '
      'neraka.',
  source: 'Al-Baqarah 2:201; diamalkan Rasulullah SAW ketika Tawaf (Abu Dawud)',
);

const GuideDua _duaZamzam = GuideDua(
  title: 'Doa Ketika Minum Air Zamzam',
  arabic:
      'اللَّهُمَّ إِنَّهُ بَلَغَنِي أَنَّ رَسُولَكَ ﷺ قَالَ: «مَاءُ زَمْزَمَ '
      'لِمَا شُرِبَ لَهُ»، اللَّهُمَّ وَإِنِّي أَشْرَبُهُ لِتَغْفِرَ لِي، '
      'اللَّهُمَّ فَاغْفِرْ لِي',
  translation:
      'Ya Allah, telah sampai kepadaku bahawa Rasul-Mu SAW bersabda: '
      '"Air Zamzam itu menurut niat ia diminum." Ya Allah, aku meminumnya '
      'agar Engkau mengampuniku, maka ampunkanlah aku.',
  source:
      'Al-Idah, Bab 5 (masalah ke-11) — diminum menghadap kiblat dengan '
      'menyebut nama Allah; niat boleh diganti, contohnya memohon '
      'kesembuhan. Hadis "Ma’ Zamzam lima syuriba lah": Riwayat Ibn Majah '
      '(no. 3062) dan Ahmad daripada Jabir r.a.',
);

const GuideDua _duaAyatSafa = GuideDua(
  title: 'Doa Memulakan Sa’i di Safa',
  arabic: 'إِنَّ الصَّفَا وَالْمَرْوَةَ مِنْ شَعَائِرِ اللَّهِ',
  translation:
      'Sesungguhnya Safa dan Marwah sebahagian daripada '
      'syiar-syiar Allah.',
  source: 'Al-Baqarah 2:158',
);

const GuideDua _duaZikirSafa = GuideDua(
  title: 'Zikir di Atas Safa dan Marwah',
  arabic:
      'اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، اللَّهُ أَكْبَرُ، وَلِلَّهِ '
      'الْحَمْدُ، اللَّهُ أَكْبَرُ عَلَىٰ مَا هَدَانَا، وَالْحَمْدُ لِلَّهِ '
      'عَلَىٰ مَا أَوْلَانَا، لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ '
      'لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيتُ، بِيَدِهِ '
      'الْخَيْرُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ، لَا إِلَٰهَ إِلَّا اللَّهُ '
      'وَحْدَهُ لَا شَرِيكَ لَهُ، أَنْجَزَ وَعْدَهُ، وَنَصَرَ عَبْدَهُ، '
      'وَهَزَمَ الْأَحْزَابَ وَحْدَهُ، لَا إِلَٰهَ إِلَّا اللَّهُ، وَلَا '
      'نَعْبُدُ إِلَّا إِيَّاهُ، مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرِهَ '
      'الْكَافِرُونَ',
  translation:
      'Allah Maha Besar, Allah Maha Besar, Allah Maha Besar, dan bagi Allah '
      'segala puji. Allah Maha Besar atas petunjuk-Nya kepada kami, dan '
      'segala puji bagi Allah atas nikmat yang dianugerahkan-Nya kepada kami. '
      'Tiada Tuhan melainkan Allah Yang Maha Esa, tiada sekutu bagi-Nya; '
      'bagi-Nya kerajaan dan bagi-Nya segala pujian, Dia menghidupkan dan '
      'mematikan, di tangan-Nya segala kebaikan, dan Dia Maha Berkuasa atas '
      'segala sesuatu. Tiada Tuhan melainkan Allah Yang Maha Esa, tiada '
      'sekutu bagi-Nya; Dia telah menunaikan janji-Nya, menolong hamba-Nya '
      'dan mengalahkan tentera al-Ahzab dengan sendiri-Nya. Tiada Tuhan '
      'melainkan Allah, dan kami tidak menyembah melainkan-Nya dengan '
      'mengikhlaskan agama bagi-Nya, walaupun orang kafir membencinya.',
  source:
      'Al-Idah, Bab 3 (Fasal 3: Sa’i) — dibaca menghadap Kaabah di atas '
      'Safa, diulang tiga kali diselangi doa, dan dilakukan sama di Marwah. '
      'Teras tahlil "anjaza wa’dah…" daripada hadis Jabir r.a. '
      '(Riwayat Muslim, no. 1218); lafaz lengkap ini susunan ulama',
);

const GuideDua _duaSafaIbnUmar = GuideDua(
  title: 'Doa di Safa (Athar Ibn ‘Umar)',
  arabic:
      'اللَّهُمَّ إِنَّكَ قُلْتَ وَقَوْلُكَ الْحَقُّ: ادْعُونِي أَسْتَجِبْ '
      'لَكُمْ، وَإِنَّكَ لَا تُخْلِفُ الْمِيعَادَ، وَإِنِّي أَسْأَلُكَ كَمَا '
      'هَدَيْتَنِي لِلْإِسْلَامِ أَنْ لَا تَنْزِعَهُ مِنِّي، وَأَنْ '
      'تَتَوَفَّانِي مُسْلِمًا',
  translation:
      'Ya Allah, sesungguhnya Engkau telah berfirman, dan firman-Mu adalah '
      'benar: "Berdoalah kepada-Ku, nescaya Aku perkenankan bagi kamu," dan '
      'Engkau tidak memungkiri janji. Aku memohon kepada-Mu, sebagaimana '
      'Engkau telah memberiku petunjuk kepada Islam, agar Engkau tidak '
      'mencabutnya daripadaku dan agar Engkau mewafatkan aku sebagai Muslim.',
  source:
      'Al-Idah, Bab 3 (Fasal 3) — dinilai baik dibaca selepas zikir di Safa; '
      'nota kaki al-Ifsah menyandarkannya kepada riwayat Malik dalam '
      'al-Muwatta’ daripada Ibn ‘Umar r.a. (athar)',
);

const GuideDua _duaSai = GuideDua(
  title: 'Doa Sepanjang Sa’i',
  arabic:
      'رَبِّ اغْفِرْ وَارْحَمْ، وَتَجَاوَزْ عَمَّا تَعْلَمُ، إِنَّكَ أَنْتَ '
      'الْأَعَزُّ الْأَكْرَمُ، اللَّهُمَّ آتِنَا فِي الدُّنْيَا حَسَنَةً '
      'وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
  translation:
      'Wahai Tuhanku, ampunkanlah dan rahmatilah, serta maafkanlah apa yang '
      'Engkau ketahui; sesungguhnya Engkaulah Yang Maha Perkasa lagi Maha '
      'Pemurah. Ya Allah, kurniakanlah kami kebaikan di dunia dan kebaikan di '
      'akhirat, serta peliharalah kami daripada azab neraka.',
  source:
      'Al-Idah, Bab 3 (Fasal 3, sunat-sunat Sa’i) — dibaca sepanjang '
      'perjalanan antara Safa dan Marwah; nota kaki al-Ifsah menyandarkan '
      '"Rabbighfir warham…" kepada athar Ibn ‘Umar r.a. '
      '(Ibn Abi Syaibah)',
);

const GuideDua _duaBercukur = GuideDua(
  title: 'Doa Ketika Bercukur',
  arabic:
      'اللَّهُمَّ هَـٰذِهِ نَاصِيَتِي فَتَقَبَّلْ مِنِّي وَاغْفِرْ ذُنُوبِي',
  translation:
      'Ya Allah, inilah ubun-ubunku, maka terimalah (amalan) daripadaku dan '
      'ampunkanlah dosa-dosaku.',
  source:
      'Nota kaki al-Ifsah pada al-Idah, Fasal Bercukur (diringkaskan) — doa '
      'susunan ulama. Matan al-Idah hanya menyebut adab bercukur (menghadap '
      'kiblat, mula dari sebelah kanan) tanpa lafaz doa',
);

const GuideDua _duaKeArafah = GuideDua(
  title: 'Doa dalam Perjalanan ke Arafah',
  arabic:
      'اللَّهُمَّ إِلَيْكَ تَوَجَّهْتُ، وَلِوَجْهِكَ الْكَرِيمِ أَرَدْتُ، '
      'فَاجْعَلْ ذَنْبِي مَغْفُورًا، وَحَجِّي مَبْرُورًا، ارْحَمْنِي وَلَا '
      'تُخَيِّبْنِي، إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Ya Allah, kepada-Mu aku menghadap dan Wajah-Mu Yang Mulia yang aku '
      'tuju. Maka jadikanlah dosaku diampunkan dan hajiku mabrur; rahmatilah '
      'aku dan janganlah Engkau hampakan aku. Sesungguhnya Engkau Maha '
      'Berkuasa atas segala sesuatu.',
  source:
      'Al-Idah, Bab 3 (Fasal 4) — dianggap baik oleh sebahagian ulama untuk '
      'dibaca ketika bergerak dari Mina ke Arafah pada pagi 9 Zulhijjah, '
      'sambil memperbanyak talbiyah; doa anjuran ulama',
);

const GuideDua _duaArafahAli = GuideDua(
  title: 'Doa yang Paling Banyak Dibaca Nabi SAW di Arafah',
  arabic:
      'اللَّهُمَّ لَكَ الْحَمْدُ كَالَّذِي نَقُولُ وَخَيْرًا مِمَّا نَقُولُ، '
      'اللَّهُمَّ لَكَ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي، وَإِلَيْكَ '
      'مَآبِي، وَلَكَ رَبِّي تُرَاثِي، اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ '
      'عَذَابِ الْقَبْرِ، وَوَسْوَسَةِ الصَّدْرِ، وَشَتَاتِ الْأَمْرِ، '
      'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ مَا تَجِيءُ بِهِ الرِّيحُ',
  translation:
      'Ya Allah, bagi-Mu segala puji sebagaimana yang kami ucapkan, dan lebih '
      'baik daripada apa yang kami ucapkan. Ya Allah, bagi-Mu solatku, '
      'ibadahku, hidupku dan matiku; kepada-Mu tempat kembaliku, dan bagi-Mu, '
      'wahai Tuhanku, segala peninggalanku. Ya Allah, aku berlindung '
      'kepada-Mu daripada azab kubur, was-was dalam dada dan urusan yang '
      'bercerai-berai. Ya Allah, aku berlindung kepada-Mu daripada kejahatan '
      'yang dibawa oleh angin.',
  source:
      'Riwayat at-Tirmidhi daripada ‘Ali r.a.; dinukil an-Nawawi dalam '
      'al-Idah, Bab 3 (Fasal 4) sebagai doa yang paling banyak dibaca Nabi '
      'SAW ketika wukuf',
);

const GuideDua _duaArafahAmpun = GuideDua(
  title: 'Doa Pilihan: Memohon Keampunan',
  arabic:
      'اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي ظُلْمًا كَثِيرًا، وَإِنَّهُ لَا '
      'يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ، فَاغْفِرْ لِي مَغْفِرَةً مِنْ '
      'عِنْدِكَ، وَارْحَمْنِي، إِنَّكَ أَنْتَ الْغَفُورُ الرَّحِيمُ',
  translation:
      'Ya Allah, sesungguhnya aku telah menzalimi diriku dengan kezaliman '
      'yang banyak, dan tiada yang mengampunkan dosa melainkan Engkau. Maka '
      'ampunkanlah aku dengan keampunan dari sisi-Mu dan rahmatilah aku; '
      'sesungguhnya Engkaulah Yang Maha Pengampun lagi Maha Penyayang.',
  source:
      'Riwayat al-Bukhari (no. 834) dan Muslim (no. 2705) — doa yang '
      'diajarkan Nabi SAW untuk dibaca dalam solat; an-Nawawi '
      'menyenaraikannya antara doa pilihan di Arafah (al-Idah, Bab 3, '
      'Fasal 4)',
);

const GuideDua _duaArafahTaat = GuideDua(
  title: 'Doa Pilihan: Kemuliaan Taat',
  arabic:
      'اللَّهُمَّ انْقُلْنِي مِنْ ذُلِّ الْمَعْصِيَةِ إِلَىٰ عِزِّ '
      'الطَّاعَةِ، وَأَغْنِنِي بِحَلَالِكَ عَنْ حَرَامِكَ، وَبِطَاعَتِكَ عَنْ '
      'مَعْصِيَتِكَ، وَبِفَضْلِكَ عَمَّنْ سِوَاكَ، وَنَوِّرْ قَلْبِي '
      'وَقَبْرِي، وَأَعِذْنِي مِنَ الشَّرِّ كُلِّهِ، وَاجْمَعْ لِي الْخَيْرَ '
      'كُلَّهُ',
  translation:
      'Ya Allah, pindahkanlah aku daripada kehinaan maksiat kepada kemuliaan '
      'taat; cukupkanlah aku dengan yang halal daripada yang haram, dengan '
      'ketaatan kepada-Mu daripada maksiat terhadap-Mu, dan dengan '
      'kurniaan-Mu daripada bergantung kepada selain-Mu. Terangilah hati dan '
      'kuburku, lindungilah aku daripada segala kejahatan, dan himpunkanlah '
      'untukku segala kebaikan.',
  source:
      'Al-Idah, Bab 3 (Fasal 4) — sebahagian daripada doa pilihan yang '
      'disusun an-Nawawi untuk Arafah (diringkaskan); doa anjuran ulama',
);

const GuideDua _duaMasyarilHaram = GuideDua(
  title: 'Doa di Masy’aril Haram',
  arabic:
      'اللَّهُمَّ كَمَا أَوْقَفْتَنَا فِيهِ وَأَرَيْتَنَا إِيَّاهُ، '
      'فَوَفِّقْنَا لِذِكْرِكَ كَمَا هَدَيْتَنَا، وَاغْفِرْ لَنَا '
      'وَارْحَمْنَا كَمَا وَعَدْتَنَا بِقَوْلِكَ وَقَوْلُكَ الْحَقُّ',
  translation:
      'Ya Allah, sebagaimana Engkau telah menghentikan kami di sini dan '
      'memperlihatkannya kepada kami, maka berilah kami taufik untuk '
      'mengingati-Mu sebagaimana Engkau telah memberi kami petunjuk; '
      'ampunkanlah dan rahmatilah kami sebagaimana Engkau janjikan melalui '
      'firman-Mu, dan firman-Mu adalah benar.',
  source:
      'Al-Idah, Bab 3 (Fasal 6) — dianjurkan ulama untuk dibaca menghadap '
      'kiblat di Masy’aril Haram (Quzah) selepas Subuh 10 Zulhijjah, '
      'disambung dengan al-Baqarah 2:198–199 (diringkaskan di sini)',
);

const GuideDua _duaRabbanaMasyaril = GuideDua(
  title: 'Doa yang Diperbanyak di Masy’aril Haram',
  arabic:
      'اللَّهُمَّ رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ '
      'حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
  translation:
      'Ya Allah, wahai Tuhan kami, berikanlah kami kebaikan di dunia dan '
      'kebaikan di akhirat, serta peliharalah kami daripada azab neraka.',
  source:
      'Al-Baqarah 2:201; al-Idah, Bab 3 (Fasal 6) menganjurkan doa ini '
      'diperbanyak di Masy’aril Haram',
);

const GuideDua _duaSelepasJamrah = GuideDua(
  title: 'Doa Selepas Jamrah Ula dan Wusta',
  arabic:
      'اللَّهُمَّ إِلَيْكَ رَغِبْتُ، وَمِنْكَ رَهِبْتُ، وَمِنْ عَذَابِكَ '
      'أَشْفَقْتُ، فَاقْبَلْ نُسُكِي، وَأَصْلِحْهُ وَأَتْمِمْهُ، وَاجْعَلْهُ '
      'حَجًّا مَبْرُورًا وَذَنْبًا مَغْفُورًا',
  translation:
      'Ya Allah, kepada-Mu aku berharap, daripada-Mu aku takut, dan terhadap '
      'azab-Mu aku gerun; maka terimalah ibadahku, perbaikilah dan '
      'sempurnakanlah ia, serta jadikanlah ia haji yang mabrur dan dosa yang '
      'diampunkan.',
  source:
      'Matan al-Idah: selepas Jamrah Ula dan Wusta, berdiri menghadap kiblat '
      'lalu bertahmid, bertakbir, bertahlil, bertasbih dan berdoa kira-kira '
      'sepanjang bacaan Surah al-Baqarah, tanpa lafaz khusus (tiada berhenti '
      'berdoa selepas Jamrah Aqabah). Lafaz ini daripada nota kaki al-Ifsah '
      '(diringkaskan) — doa susunan ulama',
);

const GuideDua _duaWada = GuideDua(
  title: 'Doa di Multazam Selepas Tawaf Wada’',
  arabic:
      'اللَّهُمَّ الْبَيْتُ بَيْتُكَ، وَالْعَبْدُ عَبْدُكَ وَابْنُ أَمَتِكَ، '
      'حَمَلْتَنِي عَلَىٰ مَا سَخَّرْتَ لِي مِنْ خَلْقِكَ حَتَّىٰ صَيَّرْتَنِي '
      'فِي بِلَادِكَ، وَبَلَّغْتَنِي بِنِعْمَتِكَ حَتَّىٰ أَعَنْتَنِي عَلَىٰ '
      'قَضَاءِ مَنَاسِكِكَ، فَإِنْ كُنْتَ رَضِيتَ عَنِّي فَازْدَدْ عَنِّي '
      'رِضًا، وَإِلَّا فَمُنَّ الْآنَ قَبْلَ أَنْ تَنْأَىٰ عَنْ بَيْتِكَ '
      'دَارِي وَيَبْعُدَ عَنْهُ مَزَارِي، هَـٰذَا أَوَانُ انْصِرَافِي إِنْ '
      'أَذِنْتَ لِي، غَيْرَ مُسْتَبْدِلٍ بِكَ وَلَا بَيْتِكَ، وَلَا رَاغِبٍ '
      'عَنْكَ وَلَا عَنْ بَيْتِكَ، اللَّهُمَّ فَأَصْحِبْنِي الْعَافِيَةَ فِي '
      'بَدَنِي، وَالْعِصْمَةَ فِي دِينِي، وَأَحْسِنْ مُنْقَلَبِي، وَارْزُقْنِي '
      'طَاعَتَكَ مَا أَبْقَيْتَنِي، وَاجْمَعْ لِي خَيْرَيِ الدُّنْيَا '
      'وَالْآخِرَةِ، إِنَّكَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
  translation:
      'Ya Allah, rumah ini rumah-Mu, dan hamba ini hamba-Mu, anak kepada '
      'hamba perempuan-Mu. Engkau membawaku dengan apa yang Engkau tundukkan '
      'untukku daripada makhluk-Mu sehingga Engkau sampaikan aku ke negeri-Mu, '
      'dan dengan nikmat-Mu Engkau sampaikan aku sehingga Engkau membantuku '
      'menunaikan manasik-Mu. Jika Engkau telah reda kepadaku, tambahkanlah '
      'keredaan-Mu; jika belum, kurniakanlah sekarang sebelum rumahku jauh '
      'daripada Baitullah-Mu dan kunjunganku semakin jauh daripadanya. Inilah '
      'masa aku berangkat pulang, jika Engkau izinkan, tanpa menggantikan '
      'Engkau dan Baitullah-Mu, dan tanpa berpaling daripada-Mu dan '
      'Baitullah-Mu. Ya Allah, iringilah aku dengan kesejahteraan tubuh dan '
      'pemeliharaan agama, perelokkanlah kepulanganku, kurniakanlah aku '
      'ketaatan kepada-Mu selama Engkau menghidupkan aku, dan himpunkanlah '
      'untukku kebaikan dunia dan akhirat. Sesungguhnya Engkau Maha Berkuasa '
      'atas segala sesuatu.',
  source:
      'Al-Idah, Bab 5 (masalah ke-18) — dibaca sambil melekapkan diri di '
      'Multazam selepas solat sunat Tawaf Wada’, kemudian minum Zamzam '
      'dan istilam Hajar Aswad. Doa anjuran ulama: hasyiah Ibn Hajar (dinukil '
      'dalam nota kaki) menyatakan ia tidak warid secara marfu’',
);

const GuideDua _duaSalamLengkap = GuideDua(
  title: 'Salam yang Lebih Lengkap (Diringkaskan)',
  arabic:
      'السَّلَامُ عَلَيْكَ يَا خِيرَةَ اللَّهِ، السَّلَامُ عَلَيْكَ يَا '
      'حَبِيبَ اللَّهِ، السَّلَامُ عَلَيْكَ يَا نَبِيَّ الرَّحْمَةِ، '
      'السَّلَامُ عَلَيْكَ وَعَلَىٰ آلِكَ وَأَهْلِ بَيْتِكَ وَأَزْوَاجِكَ '
      'وَذُرِّيَّتِكَ وَأَصْحَابِكَ أَجْمَعِينَ، جَزَاكَ اللَّهُ يَا رَسُولَ '
      'اللَّهِ عَنَّا أَفْضَلَ مَا جَزَىٰ نَبِيًّا وَرَسُولًا عَنْ أُمَّتِهِ، '
      'أَشْهَدُ أَنَّكَ قَدْ بَلَّغْتَ الرِّسَالَةَ، وَأَدَّيْتَ الْأَمَانَةَ، '
      'وَنَصَحْتَ الْأُمَّةَ، وَجَاهَدْتَ فِي اللَّهِ حَقَّ جِهَادِهِ',
  translation:
      'Salam sejahtera ke atasmu wahai pilihan Allah; salam sejahtera ke '
      'atasmu wahai kekasih Allah; salam sejahtera ke atasmu wahai Nabi '
      'pembawa rahmat; salam sejahtera ke atasmu, keluargamu, ahli baitmu, '
      'isteri-isterimu, zuriatmu dan seluruh sahabatmu. Semoga Allah '
      'membalasmu, wahai Rasulullah, bagi pihak kami dengan sebaik-baik '
      'balasan yang dikurniakan kepada seorang nabi dan rasul bagi pihak '
      'umatnya. Aku bersaksi bahawa engkau telah menyampaikan risalah, '
      'menunaikan amanah, menasihati umat dan berjihad pada jalan Allah '
      'dengan sebenar-benar jihad.',
  source:
      'Al-Idah, Bab 6 (masalah ke-7) — petikan daripada lafaz salam yang '
      'panjang (diringkaskan), diucapkan dengan suara sederhana menghadap '
      'makam; lafaz susunan ulama',
);

const GuideDua _duaSalamAbuBakar = GuideDua(
  title: 'Salam kepada Abu Bakar r.a.',
  arabic:
      'السَّلَامُ عَلَيْكَ يَا أَبَا بَكْرٍ، صَفِيَّ رَسُولِ اللَّهِ '
      'وَثَانِيَهُ فِي الْغَارِ، جَزَاكَ اللَّهُ عَنْ أُمَّةِ نَبِيِّهِ ﷺ '
      'خَيْرًا',
  translation:
      'Salam sejahtera ke atasmu wahai Abu Bakar, sahabat pilihan Rasulullah '
      'dan teman baginda di dalam gua. Semoga Allah membalasmu dengan '
      'kebaikan bagi pihak umat Nabi-Nya SAW.',
  source:
      'Al-Idah, Bab 6 — diucapkan selepas berundur kira-kira sehasta ke '
      'kanan; lafaz susunan ulama',
);

const GuideDua _duaSalamUmar = GuideDua(
  title: 'Salam kepada ‘Umar r.a.',
  arabic:
      'السَّلَامُ عَلَيْكَ يَا عُمَرُ، أَعَزَّ اللَّهُ بِكَ الْإِسْلَامَ، '
      'جَزَاكَ اللَّهُ عَنْ أُمَّةِ مُحَمَّدٍ ﷺ خَيْرًا',
  translation:
      'Salam sejahtera ke atasmu wahai Umar, yang dengannya Allah memuliakan '
      'Islam. Semoga Allah membalasmu dengan kebaikan bagi pihak umat '
      'Muhammad SAW.',
  source:
      'Al-Idah, Bab 6 — diucapkan selepas berundur sehasta lagi ke kanan; '
      'lafaz susunan ulama',
);

const GuideDua _duaBaqi = GuideDua(
  title: 'Salam di Perkuburan Baqi’',
  arabic:
      'السَّلَامُ عَلَيْكُمْ دَارَ قَوْمٍ مُؤْمِنِينَ، وَإِنَّا إِنْ شَاءَ '
      'اللَّهُ بِكُمْ لَاحِقُونَ، اللَّهُمَّ اغْفِرْ لِأَهْلِ بَقِيعِ '
      'الْغَرْقَدِ، اللَّهُمَّ اغْفِرْ لَنَا وَلَهُمْ',
  translation:
      'Salam sejahtera ke atas kamu, wahai penghuni negeri kaum mukminin, '
      'dan sesungguhnya kami, insya-Allah, akan menyusuli kamu. Ya Allah, '
      'ampunkanlah penghuni Baqi’ al-Gharqad. Ya Allah, ampunkanlah kami '
      'dan mereka.',
  source:
      'Al-Idah, Bab 6 (masalah ke-10) — diucapkan ketika sampai di Baqi’ '
      'selepas menziarahi makam Rasulullah SAW',
);

const GuideDua _duaTinggalMadinah = GuideDua(
  title: 'Doa Ketika Meninggalkan Madinah',
  arabic:
      'اللَّهُمَّ لَا تَجْعَلْ هَـٰذَا آخِرَ الْعَهْدِ بِحَرَمِ رَسُولِكَ، '
      'وَيَسِّرْ لِي الْعَوْدَ إِلَى الْحَرَمَيْنِ سَبِيلًا سَهْلَةً، '
      'وَارْزُقْنِي الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ، '
      'وَرُدَّنَا سَالِمِينَ غَانِمِينَ',
  translation:
      'Ya Allah, janganlah Engkau jadikan ini kunjungan terakhirku ke Tanah '
      'Haram Rasul-Mu; permudahkanlah jalan bagiku untuk kembali ke dua Tanah '
      'Haram, kurniakanlah aku keampunan dan kesejahteraan di dunia dan '
      'akhirat, dan kembalikanlah kami dalam keadaan selamat serta beroleh '
      'kebaikan.',
  source:
      'Al-Idah, Bab 6 (masalah ke-21) — dibaca ketika hendak meninggalkan '
      'Madinah, selepas solat dua rakaat dan mengulangi salam di makam; doa '
      'anjuran ulama',
);

const GuideDua _duaSembelih = GuideDua(
  title: 'Doa Ketika Menyembelih Hadyu atau Dam',
  arabic:
      'بِسْمِ اللَّهِ وَاللَّهُ أَكْبَرُ، وَصَلَّى اللَّهُ عَلَىٰ رَسُولِهِ '
      'مُحَمَّدٍ وَعَلَىٰ آلِهِ وَصَحْبِهِ وَسَلَّمَ، اللَّهُمَّ مِنْكَ '
      'وَإِلَيْكَ فَتَقَبَّلْ مِنِّي',
  translation:
      'Dengan nama Allah, dan Allah Maha Besar. Semoga Allah melimpahkan '
      'selawat dan salam ke atas Rasul-Nya Muhammad, keluarga dan sahabat '
      'baginda. Ya Allah, (sembelihan ini) daripada-Mu dan untuk-Mu, maka '
      'terimalah daripadaku.',
  source:
      'Al-Idah, Bab 3 (Fasal 7: penyembelihan pada Hari Nahar) — jika '
      'menyembelih bagi pihak orang lain, sebut "taqabbal min fulan"; doa '
      'anjuran ulama',
);

// ---------------------------------------------------------------------------

class HajjGuideScreen extends StatefulWidget {
  const HajjGuideScreen({required this.guideBox, super.key});

  final Box<dynamic> guideBox;

  /// Kunci storan Hive bagi senarai indeks langkah yang sudah ditandakan
  /// selesai. Didedahkan secara awam supaya skrin lain (contoh: dashboard)
  /// boleh memaparkan kemajuan tanpa menduplikasi data.
  static const String storageKey = 'completed_guide_steps';

  /// Jumlah keseluruhan langkah dalam panduan Haji.
  static int get totalSteps => _HajjGuideScreenState.steps.length;

  @override
  State<HajjGuideScreen> createState() => _HajjGuideScreenState();
}

class _HajjGuideScreenState extends State<HajjGuideScreen> {
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
        _duaKeluarRumah,
        _duaBerlindungKeluarRumah,
        _duaNaikKenderaan,
        _duaMusafir,
        _duaSinggah,
      ],
      academicInsight:
          'Bab Pertama al-Idah menyusun adab safar Haji secara tertib: '
          'bermusyawarah dengan orang yang dipercayai ilmu dan agamanya, '
          'diikuti solat istikharah dua rakaat (membaca Surah al-Kafirun '
          'dan al-Ikhlas) memohon pilihan waktu terbaik untuk berangkat, '
          'kemudian barulah bertaubat daripada segala dosa, '
          'menyelesaikan mazalim (hak orang lain yang teraniaya), '
          'melunaskan hutang yang cukup tempoh, menulis wasiat dan '
          'menyaksikannya, serta meninggalkan nafkah yang mencukupi bagi '
          'tanggungan sehingga pulang. Imam an-Nawawi turut menegaskan '
          'sesiapa yang berhutang tunai dan mampu membayarnya, '
          'pemiutang berhak menghalangnya keluar berhaji sehingga '
          'hutang dilangsaikan. Dari sudut fiqh, konsep istita\u2019ah '
          '(kemampuan) yang menjadi syarat wajib Haji turut merangkumi '
          'tiga dimensi: kemampuan kewangan (termasuk nafkah keluarga '
          'yang ditinggalkan), kesihatan fizikal, dan keselamatan '
          'sepanjang perjalanan — ketiadaan mana-mana satu boleh '
          'menggugurkan kewajipan tanpa dosa.',
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
          title: 'Lafaz Niat Haji',
          arabic: 'نَوَيْتُ الْحَجَّ وَأَحْرَمْتُ بِهِ لِلَّهِ تَعَالَى',
          translation:
              'Sahaja aku berniat Haji dan aku berihram dengannya kerana '
              'Allah Taala.',
          source:
              'Al-Idah, Bab 2 (Fasal Sifat Ihram) — dilafazkan sambil '
              'menghadirkan niat di hati, kemudian disusuli talbiyah',
        ),
        _duaTalbiyah,
        _duaSelawatTalbiyah,
        _duaLabbaikaAisy,
      ],
      academicInsight:
          'Ihram membawa makna simbolik yang mendalam: dua helai kain '
          'putih tanpa jahitan menghapuskan segala tanda status sosial, '
          'bangsa dan kekayaan, menegakkan prinsip kesamarataan seluruh '
          'manusia di hadapan Allah SWT. Amalan ini turut mengingatkan '
          'jemaah tentang kain kafan dan hari kebangkitan. Dalam Fasal '
          'Miqat al-Idah, Imam an-Nawawi menyenaraikan lima miqat makani '
          'yang ditetapkan Rasulullah SAW mengikut arah kedatangan '
          'jemaah: Zulhulaifah (bagi ahli Madinah), Juhfah (Syam, Mesir '
          'dan Maghribi), Qarnul Manazil (Najd), Yalamlam (Yaman/Tihamah) '
          'dan Zatu Irqin (Iraq dan timur). Bagi sesiapa yang berada di '
          'Makkah, sama ada penduduk atau pendatang, miqat Hajinya ialah '
          'Makkah itu sendiri. Miqat zamani (had masa) pula ialah Syawal, '
          'Zulkaedah dan sepuluh malam pertama Zulhijjah, berakhir dengan '
          'terbit fajar hari raya Aidiladha; ihram Haji di luar tempoh ini '
          'tidak sah sebagai Haji, tetapi terkira sebagai Umrah menurut '
          'pendapat yang lebih sahih. Sesiapa yang berniat Haji atau Umrah '
          'lalu melepasi miqat tanpa berihram, berdosa (jika sengaja) dan '
          'dikenakan dam, melainkan dia kembali ke miqat sebelum memulakan '
          'apa-apa amalan nusuk seperti Tawaf.',
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
        _duaTanahHaram,
        _duaMelihatKaabah,
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
          'Bab Ketiga al-Idah menggariskan adab masuk Makkah dengan '
          'terperinci: mandi sunat di Zi Tuwa sebelum memasuki kota '
          '(masih disunatkan walaupun ketika haid atau nifas), masuk '
          'melalui Thaniyyat Kada di bahagian atas Makkah dan keluar '
          'melalui Thaniyyat Kuda di bahagian bawah, serta afdal masuk '
          'dengan berjalan kaki pada waktu siang berbanding menunggang '
          'atau waktu malam. Masjidil Haram telah mengalami pelbagai '
          'pengembangan sepanjang sejarah Islam bagi menampung jemaah '
          'yang semakin ramai, namun kedudukan Kaabah kekal sebagai '
          'kiblat dan pusat tumpuan sejak zaman Nabi Ibrahim AS. Ketika '
          'pertama kali melihat Kaabah, al-Idah menyebut bahawa mustahab '
          'mengangkat tangan dan berdoa dengan penuh khusyuk (Imam Malik '
          'tidak menganjurkan mengangkat tangan, dan riwayat daripada '
          'Jabir r.a. berbeza-beza). Bagi orang yang datang dari luar Tanah '
          'Haram bukan untuk Haji atau Umrah, Imam an-Nawawi menukilkan '
          'tiga pendapat: yang paling sahih (al-asah) ialah sunat masuk '
          'dalam keadaan berihram; pendapat kedua mewajibkannya; dan '
          'pendapat ketiga mewajibkannya hanya bagi yang jarang masuk '
          '(seperti peniaga atau pengunjung), manakala yang sering keluar '
          'masuk seperti pencari kayu api dikecualikan.',
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
        _duaMulaTawaf,
        _duaRabbanaTawaf,
        _duaZamzam,
        _duaAyatSafa,
        _duaZikirSafa,
        _duaSai,
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
          'sudut fiqh, terdapat tiga Tawaf dalam Haji: Qudum (sunat), '
          'Ifadah (rukun) dan Wada\u2019 (wajib menurut pendapat yang lebih '
          'sahih), masing-masing dengan hukum dan waktu yang berbeza. '
          'Tawaf Ifadah dan Sa\u2019i (jika belum dilakukan selepas Tawaf '
          'Qudum) ditunaikan selepas wukuf, iaitu pada atau selepas 10 '
          'Zulhijjah. Fasal Kaifiyat Tawaf dalam al-Idah menyenaraikan '
          'lapan perkara syarat dan wajib Tawaf (sebahagiannya '
          'diperselisihkan) \u2014 antaranya menutup aurat, suci daripada '
          'hadas dan najis, berada di dalam masjid, menyempurnakan tujuh '
          'pusingan, memulakan dari sejajar Hajar Aswad dengan Baitullah '
          'di sebelah kiri, dan seluruh badan berada di luar Baitullah '
          '(termasuk Hijr Ismail); muwalat dan solat sunat Tawaf pula '
          'sunat menurut pendapat yang lebih sahih. Manakala Fasal Sa\u2019i '
          'pula mensyaratkan penyempurnaan jarak penuh antara Safa dan '
          'Marwah tanpa berbaki walau sebahagian langkah, serta tertib '
          'bermula dari Safa dan disudahi di Marwah \u2014 mazhab '
          'Syafi\u2019i meletakkan Sa\u2019i sebagai rukun, bukan sekadar '
          'wajib, antara lain berdasarkan sabda Nabi SAW: "Bersa\u2019ilah '
          'kamu, kerana Allah telah mewajibkan Sa\u2019i ke atas kamu" '
          '(riwayat Ahmad).',
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
          'Berada di Arafah pada waktu wukuf dan perbanyak doa serta zikir.',
      actions: <String>[
        'Pastikan berada dalam kawasan Arafah, walaupun seketika, antara '
            'gelincir matahari 9 Zulhijjah hingga terbit fajar 10 Zulhijjah.',
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
        _duaKeArafah,
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
              'Riwayat at-Tirmidhi (no. 3585) — Rasulullah SAW bersabda: '
              '"Sebaik-baik doa ialah doa pada hari Arafah."',
        ),
        _duaArafahAli,
        _duaArafahAmpun,
        _duaArafahTaat,
      ],
      academicInsight:
          'Sabda Rasulullah SAW "al-Hajju Arafah" (Haji itu adalah '
          'Arafah) — riwayat at-Tirmidhi dan Abu Dawud — menegaskan '
          'kedudukan wukuf sebagai rukun teragung. Menurut al-Idah, waktu '
          'wukuf bermula dari gelincir matahari hari Arafah hingga terbit '
          'fajar hari raya; sesiapa yang berada di Arafah walaupun seketika '
          'dalam waktu ini, sah wukufnya dan dia mendapat Haji, manakala '
          'sesiapa yang terlepas waktu ini, luput Hajinya pada tahun '
          'tersebut — sama ada kerana uzur atau tidak (cuma orang yang '
          'beruzur tidak berdosa). Dia bertahallul dengan amalan Umrah, '
          'wajib mengqada Haji dan membayar dam. Arafah turut menjadi '
          'lokasi bersejarah Khutbah '
          'Wada\u2019 yang disampaikan Rasulullah SAW, merangkumi '
          'prinsip keadilan, kesamarataan, hak asasi, dan larangan riba '
          '— sebuah piagam kemanusiaan yang mendahului zamannya. Hari '
          'Arafah turut dianggap oleh ulama sebagai hari pengampunan '
          'dosa yang paling agung sepanjang tahun, berdasarkan hadis: '
          '"Tiada hari yang Allah lebih banyak membebaskan hamba daripada '
          'neraka berbanding hari Arafah" (riwayat Muslim).',
      reflectionQuestions: <String>[
        'Mengapakah Rasulullah SAW menegaskan "Haji itu adalah Arafah"? '
            'Apakah bezanya kesan terlepas wukuf berbanding terlepas '
            'wajib-wajib Haji yang lain?',
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
          'Bermalam di Muzdalifah, berehat dan membuat persediaan untuk Mina.',
      actions: <String>[
        'Ikut pergerakan kumpulan dari Arafah.',
        'Pastikan berada di Muzdalifah, walaupun seketika, selepas tengah '
            'malam (malam 10 Zulhijjah).',
        'Berehat dan jaga tenaga.',
        'Kutip tujuh biji batu kecil untuk Jamrah Aqabah; lebihkan sedikit '
            'sebagai simpanan.',
      ],
      checklist: <String>[
        'Berada di Muzdalifah selepas tengah malam.',
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
        _duaMasyarilHaram,
        _duaRabbanaMasyaril,
      ],
      academicInsight:
          'Muzdalifah berperanan sebagai persinggahan yang menghimpunkan '
          'jemaah selepas kesibukan Wukuf di Arafah, sebelum meneruskan '
          'perjalanan ke Mina. Rasulullah SAW mengajarkan solat Maghrib '
          'dan Isyak dijamak takhir di sini — satu bentuk rukhsah '
          '(kelonggaran) khusus bagi musafir yang mencerminkan sifat '
          'Islam yang mudah dan mengambil kira keletihan jemaah. Dalam '
          'Fasal Ifadah, Imam an-Nawawi menyebut dua pendapat Imam '
          'asy-Syafi’i tentang mabit (bermalam) di Muzdalifah — wajib '
          'atau sunat — dan dalam fasal penutup tentang rukun dan wajib '
          'Haji beliau mentarjihkan bahawa ia wajib (al-asah), '
          'bukan rukun; sesiapa yang meninggalkannya tanpa uzur sah Hajinya '
          'tetapi dikenakan dam. Namun dua imam besar mazhab, Ibnu '
          'Bintisy-Syafi’i dan Ibnu Khuzaimah, berpendapat ia rukun, '
          'maka an-Nawawi menasihatkan supaya bersungguh-sungguh bermalam '
          'demi keluar daripada khilaf. Mabit dikira terlaksana dengan '
          'hadir seketika sahaja di mana-mana bahagian Muzdalifah selepas '
          'tengah malam, dan disunatkan golongan lemah, sama ada wanita '
          'atau selainnya, didahulukan ke Mina selepas tengah malam '
          'sebelum fajar supaya dapat melontar sebelum sesak (asasnya '
          'hadis Saudah r.anha yang diriwayatkan oleh Aisyah r.anha).',
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
          'Pada 10 Zulhijjah, lontar Jamrah Aqabah mengikut jadual serta kemampuan.',
      actions: <String>[
        'Ikut jadual melontar yang ditetapkan.',
        'Lontar Jamrah Aqabah sahaja pada hari ini — tujuh biji batu, '
            'satu demi satu.',
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
              'Riwayat Muslim (hadis Jabir r.a.) — Rasulullah SAW '
              'bertakbir bersama setiap biji batu yang dilontar',
        ),
      ],
      academicInsight:
          'Ibadah melontar jamrah sering dikaitkan dengan peristiwa Nabi '
          'Ibrahim AS yang digoda oleh syaitan ketika diperintahkan '
          'menyembelih anaknya, Nabi Ismail AS, lalu baginda menolak '
          'godaan tersebut dengan melontar batu. Amalan ini menjadi '
          'lambang penolakan tegas terhadap hasutan syaitan dalam '
          'kehidupan seharian. Dari sudut fiqh, al-Idah menjelaskan bahawa '
          'pada hari Nahar (10 Zulhijjah) hanya Jamrah Aqabah dilontar; '
          'waktunya bermula selepas tengah malam (bagi yang telah '
          'berwukuf), afdal selepas matahari naik, dan talbiyah dihentikan '
          'pada lontaran pertama. Hari-hari Tasyriq (11, 12 dan 13 '
          'Zulhijjah) pula mempunyai jadual dan susunan lontaran tertentu '
          'pada ketiga-tiga jamrah (Ula/Sughra, Wusta, Aqabah/Kubra), dan '
          'pihak berkuasa Haji moden turut '
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
        'Laksanakan Tawaf Ifadah (rukun) dan Sa’i jika belum dilakukan '
            'selepas Tawaf Qudum.',
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
        _duaBercukur,
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
          'Ifadah bersama Sa\u2019i jika belum dilakukan), membenarkan '
          'jemaah kembali memakai pakaian biasa dan mengangkat semua '
          'larangan ihram kecuali yang berkaitan dengan wanita \u2014 jimak, '
          'dan bersentuhan dengan syahwat menurut pendapat yang lebih '
          'sahih; manakala tahallul thani berlaku selepas ketiga-tiga '
          'perkara tersebut selesai, mengangkat sepenuhnya semua larangan '
          'ihram. Menurut pendapat yang lebih sahih dalam al-Idah, '
          'bercukur atau bergunting adalah nusuk dan salah satu rukun '
          'Haji. Mencukur (halq) atau bergunting (taqsir) turut membawa '
          'makna simbolik '
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
      title: 'Hari Tasyriq di Mina',
      location: 'Mina',
      icon: HajjIconType.tasyriq,
      accent: Color(0xFFA8722F),
      summary:
          'Bermalam dan melontar tiga jamrah pada 11, 12 dan (jika perlu) 13 Zulhijjah.',
      actions: <String>[
        'Bermalam di Mina (sebahagian besar malam) pada malam-malam Tasyriq.',
        'Lontar Jamrah Ula, Wusta dan Aqabah mengikut susunan pada setiap hari.',
        'Pastikan waktu lontaran selepas gelincir matahari (zawal).',
        'Ketahui syarat nafar awal (bertolak pada 12 Zulhijjah selepas '
            'melontar dan sebelum matahari terbenam) dan nafar thani '
            '(13 Zulhijjah).',
      ],
      checklist: <String>[
        'Bermalam di Mina disahkan pada setiap malam Tasyriq.',
        'Tiga jamrah dilontar mengikut susunan yang betul.',
        'Bilangan batu bagi setiap jamrah mencukupi (7 biji).',
        'Keputusan nafar awal atau nafar thani dibuat sebelum matahari terbenam 12 Zulhijjah.',
      ],
      reminder:
          'Sesiapa yang memilih nafar awal wajib bertolak sebelum matahari terbenam pada 12 Zulhijjah, jika tidak dia wajib bermalam dan melontar pada 13 Zulhijjah.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Takbir Setiap Lontaran',
          arabic: 'اللَّهُ أَكْبَرُ',
          translation: 'Allah Maha Besar.',
          source:
              'Riwayat al-Bukhari (hadis Ibnu Umar r.a.) — bertakbir '
              'setiap kali selepas melontar sebiji batu di ketiga-tiga jamrah',
        ),
        _duaSelepasJamrah,
      ],
      academicInsight:
          'Menurut Imam an-Nawawi dalam al-Idah, susunan lontaran pada '
          'hari Tasyriq wajib bermula dengan Jamrah Ula (paling dekat '
          'dengan Masjid Khaif), diikuti Jamrah Wusta, dan disudahi '
          'dengan Jamrah Aqabah — tertib ini adalah syarat dan lontaran '
          'yang tidak mengikut susunan tidak dikira. Jemaah disunatkan '
          'berhenti berdoa selepas melontar Jamrah Ula dan Wusta '
          '(menghadap kiblat) kira-kira sekadar bacaan Surah al-Baqarah, '
          'tetapi tidak berhenti berdoa selepas Jamrah Aqabah. Bermalam '
          '(mabit) di Mina pada malam Tasyriq adalah wajib menurut '
          'pendapat yang lebih zahir (al-azhar) dalam mazhab Syafi’i, '
          'iaitu berada di Mina pada sebahagian besar malam; meninggalkan '
          'ketiga-tiga malam tanpa uzur mewajibkan dam, manakala '
          'meninggalkan satu malam dibayar dengan secupak (mud) makanan '
          'menurut pendapat yang lebih sahih. Orang yang tidak mampu '
          'melontar sendiri kerana sakit yang tidak dijangka sembuh '
          'sebelum tamat waktu melontar boleh mewakilkan orang lain, dan '
          'wakil itu mesti melontar untuk dirinya terlebih dahulu. Nafar '
          'awal (bertolak pada 12 Zulhijjah selepas lontaran dan sebelum '
          'matahari terbenam) adalah rukhsah yang disebut dalam al-Quran '
          '(al-Baqarah: 203), manakala nafar thani (bermalam hingga 13 '
          'Zulhijjah) adalah lebih afdal.',
      reflectionQuestions: <String>[
        'Mengapakah susunan lontaran tiga jamrah (Ula, Wusta, Aqabah) '
            'perlu diikuti dengan tertib dan tidak boleh dibalik?',
        'Apakah perbezaan hukum dan kelebihan antara memilih nafar '
            'awal berbanding nafar thani pada hari Tasyriq?',
      ],
    ),
    HajjGuideStepData(
      number: '10',
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
        _duaWada,
        _duaZamzam,
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
              'Riwayat at-Tirmidhi (no. 3433) — doa umum, sesuai '
              'diamalkan sebelum meninggalkan Makkah sebagai tanda '
              'kesyukuran dan permohonan taubat',
        ),
      ],
      academicInsight:
          'Tawaf Wada\u2019 disyariatkan sebagai amalan terakhir sebelum '
          'jemaah meninggalkan Makkah, berdasarkan arahan Rasulullah '
          'SAW: "Janganlah seseorang daripada kamu bertolak pulang '
          'sehingga akhir urusannya ialah di Baitullah" (riwayat '
          'Muslim). Menurut pendapat yang lebih sahih dalam al-Idah, '
          'hukumnya wajib (bukan rukun); sesiapa yang keluar tanpanya '
          'wajib kembali selagi belum mencapai jarak perjalanan qasar, '
          'dan jika tidak kembali dia dikenakan dam. Ia melambangkan '
          'penghormatan terakhir '
          'kepada Baitullah sebelum berpisah, sekali gus mengingatkan '
          'jemaah tentang perpisahan hakiki dengan dunia kelak. Wanita '
          'yang didatangi haid atau nifas dikecualikan daripada '
          'kewajipan ini. Lebih penting lagi, para '
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
    HajjGuideStepData(
      number: '11',
      title: 'Umrah Berasingan',
      location: 'Makkah / Tan’im',
      icon: HajjIconType.umrahJourney,
      accent: Color(0xFF3D8FA0),
      summary:
          'Laksanakan Umrah berasingan dari miqat terdekat semasa masih tinggal di Makkah.',
      actions: <String>[
        'Keluar ke Tanah Halal terdekat (contohnya Tan’im) untuk berihram Umrah.',
        'Berniat Umrah dan baca talbiyah dari miqat.',
        'Lakukan Tawaf tujuh pusingan dan Sa’i tujuh kali.',
        'Bertahallul dengan bercukur atau bergunting rambut.',
      ],
      checklist: <String>[
        'Miqat Umrah dikenal pasti dan dituju.',
        'Niat dan talbiyah Umrah dilaksanakan.',
        'Tawaf dan Sa’i Umrah selesai.',
        'Tahallul Umrah dilakukan.',
      ],
      reminder:
          'Umrah boleh diulangi beberapa kali semasa tinggal di Makkah selepas selesai urusan Haji, tetapi elakkan menyusahkan diri atau kumpulan.',
      duas: <GuideDua>[_duaNiatUmrah, _duaTalbiyah],
      academicInsight:
          'Dalam Bab keempat al-Idah, Imam an-Nawawi menjelaskan bahawa '
          'rukun Umrah ada empat — ihram, Tawaf, Sa’i dan '
          'bercukur/bergunting — dan wajibnya ialah berihram dari '
          'miqat; tiada wukuf, mabit atau melontar seperti dalam Haji. '
          'Umrah boleh dilakukan pada bila-bila masa sepanjang tahun, '
          'berbeza dengan Haji yang terikat dengan bulan-bulan tertentu; '
          'namun orang yang sedang berihram Haji, atau yang masih '
          'bermukim di Mina untuk melontar, tidak sah berihram Umrah, dan '
          'afdalnya ditangguhkan hingga hari Tasyriq berakhir. Bagi jemaah '
          'yang telah berada di Makkah, Aisyah r.a. pernah diarahkan '
          'Rasulullah SAW keluar ke Tan’im untuk berihram Umrah '
          'yang berasingan daripada Umrah dalam Haji, dan amalan ini '
          'menjadi asas kepada kebiasaan sebahagian jemaah melakukan '
          'Umrah sunat tambahan semasa tinggal di Makkah.',
      reflectionQuestions: <String>[
        'Apakah rukun-rukun yang sama dan berbeza antara Umrah dan '
            'Haji, dan mengapakah Umrah tidak terikat dengan waktu '
            'tertentu?',
        'Apakah hikmah di sebalik galakan melakukan Umrah tambahan '
            'semasa masih berada di Makkah, tanpa menyusahkan diri?',
      ],
    ),
    HajjGuideStepData(
      number: '12',
      title: 'Ziarah Madinah',
      location: 'Masjid Nabawi',
      icon: HajjIconType.madinah,
      accent: Color(0xFF2F8F5B),
      summary:
          'Ziarahi Masjid Nabawi dan makam Rasulullah ﷺ dengan adab yang sempurna.',
      actions: <String>[
        'Niatkan ziarah ke makam Rasulullah ﷺ serta bermusafir ke Masjid '
            'Nabawi dan solat di dalamnya sebagai ibadah kepada Allah.',
        'Solat di Raudhah jika berkesempatan, tanpa bersesak-sesak.',
        'Beri salam kepada Rasulullah ﷺ serta Abu Bakar dan Umar r.a.',
        'Jaga adab, rendahkan suara, jangan bertawaf di sekeliling makam '
            'dan jangan mengusap atau mencium dindingnya.',
      ],
      checklist: <String>[
        'Adab ziarah difahami sebelum masuk.',
        'Solat sunat di Masjid Nabawi dilaksanakan.',
        'Salam kepada Rasulullah ﷺ disampaikan dengan sopan.',
        'Ziarah dilakukan tanpa perbuatan yang bercanggah syarak.',
      ],
      reminder:
          'Ziarah Madinah bukan sebahagian daripada rukun atau wajib Haji, tetapi amat dianjurkan kerana kelebihannya yang besar.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Salam kepada Rasulullah ﷺ',
          arabic:
              'السَّلَامُ عَلَيْكَ يَا رَسُولَ اللَّهِ، السَّلَامُ عَلَيْكَ '
              'يَا نَبِيَّ اللَّهِ',
          translation:
              'Salam sejahtera ke atasmu wahai Rasulullah, salam sejahtera '
              'ke atasmu wahai Nabi Allah.',
          source:
              'Al-Idah, Bab 6 — permulaan lafaz salam ziarah; sekurang-'
              'kurangnya: "As-salamu ’alaika ya Rasulallah"',
        ),
        _duaSalamLengkap,
        _duaSalamAbuBakar,
        _duaSalamUmar,
        _duaBaqi,
        _duaTinggalMadinah,
      ],
      academicInsight:
          'Imam an-Nawawi meletakkan bab ziarah makam Rasulullah ﷺ '
          'sebagai bab keenam dalam al-Idah, menukilkan hadis riwayat '
          'al-Bazzar dan ad-Daraqutni: "Sesiapa yang menziarahi kuburku, '
          'wajiblah baginya syafaatku" — walaupun sebahagian ahli hadis '
          'mengulas status sanadnya. Adab ziarah yang digariskan termasuk '
          'menghadap makam dengan penuh kesopanan, merendahkan suara dan '
          'memberi salam dengan lafaz yang khusus. Imam an-Nawawi '
          'menegaskan bahawa tidak harus bertawaf mengelilingi makam '
          'Baginda ﷺ, dan makruh melekapkan badan pada dindingnya, '
          'mengusap atau menciumnya; adab yang betul ialah menjauh '
          'sebagaimana seseorang menjauh jika berada di hadapan Baginda '
          'semasa hayatnya. Ziarah ini '
          'bukan syarat sah atau rukun Haji, tetapi digalakkan kerana '
          'kelebihan solat di Masjid Nabawi yang berganda seribu kali '
          'ganda berbanding masjid lain selain Masjidil Haram.',
      reflectionQuestions: <String>[
        'Apakah adab-adab yang perlu dijaga semasa menziarahi makam '
            'Rasulullah ﷺ, dan mengapa tawaf atau usapan di sekitar '
            'makam ditegah?',
        'Mengapakah ziarah Madinah digalakkan walaupun ia bukan rukun '
            'atau wajib Haji?',
      ],
    ),
    HajjGuideStepData(
      number: '13',
      title: 'Kifarat dan Dam',
      location: 'Rujukan umum',
      icon: HajjIconType.dam,
      accent: Color(0xFF8C5A3C),
      summary:
          'Fahami dam dan kifarat yang wajib apabila tertinggal wajib Haji atau melanggar larangan ihram.',
      actions: <String>[
        'Kenal pasti jenis dam: tertib-taqdir, tertib-ta’dil, '
            'takhyir-taqdir atau takhyir-ta’dil.',
        'Rujuk pembimbing Haji sebaik sahaja tersedar tertinggal wajib atau melanggar larangan.',
        'Laksanakan dam mengikut jenis kesalahan (menyembelih, berpuasa atau bersedekah).',
        'Pastikan penyembelihan dam dilakukan di tanah Haram dan diagihkan kepada fakir miskin.',
      ],
      checklist: <String>[
        'Jenis kesalahan atau perkara yang tertinggal dikenal pasti.',
        'Jenis dam yang wajib disemak bersama pembimbing Haji.',
        'Dam dilaksanakan mengikut cara yang ditetapkan.',
        'Bukti atau pengesahan pelaksanaan dam disimpan.',
      ],
      reminder:
          'Jangan tangguhkan urusan dam tanpa sebab; segera rujuk pembimbing Haji yang berkelayakan.',
      duas: <GuideDua>[
        GuideDua(
          title: 'Doa Memohon Kemudahan',
          arabic:
              'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً',
          translation:
              'Wahai Tuhan kami, kurniakanlah kami kebaikan di dunia dan '
              'kebaikan di akhirat.',
          source: 'Surah al-Baqarah, ayat 201',
        ),
        _duaSembelih,
      ],
      academicInsight:
          'Bab ketujuh al-Idah membahaskan dam mengikut dua sebab: '
          'meninggalkan perkara yang diperintahkan, dan melakukan larangan '
          'ihram. Bagi yang meninggalkan wajib Haji — contohnya berihram '
          'selepas melepasi miqat, tidak melontar, tidak bermalam di '
          'Muzdalifah atau ketiga-tiga malam di Mina, atau tidak Tawaf '
          'Wada’ — wajib menyembelih seekor kambing; jika tidak '
          'mampu, menurut pendapat yang lebih sahih dia berpuasa seperti '
          'orang Tamattu’: tiga hari semasa Haji dan tujuh hari selepas '
          'pulang (dam tertib dan taqdir). Bagi larangan ihram seperti '
          'mencukur rambut, memotong kuku, memakai pakaian berjahit, '
          'memakai wangian atau bersentuhan dengan syahwat, jemaah boleh '
          'memilih antara menyembelih seekor kambing, memberi makan enam '
          'orang miskin setiap seorang setengah gantang (nisf sa’), atau '
          'berpuasa tiga hari (dam takhyir dan taqdir). Membunuh buruan '
          'pula dikenakan haiwan yang setara atau nilainya (dam takhyir '
          'dan ta’dil). Jimak sebelum tahallul awal pula merosakkan Haji: '
          'dia wajib meneruskan Haji yang rosak itu hingga selesai, '
          'mengqadanya, dan menyembelih seekor unta (badanah) — jika '
          'tidak mampu, lembu, kemudian tujuh ekor kambing, kemudian nilai '
          'makanan, kemudian puasa (dam tertib dan ta’dil). Pembahagian '
          'empat jenis dam ini dirumuskan secara jelas dalam hasyiah kitab '
          'berdasarkan huraian an-Nawawi.',
      reflectionQuestions: <String>[
        'Apakah perbezaan antara dam tertib dan dam takhyir, serta '
            'antara taqdir dan ta’dil, dan bagaimana ia berkait dengan '
            'sebab kewajipannya?',
        'Mengapakah penting bagi jemaah untuk segera merujuk pembimbing '
            'Haji apabila tersedar tertinggal wajib atau melanggar '
            'larangan ihram, berbanding menangguhkannya?',
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
      HajjGuideScreen.storageKey,
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

    await widget.guideBox.put(HajjGuideScreen.storageKey, savedSteps);
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
        child: Stack(
          children: <Widget>[
            const Positioned.fill(child: KaleidoscopeBackdrop(opacity: 0.22)),
            const IslamicPatternOverlay(),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 820),
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
                                      'PANDUAN HAJI',
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
                        ),
                        const SizedBox(height: 24),
                        ScrollReveal(
                          delay: const Duration(milliseconds: 80),
                          child: _GuideProgressCard(
                            completed: completedSteps.length,
                            total: steps.length,
                            progress: progress,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Perjalanan Haji',
                          style: TextStyle(
                            fontFamily: AppFonts.display,
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
                          return ScrollReveal(
                            delay: Duration(milliseconds: 40 * (index % 6)),
                            child: _TimelineStep(
                              step: steps[index],
                              isCompleted: completedSteps.contains(index),
                              isLast: index == steps.length - 1,
                              onTap: () {
                                _openStep(index);
                              },
                            ),
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
          ],
        ),
      ),
    );
  }
}

/// Panduan Umrah — silibus berasingan daripada Panduan Haji, tetapi
/// menggunakan struktur data ([HajjGuideStepData], [GuideDua]), skrin
/// perincian ([HajjGuideDetailScreen]) dan widget-widget (`_TimelineStep`,
/// `_GuideProgressCard`, `_GuidePrototypeNotice`) yang sama seperti modul
/// Haji, selaras dengan Bab 4 (al-Umrah / العمرة) kitab al-Idah karangan Imam
/// an-Nawawi.
class UmrahGuideScreen extends StatefulWidget {
  const UmrahGuideScreen({required this.guideBox, super.key});

  final Box<dynamic> guideBox;

  /// Kunci storan Hive berasingan daripada Panduan Haji supaya kemajuan
  /// kedua-dua silibus tidak bercampur.
  static const String storageKey = 'completed_umrah_steps';

  static int get totalSteps => _UmrahGuideScreenState.steps.length;

  @override
  State<UmrahGuideScreen> createState() => _UmrahGuideScreenState();
}

class _UmrahGuideScreenState extends State<UmrahGuideScreen> {
  final Set<int> completedSteps = <int>{};

  static const List<HajjGuideStepData> steps = <HajjGuideStepData>[
    HajjGuideStepData(
      number: '01',
      title: 'Niat & Persediaan Umrah',
      location: 'Sebelum berangkat',
      icon: HajjIconType.preparation,
      accent: Color(0xFF2F8F79),
      summary:
          'Sediakan diri dan fahami rukun Umrah sebelum bergerak ke miqat.',
      actions: <String>[
        'Fahami rukun Umrah: Ihram, Tawaf, Sa’i dan Tahallul.',
        'Sediakan pakaian ihram dan keperluan asas perjalanan.',
        'Rancang jadual supaya tidak tergesa-gesa semasa di miqat.',
        'Bertaubat dan bersihkan diri daripada dosa sebelum berangkat.',
      ],
      checklist: <String>[
        'Rukun Umrah difahami.',
        'Pakaian ihram disediakan.',
        'Jadual perjalanan disemak.',
        'Persediaan rohani (taubat, niat ikhlas) dilakukan.',
      ],
      reminder:
          'Umrah tidak mempunyai wukuf, mabit Muzdalifah atau Mina — '
          'jangan keliru dengan susunan ibadah Haji.',
      duas: <GuideDua>[
        _duaKeluarRumah,
        _duaBerlindungKeluarRumah,
        _duaNaikKenderaan,
        _duaMusafir,
        _duaSinggah,
      ],
      academicInsight:
          'Dalam Bab keempat al-Idah, Imam an-Nawawi menegaskan bahawa '
          'pendapat yang sahih (al-mazhab as-sahih) daripada dua pendapat '
          'Imam asy-Syafi’i, iaitu nasnya dalam kitab-kitab jadid, ialah '
          'Umrah fardu ke atas yang berkemampuan sama seperti Haji. Dalil '
          'yang lazim dikemukakan (sebagaimana dinukil dalam hasyiah '
          'kitab) ialah firman Allah SWT: "Sempurnakanlah ibadat Haji dan '
          'Umrah kerana Allah" (al-Baqarah: 196) dan sabda Nabi SAW kepada '
          'seorang lelaki: "Berhajilah untuk bapamu dan berumrahlah." '
          'Kewajipan ini hanya sekali seumur hidup, tetapi disunatkan '
          'memperbanyak Umrah — lebih-lebih lagi dalam bulan Ramadan, '
          'berdasarkan hadis: "Umrah dalam Ramadan menyamai (pahala) Haji" '
          '(riwayat al-Bukhari dan Muslim daripada Ibnu Abbas r.a.).',
      reflectionQuestions: <String>[
        'Mengapakah Imam an-Nawawi mengambil pendapat bahawa Umrah '
            'adalah fardu, sama seperti Haji, walaupun terdapat khilaf '
            'ulama dalam isu ini?',
        'Apakah hikmah digalakkan memperbanyak Umrah, terutama '
            'dalam bulan Ramadan?',
      ],
    ),
    HajjGuideStepData(
      number: '02',
      title: 'Ihram di Miqat Umrah',
      location: 'Miqat / Tanah Halal',
      icon: HajjIconType.ihram,
      accent: Color(0xFFB18443),
      summary: 'Berihram dari miqat yang betul dan berniat khusus Umrah.',
      actions: <String>[
        'Bagi yang datang dari luar Makkah, berihram di salah satu '
            'daripada 5 miqat makani (sama seperti miqat Haji).',
        'Bagi penduduk atau yang sudah berada di Makkah, keluar dahulu '
            'ke Tanah Halal terdekat (contoh: Tan’im) sebelum berniat.',
        'Mulakan talbiyah sebaik sahaja berniat Umrah.',
        'Jaga larangan ihram sepanjang tempoh Umrah.',
      ],
      checklist: <String>[
        'Miqat yang betul dikenal pasti.',
        'Niat Umrah dilakukan sebelum melepasi/keluar had miqat.',
        'Talbiyah dibaca.',
        'Larangan ihram difahami.',
      ],
      reminder:
          'Sesiapa yang berada di Makkah wajib keluar ke Tanah Halal '
          '(walaupun selangkah) untuk berihram Umrah. Jika dia berihram di '
          'dalam Tanah Haram, ihramnya sah tetapi dia wajib keluar ke '
          'Tanah Halal sebelum Tawaf; jika tidak, Umrahnya sah menurut '
          'pendapat yang lebih sahih tetapi dia dikenakan dam.',
      duas: <GuideDua>[
        _duaNiatUmrah,
        _duaTalbiyah,
        _duaSelawatTalbiyah,
        _duaLabbaikaAisy,
      ],
      academicInsight:
          'Bab keempat al-Idah menjelaskan Umrah mempunyai '
          'dua miqat seperti Haji — zamani (masa, tetapi tanpa had '
          'tertentu sepanjang tahun) dan makani (tempat). Bagi yang '
          'datang dari luar Makkah, miqat makaninya sama seperti miqat '
          'Haji. Namun bagi sesiapa yang sudah berada di Makkah — sama '
          'ada penduduk tetap atau pendatang — miqat Umrahnya ialah '
          'Tanah Halal terdekat, kerana Umrah menuntut penggabungan '
          'antara Tanah Halal dan Tanah Haram (berbeza daripada Haji '
          'yang miqatnya boleh dari Makkah sendiri). Mazhab Syafi’i '
          'meletakkan Ji’ranah sebagai tempat paling afdal untuk '
          'berihram Umrah kerana Nabi SAW pernah berihram dari sana, '
          'diikuti Tan’im — kerana Rasulullah SAW mengarahkan Aisyah '
          'r.anha keluar ke Tan’im untuk berihram Umrah — kemudian '
          'Hudaibiyah.',
      reflectionQuestions: <String>[
        'Mengapakah orang yang berada di Makkah perlu keluar ke Tanah '
            'Halal untuk berihram Umrah, berbeza dengan miqat Haji yang '
            'boleh dari Makkah sendiri?',
        'Apakah hikmah di sebalik keperluan menggabungkan Tanah Halal '
            'dan Tanah Haram dalam ibadah Umrah?',
      ],
    ),
    HajjGuideStepData(
      number: '03',
      title: 'Tawaf Umrah',
      location: 'Masjidil Haram',
      icon: HajjIconType.tawaf,
      accent: Color(0xFF7A6CB1),
      summary: 'Laksanakan Tawaf tujuh pusingan mengelilingi Kaabah.',
      actions: <String>[
        'Laksanakan Tawaf sebanyak tujuh pusingan bermula dari Hajar Aswad.',
        'Gunakan kaunter Tawaf bagi membantu kiraan.',
        'Solat sunat dua rakaat selepas Tawaf di belakang Maqam Ibrahim.',
        'Pastikan syarat sah Tawaf (suci, tutup aurat) dipenuhi.',
      ],
      checklist: <String>[
        'Tujuh pusingan Tawaf selesai.',
        'Solat sunat Tawaf dilaksanakan.',
        'Kiraan disemak sebelum meneruskan Sa’i.',
        'Keadaan fizikal dipantau.',
      ],
      reminder:
          'Tawaf Umrah menggunakan syarat dan tatacara yang sama seperti '
          'Tawaf dalam Haji — rujuk Panduan Haji langkah "Tawaf dan Sa’i" '
          'untuk perincian penuh.',
      duas: <GuideDua>[
        _duaMelihatKaabah,
        _duaMulaTawaf,
        _duaRamal,
        _duaEmpatPusinganAkhir,
        _duaRabbanaTawaf,
        _duaZamzam,
      ],
      academicInsight:
          'Tawaf Umrah adalah rukun kedua selepas Ihram, dengan syarat '
          'dan wajib yang sama seperti Tawaf Ifadah dalam Haji (lapan '
          'perkara yang disebut dalam Fasal Kaifiyat Tawaf, Bab 3 al-Idah, '
          'sebahagiannya diperselisihkan) — antaranya menutup aurat, suci '
          'daripada hadas dan najis, memulakan dari sejajar Hajar Aswad, '
          'dan menyempurnakan tujuh pusingan penuh. Menurut Bab 4 al-Idah, '
          'talbiyah dihentikan apabila mula bertawaf, dan lelaki '
          'disunatkan berlari-lari anak (ramal) pada tiga pusingan '
          'pertama. Perbezaan utamanya, Tawaf Umrah tidak didahului oleh '
          'Wukuf di Arafah.',
      reflectionQuestions: <String>[
        'Apakah persamaan dan perbezaan antara Tawaf Umrah dan Tawaf '
            'Ifadah dalam ibadah Haji?',
        'Mengapakah penting memastikan syarat sah Tawaf (seperti suci '
            'daripada hadas) dipenuhi sebelum memulakannya?',
      ],
    ),
    HajjGuideStepData(
      number: '04',
      title: 'Sa’i Umrah',
      location: 'Antara Safa dan Marwah',
      icon: HajjIconType.sai,
      accent: Color(0xFF3D8FA0),
      summary: 'Laksanakan Sa’i tujuh kali antara Safa dan Marwah.',
      actions: <String>[
        'Mulakan Sa’i dari Safa dan sudahi di Marwah.',
        'Sempurnakan tujuh kali perjalanan (pergi dan balik masing-masing dikira satu).',
        'Gunakan kaunter Sa’i untuk merekod perjalanan.',
        'Berdoa dengan doa ma’thur di Safa dan Marwah.',
      ],
      checklist: <String>[
        'Tujuh kali perjalanan Sa’i selesai.',
        'Bermula di Safa, berakhir di Marwah.',
        'Kiraan disemak sebelum bertahallul.',
        'Keadaan fizikal dipantau.',
      ],
      reminder:
          'Sa’i Umrah wajib menyempurnakan jarak penuh antara Safa dan '
          'Marwah tanpa berbaki walau sebahagian langkah, sama seperti Sa’i Haji.',
      duas: <GuideDua>[_duaAyatSafa, _duaZikirSafa, _duaSafaIbnUmar, _duaSai],
      academicInsight:
          'Sa’i ialah rukun ketiga Umrah, dengan hukum dan syarat yang '
          'sama seperti Sa’i dalam Haji — mazhab Syafi’i meletakkannya '
          'sebagai rukun (bukan sekadar wajib), antara lain berdasarkan '
          'sabda Nabi SAW: "Bersa’ilah kamu, kerana Allah telah '
          'mewajibkan Sa’i ke atas kamu" (riwayat Ahmad). Tertib turut '
          'disyaratkan: mesti selepas Tawaf yang sah, dan bermula dari Safa.',
      reflectionQuestions: <String>[
        'Mengapakah Sa’i mesti dilaksanakan selepas Tawaf, dan '
            'apakah kesannya jika susunan ini tidak dipatuhi?',
        'Bagaimana kisah Siti Hajar AS dalam peristiwa Sa’i '
            'mengajar erti tawakal kepada jemaah Umrah masa kini?',
      ],
    ),
    HajjGuideStepData(
      number: '05',
      title: 'Tahallul Umrah',
      location: 'Selepas Sa’i',
      icon: HajjIconType.tahallul,
      accent: Color(0xFF5B9279),
      summary: 'Bercukur atau bergunting untuk menamatkan ihram Umrah.',
      actions: <String>[
        'Bercukur (halq) atau bergunting (taqsir) sebaik selesai Sa’i.',
        'Lelaki digalakkan bercukur habis kerana lebih afdal.',
        'Wanita memadai bergunting hujung rambut; minimumnya tiga helai rambut.',
        'Selepas bercukur/bergunting, semua larangan ihram terangkat.',
      ],
      checklist: <String>[
        'Sa’i telah disahkan selesai.',
        'Bercukur atau bergunting dilaksanakan.',
        'Status tahallul (Umrah selesai) difahami.',
        'Pakaian biasa boleh dipakai semula.',
      ],
      reminder:
          'Umrah selesai sepenuhnya selepas tahallul — tiada wukuf, '
          'mabit atau lontar jamrah seperti dalam Haji.',
      duas: <GuideDua>[
        _duaBercukur,
        GuideDua(
          title: 'Doa Memohon Penerimaan Amalan',
          arabic: 'اللَّهُمَّ تَقَبَّلْ مِنِّي',
          translation: 'Ya Allah, terimalah (amalan) daripadaku.',
          source:
              'Doa umum memohon penerimaan amalan, sesuai diamalkan '
              'selepas menyempurnakan Umrah',
        ),
      ],
      academicInsight:
          'Tahallul (bercukur/bergunting) ialah rukun keempat dan '
          'terakhir Umrah menurut mazhab Syafi’i — dengan '
          'penyempurnaannya, Umrah dikira selesai sepenuhnya dan semua '
          'larangan ihram terangkat serta-merta, berbeza dengan Haji '
          'yang mempunyai tahallul awal dan tahallul thani kerana lebih '
          'banyak rukun yang perlu disempurnakan dahulu. Mencukur habis '
          '(halq) dianggap lebih afdal bagi lelaki berdasarkan doa '
          'khusus Rasulullah SAW: "Ya Allah, rahmatilah mereka yang '
          'bercukur" — diulang tiga kali, berbanding sekali sahaja bagi '
          'yang bergunting.',
      reflectionQuestions: <String>[
        'Mengapakah tahallul Umrah lebih ringkas berbanding Haji yang '
            'mempunyai dua peringkat tahallul?',
        'Apakah hikmah Rasulullah SAW mendoakan golongan yang '
            'bercukur habis sebanyak tiga kali berbanding sekali bagi '
            'yang bergunting?',
      ],
    ),
    HajjGuideStepData(
      number: '06',
      title: 'Selepas Umrah',
      location: 'Makkah',
      icon: HajjIconType.umrahJourney,
      accent: Color(0xFFC05C65),
      summary: 'Kekalkan amalan baik dan pertimbangkan mengulangi Umrah.',
      actions: <String>[
        'Perbanyak solat, Tawaf sunat dan doa di Masjidil Haram.',
        'Jika mahu mengulangi Umrah, keluar semula ke Tanah Halal terdekat untuk berniat.',
        'Elakkan menyusahkan diri atau kumpulan jika mengulangi Umrah berkali-kali.',
        'Kekalkan kesan positif ibadah selepas pulang ke tanah air.',
      ],
      checklist: <String>[
        'Amalan sunat di Masjidil Haram diteruskan.',
        'Keputusan mengulangi Umrah (jika ada) dirancang dengan baik.',
        'Adab dan kesopanan dijaga sepanjang tinggal di Makkah.',
        'Azam mengekalkan istiqamah selepas pulang dibuat.',
      ],
      reminder:
          'Setiap kali mengulangi Umrah, wajib keluar semula ke Tanah '
          'Halal untuk berihram — jangan berniat dari dalam Tanah Haram '
          '(termasuk Masjidil Haram).',
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
          source: 'Riwayat at-Tirmidhi (no. 3433) — doa umum',
        ),
      ],
      academicInsight:
          'Imam an-Nawawi menegaskan dalam Bab keempat al-Idah bahawa '
          'disunatkan memperbanyak Umrah, terutamanya dalam bulan Ramadan, '
          'sambil menukilkan hadis sahih: "Umrah ke Umrah adalah kifarat '
          'bagi dosa antara keduanya" (riwayat al-Bukhari dan Muslim). '
          'Hasyiah kitab pula menambah bahawa galakan ini selagi tidak '
          'melalaikan perkara yang lebih penting, serta menukilkan athar '
          'tentang Aisyah r.anha yang berumrah lebih sekali dalam setahun. '
          'Namun Imam Malik memakruhkan pengulangan Umrah dalam setahun '
          'kerana Rasulullah SAW tidak melakukannya. Sikap pertengahan '
          'yang digalakkan ialah memperbanyak Umrah tanpa menjadikannya '
          'beban atau mengurangkan kekhusyukannya.',
      reflectionQuestions: <String>[
        'Apakah hikmah di sebalik galakan memperbanyak Umrah, dan '
            'mengapakah sebahagian ulama memakruhkan pengulangan yang '
            'terlalu kerap?',
        'Bagaimana jemaah dapat mengekalkan kesan positif ibadah Umrah '
            'selepas pulang ke tanah air?',
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
      UmrahGuideScreen.storageKey,
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

    await widget.guideBox.put(UmrahGuideScreen.storageKey, savedSteps);
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
        child: Stack(
          children: <Widget>[
            const Positioned.fill(child: KaleidoscopeBackdrop(opacity: 0.22)),
            const IslamicPatternOverlay(),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 820),
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
                                      'PANDUAN UMRAH',
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
                        ),
                        const SizedBox(height: 24),
                        ScrollReveal(
                          delay: const Duration(milliseconds: 80),
                          child: _GuideProgressCard(
                            completed: completedSteps.length,
                            total: steps.length,
                            progress: progress,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Perjalanan Umrah',
                          style: TextStyle(
                            fontFamily: AppFonts.display,
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
                          return ScrollReveal(
                            delay: Duration(milliseconds: 40 * (index % 6)),
                            child: _TimelineStep(
                              step: steps[index],
                              isCompleted: completedSteps.contains(index),
                              isLast: index == steps.length - 1,
                              onTap: () {
                                _openStep(index);
                              },
                            ),
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
          ],
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
                            style: TextStyle(
                              fontFamily: AppFonts.display,
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

/// Doa atau zikir bagi sesuatu amalan/lokasi Haji dan Umrah — sama ada
/// ma'thur (al-Quran/hadis/athar) atau anjuran ulama; statusnya dinyatakan
/// dalam [source].
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

  /// Sumber dan status doa (contoh: "Riwayat al-Bukhari dan Muslim" atau
  /// "Al-Idah, Bab 3 … doa anjuran ulama").
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
                      style: TextStyle(
                        fontFamily: AppFonts.display,
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
                          fontSize: 12,
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
            child: HajjHoverCard(
              accent: step.accent,
              onTap: onTap,
              borderRadius: 22,
              padding: const EdgeInsets.all(18),
              restBorderColor: isCompleted
                  ? step.accent.withValues(alpha: 0.32)
                  : null,
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
                          style: TextStyle(
                            fontFamily: AppFonts.display,
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
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  step.title,
                  style: TextStyle(
                    fontFamily: AppFonts.display,
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
                        fontSize: 12,
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
                style: TextStyle(
                  fontFamily: AppFonts.display,
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
              'Panduan ini ialah prototaip yang disusun '
              'berpandukan kitab al-Idah fi Manasik al-Hajj wa al-Umrah '
              '(الإيضاح في مناسك الحج والعمرة) karangan Imam an-Nawawi '
              '(الإمام النووي, w. 676H). Urutan dan hukum akhir hendaklah '
              'disemak bersama pembimbing Haji atau panel '
              'syariah yang berautoriti sebelum dijadikan '
              'rujukan hukum.',
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

/// Kad memaparkan doa dan zikir (Arab + terjemahan + sumber) berkaitan
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
                  'Doa & Zikir',
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
          for (int i = 0; i < duas.length; i++) ...<Widget>[
            SizedBox(height: i == 0 ? 18 : 24),
            if (duas.length > 1) ...<Widget>[
              Text(
                duas[i].title.toUpperCase(),
                style: TextStyle(
                  color: accent,
                  fontSize: 12,
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
