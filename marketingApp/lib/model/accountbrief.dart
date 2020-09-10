import 'package:flutter/services.dart';

class AccountBreif {
  final String name;
  final String industry;
  final String marketLocation;
  final String cAnalysis;
  final String company;
  final String companySell;
  final String varyFromCompetitors;
  final String competitiveAdvantage;
  final String uniqueBrand;
  final String businessBetter;
  final String id;

  AccountBreif(
      {this.name,
      this.industry,
      this.marketLocation,
      this.cAnalysis,
      this.company,
      this.companySell,
      this.varyFromCompetitors,
      this.competitiveAdvantage,
      this.uniqueBrand,
      this.businessBetter,
      this.id});

  AccountBreif.fromMap(Map<String, dynamic> data, String id)
      : name = data["name"],
        industry = data['industry'],
        marketLocation = data['marketLocation'],
        cAnalysis = data['cAnalysis'],
        company = data['company'],
        companySell = data['companySell'],
        varyFromCompetitors = data['varyFromCompetitors'],
        competitiveAdvantage = data['competitiveAdvantage'],
        uniqueBrand = data['uniqueBrand'],
        businessBetter = data['businessBetter'],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "industry": industry,
      "marketLocation": marketLocation,
      "cAnalysis": cAnalysis,
      "company ": company,
      "companySell": companySell,
      "varyFromCompetitors": varyFromCompetitors,
      "competitiveAdvantage": competitiveAdvantage,
      "uniqueBrand": 'uniqueBrand',
      "businessBetter": businessBetter,
    };
  }
}
