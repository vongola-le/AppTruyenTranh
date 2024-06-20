class RateComic {
  final String? hinhNen;
  final String? id;
  final String? idUser;
  final String? day;
  final String? time;
  final String? starRate;
  final String? userName;
  final String? content;
  RateComic({
    required this.id,
    required this.idUser,
    required this.day,
    required this.time,
    required this.starRate,
    required this.content,
    required this.hinhNen,
    required this.userName
  });
  factory RateComic.fromJson(Map<Object?, Object?> json) {
    return RateComic(
      id: json["Id"] as String ,
      hinhNen: json["HinhNen"] as String,
      idUser: json["IdNguoiDung"] as String,
      day: json["Ngay"] as String,
      time: json["ThoiGian"] as String,
      starRate: json["SoSao"] as String,
      content: json["NoiDung"] as String,
      userName: json["TenNguoiDung"] as String
    );
  }
  Map<String, dynamic> toMap(){
  return {
    'Id': id,
    'HinhNen': hinhNen,
    'IdNguoiDung': idUser,
    'Ngay': day,
    'ThoiGian': time,
    'SoSao': starRate,
    'NoiDung': content,
    'TenNguoiDung': userName,
  };
}

}