abstract class HomeEvents {}

class GetHomeDataEvent implements HomeEvents {
  final int id;

  GetHomeDataEvent(this.id);
}
