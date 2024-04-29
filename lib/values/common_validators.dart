class CommonValidators {
  CommonValidators._();

  //Regex for name
  static const nameValidators = r'^[a-zA-Z ]+$';

  //Regex for email
  static const emailValidators =
      r'^(|([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.*))*\w{1,63}\.[a-zA-Z]{2,6}$';

  //Regex for phone number
  static const numberValidators = r'^[0-9]{10}$';

  //Regex for password
  static const passwordValidators = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
}
