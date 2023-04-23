import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyFlag extends StatelessWidget {
  const CurrencyFlag({
    super.key,
    this.currency,
  });

  final Currency? currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 16.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(48.r),
          child: Flag(
            url: currency?.flagInSvg,
            width: 48.h,
            height: 48.h,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          currency?.name ?? "",
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
