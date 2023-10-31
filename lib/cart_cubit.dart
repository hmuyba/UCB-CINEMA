import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<Map<String, int>> {
  CartCubit() : super({});

  void addToCart(String movieId) {
    state[movieId] = (state[movieId] ?? 0) + 1;
    emit(Map<String, int>.from(state));
  }

  void removeFromCart(String movieId) {
    if (state.containsKey(movieId) && state[movieId]! > 0) {
      state[movieId] = state[movieId]! - 1;
    }
    emit(Map<String, int>.from(state));
  }
}
