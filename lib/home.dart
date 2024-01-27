import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class HomeScreen  extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}
  class _HomeScreen extends State<HomeScreen> {
      final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
                Positioned.fill(
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: size.height * 0.88,
              child: Container(
                child: Center(child: Text("Welcome",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
                decoration: BoxDecoration(
                  color: Color(0xff3C3F7E),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(size.width * 0.1),
                    bottomRight: Radius.circular(size.width * 0.1),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.15,
              left: 16.0,
              right: 16.0,
              child: Container(
                padding: EdgeInsets.all(26.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Alawi School',),
                        Icon(Icons.school_rounded),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton.icon(onPressed: (){_playSound1();}, icon: Icon(Icons.family_restroom_rounded), label: Text("Parent"))
                 
                  ],
                ),
              ),
            ),
             Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                _playSound2();
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        
        ),
      ),
    );
  }
    void _playSound1() async {
    await _audioPlayer.play(AssetSource('ho.mp3')); 
  }
   void _playSound2() async {
    await _audioPlayer.play(AssetSource('cat.mp3')); 
  }
}
