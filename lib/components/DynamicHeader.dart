import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/components/header.dart';
import 'package:login_app/models/picture.dart';
import 'package:login_app/pages/TakePic.dart';
import 'package:provider/provider.dart';

class DynamicHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double h = MediaQuery.of(context).size.height,
        w = MediaQuery.of(context).size.width;
    print(shrinkOffset.toString());
    return SizedBox.expand(
        child: SafeArea(
            top: false,
            bottom: true,
            child: Stack(
              children: [
                AnimatedContainer(
                    duration: Duration(seconds: 1),
                    color: Colors.blue,
                    child: Center(
                      child: Center(
                        child: Opacity(
                          child: Stack(
                            children: [
                              Consumer<Picture>(
                                builder: (context, picture, child) {
                                  return picture.picName != null
                                      ? CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.transparent,
                                          radius: 80,
                                          child: ClipOval(
                                            child: Image.file(
                                              picture.picName,
                                              fit: BoxFit.cover,
                                              height: 175,
                                              width: 175,
                                            ),
                                          ),
                                        )
                                      : Header();
                                },
                              ),
                              Positioned(
                                child: TakePicScreen(Colors.white70),
                                bottom: 0,
                                right: 0,
                              )
                            ],
                          ),
                          opacity: (1 - (shrinkOffset / maxExtent)),
                        ),
                      ),
                    )),
              ],
            )));
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
