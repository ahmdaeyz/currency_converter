import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:currency_converter/core/application/locale/locale_cubit.dart';
import 'package:currency_converter/core/application/locale/locale_state.dart';
import 'package:currency_converter/core/application/theme/colors.dart';
import 'package:currency_converter/features/currencies/presentation/pages/currencies_page.dart';
import 'package:currency_converter/features/settings/presentation/manager/settings_cubit.dart';
import 'package:currency_converter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SettingsCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            final localeCubit = context.read<LocaleCubit>();
            return ScreenUtilInit(
                // The size of the smallest iphone ie iPhone 6
                designSize: const Size(375, 667),
                minTextAdapt: true,
                builder: (context, child) {
                  return MaterialApp(
                    title: 'Currency Converter',
                    onGenerateTitle: (context) {
                      return S.of(context).appName;
                    },
                    supportedLocales: localeCubit.supportedLocales,
                    localizationsDelegates: const [
                      DefaultMaterialLocalizations.delegate,
                      ...GlobalMaterialLocalizations.delegates,
                      S.delegate
                    ],
                    locale: localeCubit.state.locale,
                    theme: ThemeData(
                        colorSchemeSeed: seedColor, useMaterial3: true),
                    home: const CurrenciesPage(),
                  );
                });
          },
        );
      }),
    );
  }
}
