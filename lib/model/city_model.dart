class CityModel {
  List<KotaKabupaten>? kotaKabupaten;

  CityModel({this.kotaKabupaten});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['kota_kabupaten'] != null) {
      kotaKabupaten = <KotaKabupaten>[];
      json['kota_kabupaten'].forEach((v) {
        kotaKabupaten!.add(new KotaKabupaten.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kotaKabupaten != null) {
      data['kota_kabupaten'] =
          this.kotaKabupaten!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KotaKabupaten {
  int? id;
  String? idProvinsi;
  String? nama;

  KotaKabupaten({this.id, this.idProvinsi, this.nama});

  KotaKabupaten.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProvinsi = json['id_provinsi'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_provinsi'] = this.idProvinsi;
    data['nama'] = this.nama;
    return data;
  }
}
