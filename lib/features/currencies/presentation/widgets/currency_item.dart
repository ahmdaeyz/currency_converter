import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/presentation/utils/error.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/pages/currency_historical_data_page.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/flag.dart';
import 'package:currency_converter/features/settings/presentation/manager/settings_cubit.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    super.key,
    required this.currency,
    this.onItemTapped,
  });

  final Currency currency;
  final ValueChanged<Currency>? onItemTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onItemTapped != null
          ? () => onItemTapped!(currency)
          : () {
              final historicalDataCubit = getIt<CurrencyHistoricalDataCubit>();
              final baseCurrency =
                  context.read<SettingsCubit>().historicalDataBaseCurrency;

              final canDisplayHistoricalData =
                  historicalDataCubit.canDisplayHistoricalData(
                      currentBaseCurrency: baseCurrency,
                      currencyCode: currency.code);

              if (canDisplayHistoricalData) {
                _handleCanDisplayHistoricalData(baseCurrency, context,
                    cubit: historicalDataCubit);
              } else {
                historicalDataCubit.close();
                showErrorMessage(
                    context: context,
                    message: S.of(context).canNotShowHistoricalDataForBase);
              }
            },
      leading: Flag(
        url: currency.flagInSvg,
        width: 48.w,
        height: 32.h,
      ),
      title: Text(
        currency.code,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        currency.name,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: Text(
        currency.symbol,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  void _handleCanDisplayHistoricalData(
      String? baseCurrency, BuildContext context,
      {required CurrencyHistoricalDataCubit cubit}) {
    if (baseCurrency != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider(
                create: (context) => cubit,
                child: CurrencyHistoricalDataPage(
                    baseCurrency: baseCurrency, targetCurrency: currency.code),
              )));
    } else {
      cubit.close();
      showErrorMessage(
          context: context, message: S.of(context).errorGettingBaseCurrency);
    }
  }
}
