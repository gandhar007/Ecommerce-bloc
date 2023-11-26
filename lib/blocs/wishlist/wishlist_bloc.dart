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
      // on<StartWishlist>((event, emit) async {
      //   await Future.delayed(Duration.zero)
      //       .whenComplete(() => _onStartWishlist(event, emit));
      // });
      // on<AddWishlistProduct>(_onAddWishlistProduct);
      // on<RemoveWishlistProduct>(_onRemoveWishlistProduct);
    });
  }

  void _onStartWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1))
          .whenComplete(() => emit(WishlistLoaded(Wishlist())));
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddWishlistProduct(event, Emitter<WishlistState> emit) {
    //print('Product fucking added');
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
