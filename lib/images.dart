import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        body: listViewBuilder);
  }

  static List<String> listViewItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 23',
  ];

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
