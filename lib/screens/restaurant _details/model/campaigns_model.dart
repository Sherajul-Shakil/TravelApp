
import 'dart:convert';

CampaignsModel campaignsModelFromJson(String str) => CampaignsModel.fromJson(json.decode(str));

String campaignsModelToJson(CampaignsModel data) => json.encode(data.toJson());

class CampaignsModel {
  CampaignsModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory CampaignsModel.fromJson(Map<String, dynamic> json) => CampaignsModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.ongoingCampaigns,
    this.upgoingCampaigns,
  });

  List<OngoingCampaign> ?ongoingCampaigns;
  List<dynamic> ?upgoingCampaigns;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ongoingCampaigns: List<OngoingCampaign>.from(json["ongoing_campaigns"].map((x) => OngoingCampaign.fromJson(x))),
    upgoingCampaigns: List<dynamic>.from(json["upgoing_campaigns"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ongoing_campaigns": List<dynamic>.from(ongoingCampaigns!.map((x) => x.toJson())),
    "upgoing_campaigns": List<dynamic>.from(upgoingCampaigns!.map((x) => x)),
  };
}

class OngoingCampaign {
  OngoingCampaign({
    this.id,
    this.title,
    this.bannerPhoto,
    this.campaignDescription,
    this.campaignStartDate,
    this.campaignEndDate,
  });

  int? id;
  String? title;
  String? bannerPhoto;
  String? campaignDescription;
  String? campaignStartDate;
  String? campaignEndDate;

  factory OngoingCampaign.fromJson(Map<String, dynamic> json) => OngoingCampaign(
    id: json["id"],
    title: json["title"],
    bannerPhoto: json["banner_photo"],
    campaignDescription: json["campaign_description"],
    campaignStartDate: json["campaign_start_date"],
    campaignEndDate: json["campaign_end_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "banner_photo": bannerPhoto,
    "campaign_description": campaignDescription,
    "campaign_start_date": campaignStartDate,
    "campaign_end_date": campaignEndDate,
  };
}
