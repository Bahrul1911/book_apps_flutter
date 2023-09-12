import 'dart:ui';

import 'package:flutter/material.dart';

import 'models/book.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({Key? key,
    required this.book
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        title: Text("Detail", style: TextStyle(color: Colors.black)
        ),
        backgroundColor: Colors.white,
        elevation: 0
        ,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(book.imageAsset),
                  fit: BoxFit.cover
                )
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Center(child: Image.asset(book.imageAsset, width: 130,),),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  book.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(book.rate.toString(), textAlign: TextAlign.center,),
                    Text("Rating")
                  ],
                ),
                Column(
                  children: [
                    Text(book.page.toString(), textAlign: TextAlign.center,),
                    Text("Page")
                  ],
                ),
                Column(
                  children: [
                    Text(book.language, textAlign: TextAlign.center,),
                    Text("Language")
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(book.description, style: TextStyle(fontSize: 18),),
            )
          ],
        ),
      )
    );
  }
}
