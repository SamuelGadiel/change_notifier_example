import 'package:flutter/material.dart';

import '../../domain/usecases/get_home_data_usecase.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeNotifier extends ValueNotifier<HomeStates> {
  final GetHomeDataUsecase getHomeDataUsecase;

  HomeNotifier(this.getHomeDataUsecase) : super(HomeInitialState());

  void getHomeData(GetHomeDataEvent event) async {
    value = GetHomeDataLoadingState();

    final result = await getHomeDataUsecase(event.id);

    if (result == 'Sucesso!') {
      value = GetHomeDataSuccessState(result);
    } else {
      value = GetHomeDataFailureState(result);
    }
  }
}
