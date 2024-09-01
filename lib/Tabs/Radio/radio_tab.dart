import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:test1907/app_theme.dart'; // إضافة المكتبة لتشغيل الصوت
class RadioTab extends StatefulWidget {
  @override
  _RadioTabState createState() => _RadioTabState();
}
class _RadioTabState extends State<RadioTab> {
  late AudioPlayer _audioPlayer;
  double _volume = 1.0; // مستوى الصوت من 0.0 إلى 1.0
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }
  Future<void> _playRadio() async {
    try {
      await _audioPlayer.setUrl("https://qurango.net/radio/fares_abbad.mp3");
      _audioPlayer.setVolume(_volume); // تعيين مستوى الصوت
      _audioPlayer.play();
    } catch (e) {
      print("Error playing radio: $e");
    }
  }
  Future<void> _stopRadio() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      print("Error stopping radio: $e");
    }
  }

  void _increaseVolume() {
    setState(() {
      _volume = (_volume + 0.1).clamp(0.0, 1.0); // زيادة مستوى الصوت
      _audioPlayer.setVolume(_volume);
    });
  }

  void _decreaseVolume() {
    setState(() {
      _volume = (_volume - 0.1).clamp(0.0, 1.0); // تقليل مستوى الصوت
      _audioPlayer.setVolume(_volume);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                ElevatedButton(
                  onPressed: _playRadio,
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.lightPrimary),
                  child: Text('تشغيل الراديو',style: Theme.of(context).textTheme.titleLarge,),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _stopRadio,
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.lightPrimary),
                  child: Text('إيقاف الراديو',style: Theme.of(context).textTheme.titleLarge,),
                ),
                SizedBox(height: 20),
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
