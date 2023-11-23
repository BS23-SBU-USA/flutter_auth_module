part of 'change_password_data_source.dart';

class ChangePasswordDataSourceImp implements ChangePasswordDataSource {
  const ChangePasswordDataSourceImp({required this.restClient});

  final RestClient restClient;

  @override
  Future<Response> changePassword({
    required Map<String, dynamic> requestBody,
  }) async {
    final response = await restClient.post(
      API.changePassword,
      apiType: APIType.protected,
      data: requestBody,
    );

    return response;
  }
}
