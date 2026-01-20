import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/banner/banner_responsemodel.dart';

abstract class BannerRepository {
FutureEither<BannerResponseModel>fetchbanner();
}