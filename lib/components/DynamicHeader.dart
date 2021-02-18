import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/components/header.dart';
import 'package:login_app/models/picture.dart';
import 'package:provider/provider.dart';

class DynamicHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    print(shrinkOffset.toString());
    return SizedBox.expand(
        child: Stack(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          color: Colors.blue,
          child: Center(
            child: Center(
              child: Opacity(
                child: Consumer<Picture>(
                  builder: (context, picture, child) {
                    return picture.picName != null
                        ? CircleAvatar(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.transparent,
                            radius: 60,
                            child: ClipOval(
                              child: Image.file(
                                picture.picName,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              ),
                            ),
                          )
                        : Header();
                  },
                ),
                opacity: (1 - (shrinkOffset / maxExtent)),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 250;

  @override
  // TODO: implement minExtent
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
