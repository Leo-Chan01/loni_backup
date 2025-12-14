extension ExceptionHandler on Object {
  String toReadableFormat() {
    return toString();
    // if (this is AuthException) {
    //   final exception = this as AuthException;
    //   return exception.message;
    // } else if (this is PostgrestException) {
    //   final exception = this as PostgrestException;
    //   return exception.message;
    // } else if (this is FormatException) {
    //   final exception = this as FormatException;
    //   return exception.message;
    // } else if (this is Exception) {
    //   return toString();
    // } else {
    //   return 'An unknown error occurred';
    // }
  }
}
