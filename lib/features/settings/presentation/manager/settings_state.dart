part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsChanged extends SettingsState with EquatableMixin {
  @override
  List<Object?> get props => [];
}
