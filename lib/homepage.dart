import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WebViewController _controller;
  _cangoback()async{
    if(await _controller.canGoBack()){
      await _controller.goBack();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TPI Thakurgaon"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(onPressed:(){
          _cangoback();
        } , icon: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,)),

      ),
      body: SafeArea(
          child:WebView(
            initialUrl: 'https://www.google.com/',
            javascriptMode:JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller){
              _controller=webviewcontroller;
            },
          ) ),
    );
  }
}
