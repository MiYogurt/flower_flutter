import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String ShopCartIcon = "assets/svg/gouwuche.svg";
final String UserIcon = "assets/svg/wode.svg";
final String SearchIcon = "assets/svg/search.svg";

class Banners extends StatelessWidget {
  VoidCallback toShopCart;
  VoidCallback toSearch;
  VoidCallback toUser;
  Banners(this.toShopCart, this.toSearch, this.toUser);

  Widget searchBar(){
    return Expanded(
          child:GestureDetector(
            onTap: toSearch,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  borderRadius: BorderRadius.all( Radius.circular(4.0))
              ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(SearchIcon, width: 24,),
                  Text(" 搜 索")
                ],
              ),
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: toShopCart,
            child: SvgPicture.asset(ShopCartIcon, width: 24),
          ),
          searchBar(),
          GestureDetector(
            onTap: toUser,
            child: SvgPicture.asset(UserIcon, width: 24),
          ),
        ],
      ),
    );


  }
}