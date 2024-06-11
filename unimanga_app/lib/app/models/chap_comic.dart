

class ChapComicModel{
  final String? id;
  final String? tenChuong;
  final String? loaiChuong;
  final String? thoiGianCapNhat;
  final List<ImageChap>? imageChap;
  ChapComicModel({
    this.id,
    this.tenChuong,
    this.loaiChuong,
    this.thoiGianCapNhat,
    this.imageChap,
  });
  factory ChapComicModel.fromJson(Map<String, dynamic> json) {
    var list = json['imageChap'] as List;
    List<ImageChap> imageChapList = list.map((i) => ImageChap.fromJson(i)).toList();

    return ChapComicModel(
      id: json["id"],
      tenChuong: json["tenChuong"],
      loaiChuong: json["loaiChuong"],
      thoiGianCapNhat: json["thoiGianCapNhat"],
      imageChap: imageChapList,
    );
  }
  Map<String, dynamic> toMap(){
    var imageChapMap = imageChap!.map((item) => item.toMap()).toList();

    return {
      "id": id,
      "tenChuong": tenChuong,
      "loaiChuong": loaiChuong,
      "thoiGianCapNhat": thoiGianCapNhat,
      "imageChap": imageChapMap,
    };
  }
}

class ImageChap{
  final String? id;
  final String? url;
  ImageChap({
    this.id,
    this.url
  });
  factory ImageChap.fromJson(Map<String, dynamic> json) {
    return ImageChap(
      id: json["id"],
      url: json["url"],
    );
  }
  Map<String, dynamic> toMap(){
    return {
    "id": id,
    "url": url,
    };
  }
}