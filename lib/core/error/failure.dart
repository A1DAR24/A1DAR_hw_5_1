abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode = 0});
}

class UnImplementedFailure extends Failure{
  const UnImplementedFailure({super.message = 'UnImplemented Failure'});
}

class ServerFailure extends Failure{
  const ServerFailure({super.message = 'Server Failure', super.statusCode});
}