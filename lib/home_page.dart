import 'package:book_apps/detail_page.dart';
import 'package:book_apps/models/book.dart';
import 'package:book_apps/models/menu_item.dart';
import 'package:flutter/material.dart';

import 'models/view_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGridview = false;

  PopupMenuItem<ViewType> buildItem(ViewType type) =>
      PopupMenuItem<ViewType>(child: Text(type.title), value: type);

  void onSelected(ViewType type) {
    switch (type) {
      case MenuItem.listView:
        setState(() {
          isGridview = false;
        });
        break;
      case MenuItem.gridView:
        setState(() {
          isGridview = true;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    ListView buildListView() {
      return ListView.builder(
        itemCount: listBook.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var book = listBook[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            book: book,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        book.imageAsset,
                        width: 64,
                        height: 64,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text(book.categoryBook,
                              style: TextStyle(fontSize: 20))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    GridView buildGridView(int gridCount) {
      return GridView.count(
        crossAxisCount: gridCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(listBook.length, (index) {
          var book = listBook[index];
          return InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            book: book,
                          )))
            },
            child: Card(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 10),
                        child: Image.asset(
                          book.imageAsset,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            book.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            book.categoryBook,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          );
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "homePage",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          PopupMenuButton<ViewType>(
            itemBuilder: (context) =>
                [...MenuItem.items.map(buildItem).toList()],
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (type) => onSelected(type),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upgrade your skill \n Upgrade your life",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      "images/banner.png",
                      width: 100,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "BOOKS",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              LayoutBuilder(builder: (context, constrainst) {
                if (constrainst.maxWidth <= 600) {
                  return isGridview ? buildGridView(2) : buildListView();
                } else if (constrainst.maxWidth <= 1200) {
                  return buildGridView(4);
                } else {
                  return buildGridView(4);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
