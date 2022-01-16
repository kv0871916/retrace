import '../auth/auth_helper.dart';

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

getfistname(String name) {
  List namelist = name.split(" ");
  int length = namelist.length;
  if (length >= 0 && name != null) {
    return namelist.first;
  } else {
    return " ";
  }
}

getlastname(String name) {
  List namelist = name.split(" ");
  int length = namelist.length;
  if (length >= 0 && name != null) {
    return namelist.last;
  } else {
    return " ";
  }
}
