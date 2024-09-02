class Failure {
  final String message;
  Failure({this.message = "Something went wrong"});
}

class PermissionFailure extends Failure {
  PermissionFailure({super.message = "Permission denied"});
}
