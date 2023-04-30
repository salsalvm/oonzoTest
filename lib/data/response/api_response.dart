import 'status.dart';

class ApiResponse<T> {
  ApiResponse(this.stauts, this.data, this.message);

  ApiResponse.loading() : stauts = Status.isLoading;
  ApiResponse.error(this.message) : stauts = Status.isError;
  ApiResponse.complete(this.data) : stauts = Status.isComplete;

  Status? stauts;
  T? data;
  String? message;

  @override
  String toString() {
    return ' Status  : $stauts \n Message : $message \n Data : $data';
  }
}
