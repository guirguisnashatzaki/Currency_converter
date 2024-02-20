part of 'currency_cubit.dart';

@immutable
abstract class CurrencyState extends Equatable {}

class CurrencyInitial extends CurrencyState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CurrencyLoaded extends CurrencyState{

  final List<SupportedCurrency> currencies;

  CurrencyLoaded(this.currencies);

  @override
  // TODO: implement props
  List<Object?> get props => [currencies];
}

class CurrencyAdded extends CurrencyState{

  final SupportedCurrency currency;

  CurrencyAdded(this.currency);

  @override
  // TODO: implement props
  List<Object?> get props => [currency];
}