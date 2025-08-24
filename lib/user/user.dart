import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';


class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDEDED),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.menu,size: 50,color: Color(0xff444444),),
                  onPressed: (){},
                ),
                actions: [IconButton(
                  icon: Icon(Icons.notifications,size: 50,color: Color(0xff444444),),
                  onPressed: (){},
                )],
                          ),
              ),
        body: ListView(
              children: [
                TimerBuilder.periodic(
                  const Duration(seconds: 1),
                  builder: (context) {
                    return Text(
                      DateFormat('MM월 dd일 EEEE','ko').format(DateTime.now()), style: TextStyle(color: Color(0xff444444), fontSize: 38,fontWeight: FontWeight.bold),
                      );
                    },
                ),
                TimerBuilder.periodic(
                  const Duration(seconds: 1),
                  builder: (context) {
                    return Text(
                      DateFormat('a hh시 mm분','ko').format(DateTime.now()), style: TextStyle(color: Color(0xff444444), fontSize: 38, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 20,
                ),
                Text("오늘의 일정", style: TextStyle(color: Colors.black, fontSize: 38, fontWeight: FontWeight.bold)),
                TaskBlock(title: "일정 이름", time: "오전 00시 00분", isDone: true)
              ]
            ),
      );
  }
}

class TaskBlock extends StatelessWidget {
  final String title;
  final String time;
  final bool isDone;
  final VoidCallback? onTap; // 클릭 시 실행할 함수

  const TaskBlock({
    super.key,
    required this.title,
    required this.time,
    required this.isDone,
    this.onTap, // optional
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/alarm');
      }, // 전체 클릭 가능
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAF8),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left color bar
            Container(
              width: 8,
              decoration: BoxDecoration(
                color: isDone ? const Color(0xFF67CC6D) : const Color(0xFFE65E5E),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),

            // Content area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF717171),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Done status
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                isDone ? "완료" : "미완료",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
