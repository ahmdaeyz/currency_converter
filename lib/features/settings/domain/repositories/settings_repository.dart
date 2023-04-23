abstract class SettingsRepository {
  void saveHistoricalDataBaseCurrency({required String baseCurrency});

  Future<String> getHistoricalDataBaseCurrency();
}
