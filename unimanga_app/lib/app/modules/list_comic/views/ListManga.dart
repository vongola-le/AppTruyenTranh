import 'package:flutter/material.dart';
import 'package:unimanga_app/app/models/comic_model.dart';

import '../../../global_widgets/Filter.dart';
import '../../../global_widgets/item_manga.dart';
import '../../../models/chap_comic.dart';

class ListManga extends StatefulWidget {
  const ListManga({super.key});

  @override
  State<ListManga> createState() => _ListMangaState();
}

class _ListMangaState extends State<ListManga> {
  List<ComicModel> lstManga = [
   ComicModel(
  id: '1234567890',
  anhTruyen: 'https://example.com/comic-cover.jpg',
  anhBiaTruyen: 'https://example.com/comic-banner.jpg',
  tacGia: 'Jane Doe',
  tinhTrang: 'Ongoing',
  luotTheoDoi: '50000',
  luotDanhGia: '10000',
  diemDanhGia: '4.8',
  ten: 'The Adventures of Super Hero',
  luotXem: '500000',
  soChuong: '100',
  chapComicModel: [
    ChapComicModel(
      id: '1',
      tenChuong: 'Chapter 1',
      loaiChuong: 'Free',
      thoiGianCapNhat: '2023-06-01',
      imageChap: [
        ImageChap(
          id: '1',
          url: 'https://example.com/chapter1-page1.jpg'
        ),
        ImageChap(
          id: '2',
          url: 'https://example.com/chapter1-page2.jpg'
        ),
        ImageChap(
          id: '3',
          url: 'https://example.com/chapter1-page3.jpg'
        )
      ]
    ),
    ChapComicModel(
      id: '2',
      tenChuong: 'Chapter 2',
      loaiChuong: 'Premium',
      thoiGianCapNhat: '2023-06-15',
      imageChap: [
        ImageChap(
          id: '1',
          url: 'https://example.com/chapter2-page1.jpg'
        ),
        ImageChap(
          id: '2',
          url: 'https://example.com/chapter2-page2.jpg'
        ),
        ImageChap(
          id: '3',
          url: 'https://example.com/chapter2-page3.jpg'
        )
      ]
    )
  ]
),
  ];
  void _openIconButtonPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => FilterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Danh sách truyện tranh",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Thể loại: '),
                    const Text('Trạng thái: '),
                  ],
                )),
                IconButton(
                    onPressed: _openIconButtonPressed,
                    icon: Icon(Icons.filter_list))
              ],
            ),
          ),
          Expanded(
            child: lstManga.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Hiện chưa có truyện nào!",
                      style: TextStyle(fontSize: 25),
                    ))
                : ListView.separated(
                    itemCount: 10, // Change this to 10
                    separatorBuilder: (context, index) => SizedBox(height: 1),
                    itemBuilder: (context, index) {
                      return ItemManga(
                        manga: lstManga[index % lstManga.length],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
