import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/models/cart_model.dart';
import 'package:ecommerce_project/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartEvent>((event, emit) {
      if (event is CartStarted) {
        _mapCartStartedToState(event, emit);
      } else if (event is CartProductAdded) {
        _mapCartProductAddedToState(event, emit);
      } else if (event is CartProductRemoved) {
        _mapCartProductRemovedFromState(event, emit);
      }
    });
  }

  _mapCartStartedToState(event, Emitter<CartState> emit) {
    emit(CartLoading());
    try {
      emit(CartLoaded(Cart()));
    } catch (e) {
      emit(CartError());
    }
  }

  _mapCartProductAddedToState(event, Emitter<CartState> emit) {
    final state = this.state;

    try {
      if (state is CartLoaded) {
        emit(CartLoaded(Cart(
            products: List.from(state.cart.products)..add(event.product))));
      }
    } catch (_) {
      emit(CartError());
    }
  }

  _mapCartProductRemovedFromState(event, Emitter<CartState> emit) {
    final state = this.state;

    try {
      if (state is CartLoaded) {
        emit(CartLoaded(Cart(
            products: List.from(state.cart.products)..remove(event.product))));
      }
    } catch (_) {
      emit(CartError());
    }
  }
}
