import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:muhamad_flutter_siakad_app/data/datasource/auth_local_datasource.dart';
import 'package:muhamad_flutter_siakad_app/data/models/response/schedule_response_model.dart';

import '../../common/constants/variable.dart';

class ScheduleRemoteDatasource {
  Future<Either<String, ScheduleResponseModel>> getSchedules() async {
    //final header
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await AuthLocalDatasource().getToken()}',
    };

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/schedules'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(ScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left("Server Error");
    }
  }
}
