import 'package:flutter/material.dart';

class Alarm extends StatelessWidget {
  const Alarm({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDEDED),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("일정 이름", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              const Text("00시 00분", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로 가운데 정렬
                children: const [
                  Text("NFC이름", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text("에 가서 일정을 수행하세요.", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                ],
              ),
              const SizedBox(height: 265),
              SizedBox(
                width: 180, height: 90,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff67CC6D),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: const Text("닫기", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}