import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<int, int> {
  final AuthRepository repository;
  LogoutUseCase({required this.repository});
  @override
  Future<Either<Failure,int>> call(int params) {
    return repository.logout();
  }
}