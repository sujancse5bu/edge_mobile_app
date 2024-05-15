import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ImagesAndButton extends StatefulWidget {
  const ImagesAndButton({super.key});

  @override
  State<ImagesAndButton> createState() => _ImagesAndButtonState();
}

class _ImagesAndButtonState extends State<ImagesAndButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView & GridView"),
        ),
        body: gridViewBuilder);
  }

  static List<String> listViewItems = [
    'https://plus.unsplash.com/premium_photo-1678112180202-cd950dbe5a35?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1517404215738-15263e9f9178?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dXJsfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dXJsfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHVybHxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1683865776032-07bf70b0add1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHVybHxlbnwwfHwwfHx8MA%3D%3D',
  ];

  Widget gridViewBuilder = GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
    itemCount: listViewItems.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          // Text(listViewItems[index]),
          Image.network(listViewItems[index]),
          ElevatedButton(
              onPressed: () {
                handleLaunchURL(listViewItems[index]);
              },
              child: Text('Click Here'))
        ],
      );
    },
  );

  static Future<void> handleLaunchURL(String _url) async {
    Uri _uri = Uri.parse(_url);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_url');
    }
  }

  //https://picsum.photos/200/300
  Widget listViewBuilder = ListView.builder(
    itemCount: listViewItems.length,
    itemBuilder: (context, index) {
      return Container(
        child: Image.network('https://picsum.photos/200/100'),
      );
    },
  );

  Widget listView = ListView(
    padding: EdgeInsets.all(10),
    children: [
      Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 1'),
      ),
      Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 2'),
      ),
      Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 3'),
      ),
      Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 3'),
      ),
      Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 4'),
      ),
      Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 5'),
      ),
      Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 3'),
      ),
      Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 4'),
      ),
      Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text('Item 5'),
      ),
    ],
  );

  Widget singleChildScrollView = SingleChildScrollView(
    child: Column(
      children: [
        TextButton(
            onPressed: () => {print("onPress")},
            onLongPress: () => {print("OnLongPress")},
            child: Text("click")),
        ElevatedButton(
            onPressed: () => {print(("onPress"))},
            onLongPress: () => {print("OnlongPress")},
            child: Text("ElevatedButton")),
        IconButton(
            onPressed: () => {print("IconButton")}, icon: Icon(Icons.menu)),

        InkWell(
          onTap: () => print("InkWell"),
          splashColor: Colors.amber,
          highlightColor: Colors.red,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
              width: 3,
            )),
          ),
        ),

        GestureDetector(
          onTap: () => print("gesture detector clicked"),
          onDoubleTapDown: (details) =>
              print('dobule tap down details: $details'),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
              width: 3,
            )),
          ),
        ),

        // FadeInImage.assetNetwork(
        //     placeholder: 'assets/img1.jpg',
        //     image: 'https://picsum.photos/200/300'),

        // Image.network(
        //   'https://picsum.photos/200/300',
        //   width: 200,
        //   height: 200,
        // ),
        // Image(
        //   image: AssetImage('assets/img1.jpg'),
        //   width: 100,
        //   height: 100,
        // ),
        // Image.asset('assets/img1.jpg')
      ],
    ),
  );
}
