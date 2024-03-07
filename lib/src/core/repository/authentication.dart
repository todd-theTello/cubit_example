import 'package:cubit_example/src/core/model/authentication.dart';
import 'package:cubit_example/src/core/server/endpoint.dart';
import 'package:cubit_example/src/core/server/network.dart';

class AuthenticationRepository {
  final _dioClient = NetworkClient();
  Future<AuthenticationResponse> login({required String username, required String password}) async {
    final response = await _dioClient.call(
      path: Endpoints.login,
      requestMethod: RequestMethod.post,
      data: {'username': username, 'password': password},
    );
    final decodedResponse = AuthenticationResponse.fromJson(response.data);

    return decodedResponse;
  }

  Future<void> signup() async {}
  Future<void> logout() async {}
}

/*
'kminchelle'
'0lelplR'
 */
