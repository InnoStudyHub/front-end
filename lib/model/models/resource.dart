class Resource<T> {
  T? data;
  String? message;
  Resource({this.data, this.message});
}

class Success<T> extends Resource<T> {
  T successData;
  Success({required this.successData}) : super(data: successData);
}

class Fail<T> extends Resource<T> {
  String errorMessage;
  Fail({required this.errorMessage}) : super(message: errorMessage);
}
