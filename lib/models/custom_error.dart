import 'package:equatable/equatable.dart' show Equatable;

class CustomError extends Equatable {
  final String errorType;
  final String message;

  const CustomError({
    this.errorType = '',
    this.message = '',
  });

  @override
  String toString() => 'CustomError(errorType: $errorType, message: $message)';

  @override
  List<Object> get props => [errorType, message];
}
