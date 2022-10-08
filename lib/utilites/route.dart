import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

newpage(Widget pagename, BuildContext context) {
  Navigator.push(context, CupertinoPageRoute(builder: ((context) => pagename)));
}
