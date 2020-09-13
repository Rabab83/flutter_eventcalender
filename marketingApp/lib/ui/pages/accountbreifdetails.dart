import 'package:flutter/material.dart';
import 'package:marketingApp/model/accountbrief.dart';

class AccountBreifDetailsPage extends StatelessWidget {
  final AccountBreif accountBreif;

  const AccountBreifDetailsPage({Key key, @required this.accountBreif})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              accountBreif.name,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.industry,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.marketLocation,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.cAnalysis,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.company,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.companySell,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.varyFromCompetitors,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.competitiveAdvantage,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.uniqueBrand,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              accountBreif.businessBetter,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}