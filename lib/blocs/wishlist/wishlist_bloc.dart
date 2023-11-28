import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/models/product_model.dart';
import 'package:ecommerce_project/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistEvent>((event, emit) {
      if (event is StartWishlist) {
        _onStartWishlist(event, emit);
      } else if (event is AddWishlistProduct) {
        _onAddWishlistProduct(event, emit);
      } else if (event is RemoveWishlistProduct) {
        _onRemoveWishlistProduct(event, emit);
      }
    });
  }

  void _onStartWishlist(event, Emitter<WishlistState> emit) {
    emit(WishlistLoading());
    emit(WishlistLoaded(Wishlist()));
  }

  void _onAddWishlistProduct(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(Wishlist(
            products: List.from(state.wishlist.products)..add(event.product))));
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveWishlistProduct(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(Wishlist(
            products: List.from(state.wishlist.products)
              ..remove(event.product))));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
