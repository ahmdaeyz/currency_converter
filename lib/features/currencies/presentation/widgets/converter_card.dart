import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_state.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/currency_row.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConverterCard extends StatelessWidget {
  const ConverterCard({
    super.key,
    required TextEditingController baseController,
    required TextEditingController toController,
  })  : _baseController = baseController,
        _toController = toController;

  final TextEditingController _baseController;
  final TextEditingController _toController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h) +
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).converter,
                style: Theme.of(context).textTheme.labelLarge),
            SizedBox(
              height: 32.h,
            ),
            CurrencyRow(
              controller: _baseController,
              hint: S.of(context).amountHint,
              dropdownHint: S.of(context).baseCurrency,
              onSelect: (currency) {
                context
                    .read<CurrencyConverterCubit>()
                    .selectBaseCurrency(currency: currency);
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
              builder: (context, state) {
                return CurrencyRow(
                  isInputReadOnly: true,
                  dropdownHint: S.of(context).targetCurrency,
                  controller: _toController,
                  onSelect: (currency) {
                    context
                        .read<CurrencyConverterCubit>()
                        .selectToCurrency(currency: currency);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
