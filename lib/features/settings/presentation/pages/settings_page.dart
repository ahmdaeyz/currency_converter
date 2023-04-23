import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/application/locale/locale_cubit.dart';
import 'package:currency_converter/features/currencies/domain/entities/currency.dart';
import 'package:currency_converter/features/currencies/presentation/manager/currencies_list/currencies_list_cubit.dart';
import 'package:currency_converter/features/currencies/presentation/widgets/currencies_list.dart';
import 'package:currency_converter/features/settings/presentation/manager/settings_cubit.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localCubit = context.read<LocaleCubit>();
    final valueStyle = Theme.of(context).textTheme.bodySmall;
    final titleStyle = Theme.of(context).textTheme.titleSmall;
    final sectionStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: Theme.of(context).primaryColor);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Builder(builder: (context) {
        return SafeArea(
          child: SettingsList(
            /// Ensuring material like ui
            applicationType: ApplicationType.material,
            platform: DevicePlatform.android,
            sections: [
              SettingsSection(
                title: Text(
                  S.of(context).common,
                  style: sectionStyle,
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    onPressed: (_) {
                      localCubit.switchLocale();
                    },
                    leading: const Icon(Icons.language),
                    title: Text(
                      S.of(context).language,
                      style: titleStyle,
                    ),
                    value: Text(
                      S.of(context).appLanguage,
                      style: valueStyle,
                    ),
                  ),
                ],
              ),
              SettingsSection(
                title: Text(
                  S.of(context).historicalData,
                  style: sectionStyle,
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    onPressed: (_) async {
                      final Currency? baseCurrency = await showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return BlocProvider(
                                create: (_) => getIt<CurrenciesListCubit>()
                                  ..getCurrenciesList(),
                                child: SizedBox(
                                    height: 0.6.sh,
                                    child: CurrenciesList(
                                        onItemTapped: (currency) {
                                      Navigator.of(context).pop(currency);
                                    })));
                          });
                      if (context.mounted && baseCurrency != null) {
                        context
                            .read<SettingsCubit>()
                            .saveHistoricalDataBaseCurrency(
                                baseCurrency: baseCurrency.code);
                      }
                    },
                    leading: const Icon(Icons.language),
                    title: Text(
                      S.of(context).historicalDataBaseCurrency,
                      style: titleStyle,
                    ),
                    value: BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        final baseCurrency = context
                            .read<SettingsCubit>()
                            .historicalDataBaseCurrency;
                        return Text(
                          baseCurrency ?? "",
                          style: valueStyle,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
