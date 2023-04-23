import 'package:bloc/bloc.dart';
import 'package:currency_converter/core/domain/utils/usecase.dart';
import 'package:currency_converter/core/presentation/utils/cubit.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/domain/usecases/get_currencies_list_usecase.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrenciesListCubit extends Cubit<CurrenciesListState> {
  final GetCurrenciesListUseCase _getCurrenciesListUseCase;

  final List<Currency> _currencies = [];

  List<Currency> get currencies =>
      List.from(_currencies.map((e) => e.copyWith()), growable: false);

  CurrenciesListCubit(this._getCurrenciesListUseCase)
      : super(const CurrenciesListState.initial());

  Future<void> getCurrenciesList() async {
    _currencies.clear();
    emit(const CurrenciesListState.loading());
    final edge = await _getCurrenciesListUseCase(NoParams());
    emit(edge.fold(
        (failure) => errorStateFrom(failure,
            determineError: (type, message, isAction) =>
                CurrenciesListState.error(message: message)),
        (availableCurrencies) {
      _currencies.addAll(availableCurrencies);
      return CurrenciesListState.loaded(currencies: availableCurrencies);
    }));
  }
}
