part of layout;


var drawer = (ctx) => Drawer(
  child: Flex(
    direction: Axis.horizontal,
    children: <Widget>[
      FlatButton(
        child: Text("user"),
        onPressed: (){
          Navigator.of(ctx).pushNamed("/user");
        },
      )
    ],
  ),
);