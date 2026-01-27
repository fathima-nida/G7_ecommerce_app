import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/product/dto/product_dto.dart';
import 'package:g7_comerce_app/domain/category/models/product_request_model.dart';
import 'package:g7_comerce_app/domain/category/models/product_response_model.dart';
import 'package:g7_comerce_app/domain/category/repositories/product_repository.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class ProductImpl extends ProductRepository {
  @override
  FutureEither<ProductDetailsResponse> getProductDetails(
      ProductRequestModel request) async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.productDetails}/${request.productId}',
      
    );

    return response.fold(
      (err) => Left(err),
      (success) {
        final dto = ProductDetailsResponseDto.fromJson(
          success.data as Map<String, dynamic>,
        );

        return Right(dto.toModel());
      },
    );
  }
}
