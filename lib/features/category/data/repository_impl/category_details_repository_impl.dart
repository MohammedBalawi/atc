import 'package:act_hub_mobile/features/category/data/data_source/category_details_remote_data_source.dart';
import 'package:act_hub_mobile/features/category/data/mapper/category_details_mapper.dart';
import 'package:act_hub_mobile/features/category/data/request/category_details_request.dart';
import 'package:act_hub_mobile/features/category/domain/model/category_details_model.dart';
import 'package:act_hub_mobile/features/category/domain/repository/category_details_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class CategoryDetailsRepoImpl implements CategoryDetailsRepository {
  RemoteCategoryDetailsDataSource _remoteCategoryDetailsDataSource;
  NetworkInfo _networkInfo;

  CategoryDetailsRepoImpl(
    this._networkInfo,
    this._remoteCategoryDetailsDataSource,
  );

  @override
  Future<Either<Failure, CategoryDetailsModel>> categoryDetails(
      CategoryDetailsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteCategoryDetailsDataSource.categoryDetails(
          request,
        );
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ManagerStrings.NO_INTERNT_CONNECTION,
        ),
      );
    }
  }
}
