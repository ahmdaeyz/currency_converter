import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/presentation/utils/error.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_state.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/converter_card.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/flags_card.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  late final _converterCubit = getIt<CurrencyConverterCubit>();
  late final _baseController = TextEditingController();
  late final _toController = TextEditingController();

  @override
  void dispose() {
    _baseController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _converterCubit,
      child: SingleChildScrollView(
        child: Builder(builder: (context) {
          return BlocListener<CurrencyConverterCubit, CurrencyConverterState>(
            listener: (context, state) {
              state.maybeWhen(
                  errorInConversion: (message) {
                    showErrorMessage(context: context, message: message);
                  },
                  errorInCurrencies: (message) {
                    showErrorMessage(context: context, message: message);
                  },
                  errorInSelection: (message, _) {
                    showErrorMessage(context: context, message: message);
                  },
                  currencySelected: (_, __) {
                    _toController.clear();
                  },
                  converted: (conversion) {
                    _toController.text = conversion;
                  },
                  orElse: () {});
            },
            child: SizedBox(
                height: 0.9.sh,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        S.of(context).currencyConverter,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const FlagsCard(),
                      SizedBox(
                        height: 12.h,
                      ),
                      ConverterCard(
                          baseController: _baseController,
                          toController: _toController),
                      const Spacer(),
                      SizedBox(
                          height: 55.h,
                          width: 1.sw,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: ElevatedButton(
                                onPressed: () {
                                  final isValid = context
                                      .read<CurrencyConverterCubit>()
                                      .validate(_baseController.text);
                                  if (isValid) {
                                    context
                                        .read<CurrencyConverterCubit>()
                                        .convert(amount: _baseController.text);
                                  }
                                },
                                child: Text(
                                  S.of(context).convert,
                                  style: Theme.of(context).textTheme.labelLarge,
                                )),
                          ))
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}
