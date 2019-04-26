import 'package:flutter/material.dart';

class AList extends StatelessWidget {
  final List<Widget> childrens;
  AList({this.childrens}): fromBuilderWidget = null;
  final Widget fromBuilderWidget;

  Widget get widget => CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(childrens),
            ),
          ),
        ],
      );

  AList.builder({IndexedWidgetBuilder itemBuilder, itemCount = 0})
      : childrens = null,
        fromBuilderWidget = CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(itemBuilder,
                    childCount: itemCount),
              ),
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return fromBuilderWidget ?? widget;
  }
}
