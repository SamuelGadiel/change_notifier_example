abstract class HomeStates {}

class HomeInitialState implements HomeStates {}

// GET HOME DATA STATES
class GetHomeDataLoadingState implements HomeStates {}

class GetHomeDataSuccessState implements HomeStates {
  final String successMessage;

  GetHomeDataSuccessState(this.successMessage);
}

class GetHomeDataFailureState implements HomeStates {
  final String failure;

  GetHomeDataFailureState(this.failure);
}
