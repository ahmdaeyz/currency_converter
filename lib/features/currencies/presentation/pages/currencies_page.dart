import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/app_drawer.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/currencies_list.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/currency_converter.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrenciesPage extends StatefulWidget {
  const CurrenciesPage({Key? key}) : super(key: key);

  @override
  State<CurrenciesPage> createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends State<CurrenciesPage>
    with SingleTickerProviderStateMixin {
  late final _tabBarController = TabController(length: 2, vsync: this);
  late final _currenciesListCubit = getIt<CurrenciesListCubit>()
    ..getCurrenciesList();

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _currenciesListCubit,
      child: Scaffold(
        appBar: AppBar(),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(controller: _tabBarController, tabs: [
                Tab(
                  icon: const Icon(Icons.list),
                  text: S.of(context).currencies,
                ),
                Tab(
                  icon: const Icon(Icons.currency_exchange),
                  text: S.of(context).currencyConverter,
                )
              ]),
              Expanded(
                child:
                    TabBarView(controller: _tabBarController, children: const [
                   CurrenciesList(),
                   CurrencyConverter(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
