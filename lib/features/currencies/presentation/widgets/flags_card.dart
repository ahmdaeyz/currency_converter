import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currency_converter/currency_converter_state.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/currency_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagsCard extends StatelessWidget {
  const FlagsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Card(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocSelector<CurrencyConverterCubit, CurrencyConverterState,
                      Currency?>(
                  selector: (state) {
                    return context.read<CurrencyConverterCubit>().base;
                  },
                  builder: (context, currency) =>
                      CurrencyFlag(currency: currency)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    size: 24.h,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              BlocSelector<CurrencyConverterCubit, CurrencyConverterState,
                      Currency?>(
                  selector: (state) {
                    return context.read<CurrencyConverterCubit>().to;
                  },
                  builder: (context, currency) =>
                      CurrencyFlag(currency: currency)),
            ],
          ),
        ),
      ),
    );
  }
}
