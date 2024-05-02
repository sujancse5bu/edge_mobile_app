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
          title: Text("appbar"),
        ),
        body: SingleChildScrollView(
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
                  onPressed: () => {print("IconButton")},
                  icon: Icon(Icons.menu)),

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
        ));
  }
}
