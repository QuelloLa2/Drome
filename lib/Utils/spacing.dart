import 'package:flutter/widgets.dart';

SizedBox dosomespace(double size, BuildContext context) {
  return SizedBox(height: MediaQuery.of(context).size.height / size);
}
