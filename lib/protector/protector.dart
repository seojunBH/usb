import 'package:flutter/material.dart';


class protector extends StatefulWidget {
  const protector({super.key});

  @override
  State<protector> createState() => _protectorState();
}

class _protectorState extends State<protector> {


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
            Text("오늘의 일정", style: TextStyle(color: Colors.black, fontSize: 38, fontWeight: FontWeight.bold)),
            TaskBlock(title: "일정 이름", time: "오전 00시 00분", isDone: true)
          ]
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffFAFAF8),
        height: 80,
        child: Row(
          children: [
            Expanded(child: SizedBox(height: 80,)),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.home,size: 35,color: Colors.black,),padding: EdgeInsets.zero,),
                Text("홈",style: TextStyle(height: 0.5),)
              ],
            ),
            Expanded(child: SizedBox(height: 80,)),
            Column(
              children: [
                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '/schedule');
                }, icon: Icon(Icons.alarm_add,size: 35,color: Color(0xff999999),),padding: EdgeInsets.zero,),
                Text("일정추가",style: TextStyle(height: 0.5),)
              ],
            ),
            Expanded(child: SizedBox(height: 80,)),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.nfc,size: 35,color: Color(0xff999999),),padding: EdgeInsets.zero,),
                Text("NFC추가",style: TextStyle(height: 0.5),)
              ],
            ),
            Expanded(child: SizedBox(height: 80,)),
          ],
        ),
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
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAF8),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left color bar
            Container(
              width: 30,
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
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 20,
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
                  fontSize: 25,
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
