import 'package:change_notifier_example/app/modules/home/domain/usecases/get_home_data_usecase.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/events/get_home_data_event.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/get_home_data_failure_state.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/get_home_data_loading_state.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/get_home_data_success_state.dart';
import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/states/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTab extends StatefulWidget {
  const BlocTab({super.key});

  @override
  State<BlocTab> createState() => _BlocTabState();
}

class _BlocTabState extends State<BlocTab> {
  final getHomeDataUsecase = GetHomeDataUsecase();

  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc(getHomeDataUsecase);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeBloc, HomeStates>(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is GetHomeDataLoadingState) {
                return const CircularProgressIndicator();
              }

              if (state is GetHomeDataFailureState) {
                return Text(state.failure);
              }

              if (state is GetHomeDataSuccessState) {
                return Text(state.successMessage);
              }

              return const Text('Estado inicial');
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => homeBloc.add(GetHomeDataEvent(1)),
            child: const Text('Acionar BLoC'),
          ),
        ],
      ),
    );
  }
}
