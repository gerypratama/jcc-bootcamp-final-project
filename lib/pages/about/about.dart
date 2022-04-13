import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF44B872),
        title: Text('About This App'),
      ),
      body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 1),
              () => rootBundle.loadString('assets/ABOUT.md')),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(data: snapshot.data!);
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
