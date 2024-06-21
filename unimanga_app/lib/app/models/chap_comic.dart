class ChapComicModel {
  final String? id;
  final String? tenChuong;
  final String? loaiChuong;
  final String? thoiGianCapNhat;
  final List<CommentChapComic>? comment;
  final List<ImageChap>? imageChap;

  ChapComicModel({
    this.id,
    this.tenChuong,
    this.loaiChuong,
    this.thoiGianCapNhat,
    this.comment,
    this.imageChap,
  });

  factory ChapComicModel.fromJson(Map<Object?, Object?> json) {
    return ChapComicModel(
      id: json["Id"] as String?,
      tenChuong: json["TenChuong"] as String?,
      loaiChuong: json["LoaiChuong"] as String?,
      thoiGianCapNhat: json["ThoiGianCapNhat"] as String?,
      comment: (json["BinhLuan"] as List?)
          ?.map((e) => CommentChapComic.fromJson(e as Map<Object?, Object?>))
          .toList() ?? [], 
      imageChap: (json["AnhTruyen"] as List?)
          ?.map((e) => ImageChap.fromJson(e as Map<Object?, Object?>))
          .toList() ?? [], 
    );
  }

  Map<String, dynamic> toMap() {
    var imageChapMap = imageChap?.map((item) => item.toMap()).toList();
    var commentMap = comment?.map((item) => item.toMap()).toList();
    return {
      "Id": id,
      "TenChuong": tenChuong,
      "LoaiChuong": loaiChuong,
      "ThoiGianCapNhat": thoiGianCapNhat,
      "AnhTruyen": imageChapMap,
      "BinhLuan": commentMap,
    };
  }
}

class ImageChap {
  final String? id;
  final String? url;

  ImageChap({this.id, this.url});

  factory ImageChap.fromJson(Map<Object?, Object?> json) {
    return ImageChap(
      id: json["Id"] as String?,
      url: json["Url"] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "Url": url,
    };
  }
}

class CommentChapComic {
  final String? id;
  String? hinhNen;
  final String? bietHieu;
  final String? idNguoiDung;
  final String? tenNguoiDung;
  final String? thoiGian;
  final String? ngay;
  final String? content;

  CommentChapComic({
    required this.id,
    this.hinhNen,
    required this.idNguoiDung,
    required this.ngay,
    required this.tenNguoiDung,
    required this.thoiGian,
    required this.content,
    required this.bietHieu,
  });

  factory CommentChapComic.fromJson(Map<Object?, Object?> json) {
    return CommentChapComic(
      id: json['Id'] as String?,
      hinhNen: json['HinhNen'] as String? ,
      idNguoiDung: json['IdNguoiDung'] as String?,
      ngay: json['Ngay'] as String?,
      tenNguoiDung: json['TenNguoiDung'] as String?,
      thoiGian: json['ThoiGian'] as String?,
      content: json['NoiDung'] as String?,
      bietHieu: json['BietHieu'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'HinhNen': hinhNen,
      'IdNguoiDung': idNguoiDung,
      'Ngay': ngay,
      'TenNguoiDung': tenNguoiDung,
      'ThoiGian': thoiGian,
      'NoiDung': content,
      'BietHieu': bietHieu,
    };
  }
}
