import 'package:change_notifier_example/app/modules/home/presentation/blocs/home_bloc/events/home_events.dart';

class GetHomeDataEvent implements HomeEvents {
  final int id;

  GetHomeDataEvent(this.id);
}
