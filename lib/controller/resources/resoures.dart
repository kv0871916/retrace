import 'package:retrace/controller/auth/auth_helper.dart';

class Resource {
  final Status status;
  Resource({required this.status}) {
    switch (status) {
      case Status.success:
        break;
      case Status.error:
        break;
      case Status.cancelled:
        break;
      default:
    }
  }
}
