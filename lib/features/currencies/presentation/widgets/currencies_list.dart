import 'package:currency_converter/core/presentation/widgets/error_state.dart';
import 'package:currency_converter/core/presentation/widgets/loading_state.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_state.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/currency_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrenciesList extends StatelessWidget {
  const CurrenciesList({Key? key, this.onItemTapped}) : super(key: key);
  final ValueChanged<Currency>? onItemTapped;

  void refresh(BuildContext context) {
    context.read<CurrenciesListCubit>().getCurrenciesList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesListCubit, CurrenciesListState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const LoadingState(),
          error: (message) => RefreshIndicator(
              onRefresh: () async => refresh(context),
              child: SingleChildScrollView(
                  child: SizedBox(
                height: 0.9.sh,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: ErrorState(message: message)),
              ))),
          loaded: (currencies) => RefreshIndicator(
            onRefresh: () async => refresh(context),
            child: ListView.separated(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return CurrencyItem(
                    currency: currency, onItemTapped: onItemTapped);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 8.h,
              ),
            ),
          ),
        );
      },
    );
  }
}
