// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoading extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;

  const WishlistLoaded(this.wishlist);

  @override
  List<Object> get props => [wishlist];

}

class WishlistError extends WishlistState {
  @override
  List<Object> get props => [];
}
