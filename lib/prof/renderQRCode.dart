import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';

class RenderQRCode extends StatelessWidget {
  final String dept;
  final String course;
  final String section;
  final String profName;

  RenderQRCode(this.dept, this.course, this.section, this.profName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dept + '.' + course + '.' + section), centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            QrImage(
              data: dept + '.' + course + '.' + section + ', ' + profName,
              version: QrVersions.auto,
              size: 250.0,
            ),
          ],
        ),
      ),
    );
  }
}
