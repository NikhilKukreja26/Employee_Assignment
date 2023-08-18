import 'package:employee_assignment/exceptions/custom_db_exception.dart';
import 'package:employee_assignment/models/custom_error.dart';
import 'package:sqflite/sqflite.dart';

CustomError handleException(Object e) {
  try {
    throw e;
  } on DatabaseException catch (e) {
    return CustomError(
      errorType: 'DatabaseException',
      message: '${e.result}',
    );
  } on CustomDBException catch (e) {
    return CustomError(
      errorType: 'CustomDBException',
      message: e.message,
    );
  } catch (e) {
    return CustomError(
      errorType: 'Unknown Error',
      message: e.toString(),
    );
  }
}
