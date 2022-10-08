// To parse this JSON data, do
//
//     final dbLocation = dbLocationFromJson(jsonString);

import 'dart:convert';

DbLocation dbLocationFromJson(String str) => DbLocation.fromJson(json.decode(str));

String dbLocationToJson(DbLocation data) => json.encode(data.toJson());

class DbLocation {
    DbLocation({
        this.error,
        this.data,
    });

    bool? error;
    List<DdlocationDatum>? data;

    factory DbLocation.fromJson(Map<String, dynamic> json) => DbLocation(
        error: json["error"],
        data: List<DdlocationDatum>.from(json["data"].map((x) => DdlocationDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DdlocationDatum {
    DdlocationDatum({
        this.name,
    });

    String? name;

    factory DdlocationDatum.fromJson(Map<String, dynamic> json) => DdlocationDatum(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
