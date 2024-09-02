import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test1907/app_theme.dart'; // استيراد المكتبة لتشغيل الصوت

class RadioTab extends StatefulWidget {
  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  // متغير لتخزين مشغل الصوت
  late AudioPlayer _audioPlayer;
  // متغير لتخزين مستوى الصوت (من 0.0 إلى 1.0)
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
    // إنشاء مثيل لمشغل الصوت عند بدء حالة الودجيت
    _audioPlayer = AudioPlayer();
  }

  // دالة لتشغيل الراديو
  void _playRadio() async {
    try {
      // تعيين رابط الصوت وتحميله
      await _audioPlayer.setUrl("https://qurango.net/radio/fares_abbad.mp3");
      // تعيين مستوى الصوت
      _audioPlayer.setVolume(_volume);
      // تشغيل الصوت
      _audioPlayer.play();
    } catch (e) {
      print("Error playing radio: $e");
    }
  }

  // دالة لإيقاف الراديو
  Future<void> _stopRadio() async {
    try {
      // إيقاف تشغيل الصوت
      await _audioPlayer.stop();
    } catch (e) {
      print("Error stopping radio: $e");
    }
  }

  // دالة لزيادة مستوى الصوت
  void _increaseVolume() {
    setState(() {
      // زيادة مستوى الصوت وضمان بقائه ضمن النطاق (0.0 - 1.0)
      _volume = (_volume + 0.1).clamp(0.0, 1.0);
      // تعيين مستوى الصوت الجديد
      _audioPlayer.setVolume(_volume);
    });
  }

  // دالة لتقليل مستوى الصوت
  void _decreaseVolume() {
    setState(() {
      // تقليل مستوى الصوت وضمان بقائه ضمن النطاق (0.0 - 1.0)
      _volume = (_volume - 0.1).clamp(0.0, 1.0);
      // تعيين مستوى الصوت الجديد
      _audioPlayer.setVolume(_volume);
    });
  }

  @override
  void dispose() {
    // تنظيف الموارد عند إغلاق الودجيت
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // صورة للراديو
          Container(
            margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.19, 0, MediaQuery.of(context).size.height * 0.03),
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: Image.asset(
              'assets/images/radio_image.png',
              alignment: Alignment.center,
            ),
            color: Colors.transparent,
          ),
          // نص العنوان
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // زر لتشغيل الراديو
                ElevatedButton(
                  onPressed: _playRadio,
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.lightPrimary),
                  child: Text('تشغيل الراديو', style: Theme.of(context).textTheme.titleLarge,),
                ),
                SizedBox(height: 20),
                // زر لإيقاف الراديو
                ElevatedButton(
                  onPressed: _stopRadio,
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.lightPrimary),
                  child: Text('إيقاف الراديو', style: Theme.of(context).textTheme.titleLarge,),
                ),
                SizedBox(height: 20),
                // عناصر التحكم في مستوى الصوت
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.volume_down),
                      onPressed: _decreaseVolume,
                    ),
                    Text(
                      (_volume * 100).toStringAsFixed(0) + '%', // عرض نسبة الصوت كنسبة مئوية
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      icon: Icon(Icons.volume_up),
                      onPressed: _increaseVolume,
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
