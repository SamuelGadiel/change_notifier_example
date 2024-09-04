import 'package:change_notifier_example/app/modules/home/domain/usecases/get_home_data_usecase.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/get_home_data_failure_state.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/get_home_data_loading_state.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/get_home_data_success_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/get_home_data_event.dart';
import 'events/home_events.dart';
import 'states/home_initial_state.dart';
import 'states/home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final GetHomeDataUsecase getHomeDataUsecase;

  HomeBloc(this.getHomeDataUsecase) : super(HomeInitialState()) {
    on<GetHomeDataEvent>(_mapGetHomeDataEventToState);
  }

  void _mapGetHomeDataEventToState(GetHomeDataEvent event, Emitter<HomeStates> emit) async {
    emit(GetHomeDataLoadingState());

    final result = await getHomeDataUsecase(event.id);

    if (result == 'Sucesso!') {
      emit(GetHomeDataSuccessState(result));
    } else {
      emit(GetHomeDataFailureState(result));
    }
  }
}
