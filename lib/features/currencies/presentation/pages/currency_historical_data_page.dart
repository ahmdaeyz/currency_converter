import 'package:currency_converter/core/presentation/widgets/error_state.dart';
import 'package:currency_converter/core/presentation/widgets/loading_state.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency_historical_data.dart';
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/manager/historical_data/currency_historical_data_state.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrencyHistoricalDataPage extends StatefulWidget {
  const CurrencyHistoricalDataPage(
      {Key? key, required this.baseCurrency, required this.targetCurrency})
      : super(key: key);
  final String baseCurrency;
  final String targetCurrency;

  @override
  State<CurrencyHistoricalDataPage> createState() =>
      _CurrencyHistoricalDataPageState();
}

class _CurrencyHistoricalDataPageState
    extends State<CurrencyHistoricalDataPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<CurrencyHistoricalDataCubit>()
        .getWeekBackHistoricalData(currency: widget.targetCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "${widget.baseCurrency} - ${widget.targetCurrency}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Text("~ ${S.of(context).lastSevenDays}",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            BlocBuilder<CurrencyHistoricalDataCubit,
                CurrencyHistoricalDataState>(builder: (context, state) {
              return state.maybeWhen(
                  loading: () => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: const LoadingState(),
                      ),
                  loaded: (history) {
                    return SfCartesianChart(
                      enableAxisAnimation: true,
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                      ),
                      primaryXAxis: DateTimeAxis(
                          intervalType: DateTimeIntervalType.days, interval: 1),
                      series: [
                        LineSeries<CurrencyHistoricalData, DateTime>(
                            name: S.of(context).historicalData,
                            dataSource: history,
                            color: Theme.of(context).primaryColor,
                            xValueMapper: (data, index) => data.date,
                            yValueMapper: (data, index) => data.rate)
                      ],
                    );
                  },
                  error: (message) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: ErrorState(message: message)),
                  orElse: () => const SizedBox.shrink());
            })
          ],
        ),
      ),
    );
  }
}
