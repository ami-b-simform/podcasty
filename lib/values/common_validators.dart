class CommonValidators {
  const CommonValidators._();

  //Regex for name
  static final RegExp userNameValidators = RegExp(r'^[a-zA-Z ]+$');

  //Regex for email
  static final RegExp emailValidators = RegExp(
      r'^(|([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.*))*\w{1,63}\.[a-zA-Z]{2,6}$');

  //Regex for phone number
  static final RegExp numberValidators = RegExp(r'^[0-9]{10}$');

  //Regex for password
  static final RegExp passwordValidators =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
}
