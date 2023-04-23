import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyRow extends StatelessWidget {
  const CurrencyRow({
    super.key,
    this.isInputReadOnly = false,
    this.controller,
    this.onSelect,
    this.hint,
    this.dropdownHint,
  });

  final bool isInputReadOnly;
  final TextEditingController? controller;
  final ValueChanged<Currency>? onSelect;
  final String? dropdownHint;

  final String? hint;

  @override
  Widget build(BuildContext context) {
    final hintStyle = Theme.of(context)
        .textTheme
        .labelSmall
        ?.copyWith(color: Colors.grey[500]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 2,
            child: TextFormField(
              controller: controller,
              readOnly: isInputReadOnly,
              enabled: !isInputReadOnly,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              decoration: InputDecoration(hintText: hint, hintStyle: hintStyle),
            )),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<CurrenciesListCubit, CurrenciesListState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  loading: () => DropdownButtonFormField(
                        items: const [],
                        onChanged: (_) {},
                        decoration: InputDecoration(
                            enabled: false,
                            suffix: SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: const CircularProgressIndicator(),
                            )),
                      ),
                  loaded: (currencies) {
                    final items = currencies
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(text: e.code),
                                    const TextSpan(text: " "),
                                    TextSpan(text: "(${e.symbol})")
                                  ]),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            )))
                        .toList();
                    return DropdownButtonFormField(
                      items: items,
                      decoration: InputDecoration(
                          hintText: dropdownHint, hintStyle: hintStyle),
                      onChanged: (currency) {
                        if (currency != null) {
                          onSelect?.call(currency);
                        }
                      },
                    );
                  },
                  error: (_) => DropdownButtonFormField(
                        items: const [],
                        onChanged: (_) {},
                        decoration: const InputDecoration(
                          enabled: false,
                        ),
                      ));
            },
          ),
        ),
      ],
    );
  }
}
