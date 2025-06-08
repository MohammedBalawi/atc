import 'package:act_hub_mobile/features/category/data/data_source/categories_remote_data_source.dart';
import 'package:act_hub_mobile/features/category/data/mapper/categories_mapper.dart';
import 'package:act_hub_mobile/features/category/domain/model/categories_model.dart';
import 'package:act_hub_mobile/features/category/domain/repository/categories_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/interent_checker.dart';
import '../../../../core/resources/manager_strings.dart';

class CategoriesRepositoryImplementation implements CategoriesRepository {
  RemoteCategoriesDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  CategoriesRepositoryImplementation(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, CategoriesModel>> categories() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.categories();
        return Right(response.toDomain());
      } catch (e) {
        try {
          return Left(Failure(ResponseCode.INTERNAL_SERVER_ERROR,
              ManagerStrings.INTERNAL_SERVER_ERROR));
        } catch (e) {
          return Left(Failure(ResponseCode.UNKNOWN, ManagerStrings.UNKNOWN));
        }
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
