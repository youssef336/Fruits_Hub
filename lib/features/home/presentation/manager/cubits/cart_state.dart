part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartitemAdded extends CartState {}

class CartitemRemoved extends CartState {}
