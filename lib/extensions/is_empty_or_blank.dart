extension IsEmptyOrBlank on String {
  bool isEmptyAndBlank() {
    if (isEmpty && this == '') {
      return true;
    } else {
      return false;
    }
  }
}
