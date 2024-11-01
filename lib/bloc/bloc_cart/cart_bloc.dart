import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cart_model.dart';
import 'app_events.dart';
import 'app_states.dart';


class CartBloc extends Bloc<AppEvent, AppState> {
  CartBloc() : super(LoadingState()) {
    on<GetDataEvent>(getCartItems);
    on<AddEvent>(increaseItemQuantity);
    on<RemoveEvent>(decreaseItemQuantity);
    add(GetDataEvent());
  }

  List<MealModel> cartItemsList = [];

  Future<List<MealModel>> _requestCartItems() {
    return Future.delayed(
      const Duration(seconds: 2),
          () {
        return [
          MealModel(
            id: 1,
            name: 'Pizza Ransh extra cheese',
            price: 1600,
            image: 'assets/images/meal_placeholder.png',
            quantity: 1,
          ),
          MealModel(
            id: 2,
            name: 'Burger BBQ',
            price: 1200,
            image: 'assets/images/meal_placeholder.png',
            quantity: 1,
          ),
        ];
      },
    );
  }

  void _increaseItemQuantity(int id) {
    for (var item in cartItemsList) {
      if (item.id == id) {
        item.quantity++;
        break;
      }
    }
  }

  void _decreaseItemQuantity(int id) {
    for (var item in cartItemsList) {
      if (item.id == id) {
        if (item.quantity > 0) {
          item.quantity--;
        }
        break;
      }
    }
  }

  getCartItems(GetDataEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      cartItemsList = await _requestCartItems();
      if (cartItemsList.isNotEmpty) {
        emit(LoadedState(cartItemsList));
      } else {
        emit(EmptyState());
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  increaseItemQuantity(AddEvent event, Emitter emit) {
    int id = event.data;
    _increaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }

  decreaseItemQuantity(RemoveEvent event, Emitter emit) {
    int id = event.data;
    _decreaseItemQuantity(id);
    emit(LoadedState(cartItemsList));
  }
}

