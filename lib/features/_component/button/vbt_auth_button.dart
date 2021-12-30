import 'package:flutter/material.dart';
import 'package:samplesibra/core/component/button/ibrahim_button.dart';

class VBTAuth extends StatefulWidget {
  final Function(String token) onPressAuth;

  const VBTAuth({Key key, this.onPressAuth}) : super(key: key);
  @override
  _VBTAuthState createState() => _VBTAuthState();
}

class _VBTAuthState extends State<VBTAuth> {
  VBT data;

  @override
  void initState() {
    super.initState();
    data = VBT();
    data.token = "ass";
  }

  @override
  Widget build(BuildContext context) {
    return IbrahimButton(
      title: data.token.length > 5 ? "Login" : "Not Auth",
      onPressed: () {
        if (data.token.length < 5) {
          setState(() {
            data.token = "ASdasdasdasdas";
          });
        } else {
          widget.onPressAuth(data.token);
        }
      },
    );
  }
}

class VBT {
  String token;
}
