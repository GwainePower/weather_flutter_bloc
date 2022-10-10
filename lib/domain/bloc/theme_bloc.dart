import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../ui/app/app_themes.dart';

// Данный блок отвечает за хранение состояния светлой или тёмной тем
// и переключает его в зависимости от сохраненного состояния
class ThemeBloc extends Bloc<ChangeThemeEvent, ThemeData> {
  bool isLightThemeStored = true;
  ThemeBloc() : super(AppThemes.light()) {
    on<ChangeThemeEvent>(_changeThemeEvent);
  }

  void _changeThemeEvent(ChangeThemeEvent event, Emitter<ThemeData> emit) {
    isLightThemeStored = !event.isLightTheme;
    if (event.isLightTheme) {
      emit(AppThemes.dark());
    } else {
      emit(AppThemes.light());
    }
  }
}

@immutable
class ChangeThemeEvent {
  final bool isLightTheme;
  const ChangeThemeEvent(this.isLightTheme);
}
