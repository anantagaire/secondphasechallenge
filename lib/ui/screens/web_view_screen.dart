import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSCreen extends StatefulWidget {
  final String url;
  WebViewSCreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewSCreenState createState() => _WebViewSCreenState();
}

class _WebViewSCreenState extends State<WebViewSCreen> {
  bool isLoading = true ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (value){
                setState(() {
                  isLoading=true;
                });
              },
              onPageFinished: (value)
              {
                setState(() {
                  isLoading = false;
                });
              },
            ),
          ),
          isLoading?Align(
            alignment: Alignment.bottomCenter,
            child:LinearProgressIndicator(minHeight: 5, color: Colors.red,)):SizedBox(),
          
        ],
      ),
    );
  }
}
