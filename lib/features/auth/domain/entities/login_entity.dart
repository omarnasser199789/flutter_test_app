import 'package:equatable/equatable.dart';

import '../../data/model/data.dart';

class LoginEntity extends Equatable{

  final bool success;
  final Data data;
  final String message;

  const LoginEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [success, data, message];

}