import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:muhamad_flutter_siakad_app/data/datasource/auth_local_datasource.dart';

import '../../common/constants/variable.dart';
import '../models/response/khs_response_model.dart';

class KhsRemoteDatasource {
  Future<Either<String, KhsResponseModel>> getKhs() async {
    //final header
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await AuthLocalDatasource().getToken()}',
    };

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/khs'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(KhsResponseModel.fromJson(response.body));
    } else {
      return const Left("Server Error");
    }
  }
}
