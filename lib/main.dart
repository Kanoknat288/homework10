import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaNewomi',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/newprofile.jpg', img: 'assets/images/newpost.jpg',
        userpost: 'Newomi', comments: [Comments(user: 'Mewcwalk', comment: "ข้างหลังน่ารักมาก😍"),Comments(user: 'PloyploY', comment: 'So คิ้วทึมากฮะ')],
        caption: "เรากับต้นไม้อะไรสวยกว่ากัน💚💚💚💚"),
    Insta(imguser: 'assets/images/nackprofile.jpg', img: 'assets/images/nackpost.jpg',
        userpost: 'Nack_Chalee',comments: [Comments(user: 'Newomi', comment: 'พี่เป็นเพื่อนกันหรอคะ'),Comments(user: 'Ningnong', comment: 'I Love you พี่แน๊ค💚💚💚')],
        caption: 'นอนคุยกับ บุญช่วย เพื่อนร้ากกกกกก \nI💚YOU \n#NackChalee \n#แฟนฉัน'),
    Insta(imguser: 'assets/images/hannahprofile.jpg', img: 'assets/images/hannah.jpg',
        userpost: 'Hannah_4eve',comments: [Comments(user: 'Dewdo', comment: 'ผมชอบพี่แฮนน่ามากครับ'),Comments(user: 'Ningnong', comment: 'น่ารักที่สุด❤❤')],
        caption: 'Jub Jub😘 \nI💚YOU \n#Hannah \n#4eve'),


  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(title: Text('InstaNewomi',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.insta.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.insta.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.pink,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}
