import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Review_Controller>(
        builder: (context, _read, child) {
          if (_read.imgList.isEmpty) {
            return const SizedBox();
          }
          return Container(
              height: 110,
              padding: const EdgeInsets.only(top: 39, left: 20, right: 20),
              child: GridView.builder(
                itemCount: _read.imgList.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 4 / 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return customItem(index);
                },
              ));
        });
  }

  Widget customItem(int index) {
    var img = _read.imgList[index];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.black,
          image: DecorationImage(
            image: FileImage(img),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Positioned(
            left: 37,
            bottom: 37,
            child: IconButton(
              icon: const Icon(
                Icons.highlight_remove,
                color: Color(0xffFFFFFF),
              ),
              onPressed: () {
                  _read.delete(index);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.image_outlined, color: Colors.white70),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
