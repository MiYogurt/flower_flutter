import 'package:redux/redux.dart';
import 'actions.dart';

class AppState {
  final List<Goods> shopCart;
  AppState({
    this.shopCart = const []
  });
}

var initShopCart = [
  Goods(count: 1, imgUrl: "https://img01.hua.com/uploadpic/newpic/9012334.jpg_220x240.jpg", name: "红火玫瑰", price: 90, type: "红色"),
  Goods(count: 1, imgUrl: "https://img01.hua.com/uploadpic/newpic/9010964.jpg_220x240.jpg", name: "家庭美满", price: 90, type: "紫色"),
  Goods(count: 1, imgUrl: "https://img01.hua.com/uploadpic/newpic/9012092.jpg_220x240.jpg", name: "火红爱恋", price: 90, type: "粉色"),
];

var state = AppState();

var addGoodsReducer = (AppState state, AddAction action){
  state.shopCart.add(action.goods);
  var newState = AppState(
    shopCart: state.shopCart.sublist(0)
  );
  return newState;
};

Reducer<AppState> otherGoodsReducer = (AppState state, action) {
  if(action is RemoveAction){
    state.shopCart.removeAt(action.index);
    return AppState(shopCart: state.shopCart);;
  } else if(action is AddCountAction) {
    var goods = state.shopCart[action.index];
    goods.count += 1;
    return AppState(shopCart: state.shopCart);;
  } else if (action is InitState) {
    return new AppState(shopCart: action.goods);
  }
  return state;
};

Reducer<AppState> appReducer = combineReducers([
  TypedReducer<AppState, AddAction>(addGoodsReducer),
  otherGoodsReducer
]);


var store = Store(appReducer, initialState: AppState() ,middleware: [asyncActionMiddleware]);


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
