import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unimanga_app/app/constants/index.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.demonslayder),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 110.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Image(
                            image:
                                AssetImage(AppImages.bannerAdvDasboard),
                          ),
                          radius: 30.0,
                        ),
                        title: Text(
                          "Lê Hoàng Đệ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(
                          "Luyện khí tầng 7",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: [
                      Text("Cài đặt"),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(color: Colors.black),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print("You pressed Icon Elevated Button 1");
                        },
                        icon: Icon(Icons.save),
                        label: Text("Elevated Button 1"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    SizedBox(width: 1.0), // Khoảng cách giữa các nút
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print("You pressed Icon Elevated Button 2");
                        },
                        icon: Icon(Icons.add), //icon data for elevated button
                        label: Text("Elevated Button 2"), //label text
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .blueAccent, //elevated btton background color
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.zero, // Đặt bo góc bằng 0
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
