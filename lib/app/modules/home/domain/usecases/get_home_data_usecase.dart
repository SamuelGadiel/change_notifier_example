class GetHomeDataUsecase {
  Future<String> call(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    return 'Sucesso!';
  }
}
