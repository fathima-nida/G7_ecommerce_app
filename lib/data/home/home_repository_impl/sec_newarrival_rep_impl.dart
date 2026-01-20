
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/home/dtos/sec_newarrival_resp_dto.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival_resp_model.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class HomeRepository {
  /// Fetch section-wise new arrivals
  Future<SectionWiseItemsRespModel> fetchSecNewArrival({int page = 1}) async {
    final res = await AppNetwork.get(
      url: ApiEndpoints.secNewarrival,
      queryParameters: {"page": page},
    );

    return res.fold(
      (failure) => throw Exception(failure.message),
      (response) {
        // Parse JSON using DTO
        final dto = SecNewArrivalRespDto.fromJson(response.data);
        return dto.toModel();
      },
    );
  }
}
