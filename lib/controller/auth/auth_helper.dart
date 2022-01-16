enum LoginType { google, twitter, facebook, github }

enum Status { success, error, cancelled, none }

enum ConfirmAction { cancel, accept }

enum Connect { wifi, mobile, nodata, initial }

enum UserCustomAuth {
  isExists,
  isNoUserFound,
  isNone,
  isWeakPass,
  isWorngPass,
  isSuccess
}
