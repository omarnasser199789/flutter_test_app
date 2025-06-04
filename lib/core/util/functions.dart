import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:advance_notification/advance_notification.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

Future<dynamic> goTo(BuildContext context, WidgetBuilder builder) async {

  var res= await Navigator.push(
    context,
    MaterialPageRoute(builder:builder),
  );
  return res;
}

Future<Either<Failure, T>> convertToEntity<T>(Future<T> Function() remoteFunction) async {
  try {
    final remote = await remoteFunction();
    return Right(remote);
  }
  catch (e) {
    if(e is ServerException){
      return Left(ServerFailure(message:e.msg));
    }
    if(e is BadRequestException){
      return Left(BadRequestFailure(message:e.msg));
    }
    if(e is NotFoundException){
      return Left(UserFoundFailure(message:e.msg));
    }
    if(e is UnauthorisedException){
      return Left(UnauthorisedFailure(message:e.msg));
    }
    if(e is UnauthorisedException){
      return Left(UnauthorisedFailure(message: e.msg));
    }
    if(e is ToManyRequestException){
      return Left(ToManyRequestFailure(message:e.msg));
    }
    if(e is OTPException){
      return Left(OTPFailure(message:e.msg));
    }
    if(e is UserAlreadyExistsException){
      return Left(UserAlreadyExistsFailure(message:e.msg));
    }
    if(e is ForbiddenException){
      return Left(ForbiddenFailure(message:e.msg));
    }
    if(e is DuplicateEmailException){
      return Left(DuplicateEmailFailure(message:e.msg));
    }

    return Left(ServerFailure(message:"Error"));
  }

}

showMessage( { required String  message,required BuildContext context,Color ? bgColor}){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AdvanceSnackBar(
        message: message,
        mode: Mode.BASIC,
        bgColor:(bgColor!=null)?bgColor: Colors.red)
        .show(context);
  });
}