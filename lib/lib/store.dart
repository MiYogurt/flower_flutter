import 'package:json_annotation/json_annotation.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux/redux.dart';
import 'actions.dart';
import 'package:flower_shop/model/goods.dart';

part 'store.g.dart';

@JsonSerializable()
class AppState {
  final List<Goods> shopCart;
  AppState({
    this.shopCart = const []
  });

  List<Goods> copydShopCart(){
    return this.shopCart.map((v) => v.copy()).toList();
  }

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  static AppState fromLoad(dynamic json) => _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}

var initShopCart = [
  Goods(count: 1, imgUrl: "https://img01.hua.com/uploadpic/newpic/9012334.jpg_220x240.jpg", name: "红火玫瑰", price: 90, type: "红色"),
  Goods(count: 1, imgUrl: "https://img01.hua.com/uploadpic/newpic/9010964.jpg_220x240.jpg", name: "家庭美满", price: 90, type: "紫色"),
  Goods(count: 1, imgUrl: "https://img01.hua.com/uploadpic/newpic/9012092.jpg_220x240.jpg", name: "火红爱恋", price: 90, type: "粉色"),
];

var state = AppState();

final persistor = Persistor<AppState>(
  storage: FlutterStorage(), // Or use other engines
  serializer: JsonSerializer<AppState>(AppState.fromLoad),
);


AppState addGoodsReducer (AppState state, AddAction action){
  var shopCart = state.copydShopCart();
  shopCart.add(action.goods);
  var newState = AppState(
    shopCart: shopCart,
  );
  return newState;
}

Reducer<AppState> otherGoodsReducer = (AppState state, action) {
  var shopCart = state.copydShopCart();
  if(action is RemoveAction){
    shopCart.removeAt(action.index);
    return AppState(shopCart: shopCart);;
  } else if(action is AddCountAction) {
    var goods = shopCart[action.index];
    goods.count += 1;
    return AppState(shopCart: shopCart);;
  }else if(action is RemoveCountAction) {
    var goods = shopCart[action.index];
    goods.count -= 1;
    if(goods.count <= 0) shopCart.removeAt(action.index);
    return AppState(shopCart: shopCart);;
  } else if(action is ToogleGoodsCheckeAction){
    var goods = shopCart[action.index];
    goods.checked = action.value;
    return AppState(shopCart: shopCart);;
  } else if (action is InitState) {
    return new AppState(shopCart: action.goods.sublist(0));
  }
  return state;
};

Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, AddAction>(addGoodsReducer),
  otherGoodsReducer
]);

var store = Store(appReducer, initialState: AppState() ,middleware: [asyncActionMiddleware, persistor.createMiddleware()]);

void initState() async {
  AppState initState = await persistor.load();
  if(initState != null){
    store.dispatch(InitState(initState.shopCart));
  }
}

typedef AsyncAction = Future<Null> Function(Store<AppState> store);
typedef AsyncActionHandler = AsyncAction Function();

// store.dispatch(fetchData(url: "xxx"));
AsyncActionHandler fetchData = ({url = "xxxx"}) => (store) async {
  await Future.delayed(Duration(seconds: 1));
  // init Data
  store.dispatch(InitState(initShopCart));
};

Middleware<AppState> asyncActionMiddleware = (
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
) {
  if(action is AsyncAction) {
    action(store);
  }
  next(action);
};
