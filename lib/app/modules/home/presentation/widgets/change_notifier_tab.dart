import 'package:change_notifier_example/app/modules/home/presentation/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/get_home_data_usecase.dart';
import '../notifiers/home_events.dart';
import '../notifiers/home_states.dart';

class ChangeNotifierTab extends StatefulWidget {
  const ChangeNotifierTab({super.key});

  @override
  State<ChangeNotifierTab> createState() => _ChangeNotifierTabState();
}

class _ChangeNotifierTabState extends State<ChangeNotifierTab> {
  final getHomeDataUsecase = GetHomeDataUsecase();

  late HomeNotifier homeNotifier;

  @override
  void initState() {
    homeNotifier = HomeNotifier(getHomeDataUsecase);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder<HomeStates>(
            valueListenable: homeNotifier,
            builder: (context, state, child) {
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
            onPressed: () => homeNotifier. getHomeData(GetHomeDataEvent(1)),
            child: const Text('Acionar ChangeNotifier'),
          ),
        ],
      ),
    );
  }
}
