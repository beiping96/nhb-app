// Copyright 2019 <chaishushan{AT}gmail.com>. All rights reserved.
// Use of this source code is governed by a GPL-style
// license that can be found in the LICENSE file.

import 'package:flutter_web/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '光谷码农',
      home: Scaffold(
        appBar: AppBar(title: Text('光谷码农')),
        body: Column(
            children: <Widget>[
              Image.network('https://guanggu-coder.cn/weixin-guanggu-coder-logo.png'),
              Text('chai2010')
            ],
          ),
      ),
    );
  }
}
