import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../core/utils/utils.dart';

class QRView extends StatelessWidget {
  const QRView({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImage(
        data: "+84703322051",
        version: QrVersions.auto,
        padding: Utils.paddingAll(context, padding: 2),
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColorDark,
        size: size,
      ),
    );
  }
}
