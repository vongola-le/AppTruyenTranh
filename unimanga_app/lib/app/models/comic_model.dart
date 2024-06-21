import 'package:unimanga_app/app/models/category_comic_model.dart';
import 'package:unimanga_app/app/models/rate_comic.dart';

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
  final String? gioiThieu;
  final List<categoryComicModel>? theLoai;
  final List<ChapComicModel>? chapComicModel;
  final List<RateComic>? rateComic;
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
  this.chapComicModel,
  this.rateComic,
  this.theLoai,
  this.gioiThieu
  });
  factory ComicModel.fromJson(Map<Object?, Object?> json) {
    return ComicModel(
      id: json["Id"] as String,//
      anhTruyen: json["AnhTruyen"] as String ,//
      anhBiaTruyen: json["AnhBiaTruyen"] as String,//
      tacGia: json["TacGia"] as String,//
      tinhTrang: json["TinhTrang"] as String,//
      luotTheoDoi: json["LuotTheoDoi"] as String,//
      luotDanhGia: json["LuotDanhGia"] as String,//
      diemDanhGia: json["DiemDanhGia"] as String,//
      ten: json["Ten"]as String,//
      luotXem: json["LuotXem"] as String,//
      soChuong: json["SoChuong"] as String,//
      gioiThieu: json["GioiThieu"] as String,
      chapComicModel: (json["ChuongTruyen"] as List).map((item) => ChapComicModel.fromJson(item)).toList() ,
      rateComic: (json["DanhGiaTruyen"] as List).map((e) => RateComic.fromJson(e)).toList(),//
      theLoai: (json["TheLoai"] as List).map((e) => categoryComicModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toMap(){
    var chapComicModelMap = chapComicModel!.map((item) => item.toMap()).toList();
    var comicRate = chapComicModel!.map((item) => item.toMap()).toList();
    return {
      "Id": id,
      "AnhTruyen": anhTruyen,
      "AnhBiaTruyen": anhBiaTruyen,
      "TacGia": tacGia,
      "TinhTrang": tinhTrang,
      "LuotTheoDoi": luotTheoDoi,
      "LuotDanhGia": luotDanhGia,
      "DiemDanhGia": diemDanhGia,
      "Ten": ten,
      "LuotXem": luotXem,
      "SoChuong": soChuong,
      "ChuongTruyen": chapComicModelMap,
      "DanhGiaTruyen": comicRate,
      "GioiThieu": gioiThieu
    };
  }
}