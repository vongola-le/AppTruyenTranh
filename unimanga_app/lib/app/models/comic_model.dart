import 'chap_comic.dart';
class ComicModel {
  final String? id;
  final String? anhTruyen;
  final String? anhBiaTruyen;
  final String? tacGia;
  final String? tinhTrang;
  final String? luotTheoDoi;
  final String? luotDanhGia;
  final String? diemDanhGia;
  final String? ten;
  final String? luotXem;
  final String? soChuong;
  final List<ChapComicModel>? chapComicModel;
  ComicModel({
  this.id,
  this.anhTruyen,
  this.anhBiaTruyen,
  this.tacGia,
  this.tinhTrang,
  this.luotTheoDoi,
  this.luotDanhGia,
  this.diemDanhGia,
  this.ten,
  this.luotXem,
  this.soChuong,
  this.chapComicModel
  });
  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json["id"],
      anhTruyen: json["anhTruyen"],
      anhBiaTruyen: json["anhBiaTruyen"],
      tacGia: json["tacGia"],
      tinhTrang: json["tinhTrang"],
      luotTheoDoi: json["luotTheoDoi"],
      luotDanhGia: json["luotDanhGia"],
      diemDanhGia: json["diemDanhGia"],
      ten: json["ten"],
      luotXem: json["luotXem"],
      soChuong: json["soChuong"],
      chapComicModel: (json["chuongTruyen"] as List).map((item) => ChapComicModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toMap(){
    var chapComicModelMap = chapComicModel!.map((item) => item.toMap()).toList();
    return {
      "id": id,
      "anhTruyen": anhTruyen,
      "anhBiaTruyen": anhBiaTruyen,
      "tacGia": tacGia,
      "tinhTrang": tinhTrang,
      "luotTheoDoi": luotTheoDoi,
      "luotDanhGia": luotDanhGia,
      "diemDanhGia": diemDanhGia,
      "ten": ten,
      "luotXem": luotXem,
      "soChuong": soChuong,
      "chapComicModel": chapComicModelMap,
    };
  }
}