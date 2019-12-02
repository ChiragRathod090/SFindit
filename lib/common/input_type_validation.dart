class InputValidation {
  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty)
      return 'Email is required';
    else if (!regex.hasMatch(value))
      return 'Valid email is required';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty)
      return 'Password is required';
    else
      return null;
  }

  static String validateName(String value) {
    if (value.isEmpty)
      return 'Name is required';
    else
      return null;
  }

  static String validateEmergencyName(String value) {
    if (value.isEmpty)
      return 'Emergency contact name is required';
    else
      return null;
  }

  static String validateNickName(String value) {
    if (value.isEmpty)
      return 'Nick name is required';
    else
      return null;
  }

  static String validateMobile(String value) {
    if (value.isEmpty) return 'Phone number is required';
    if (value.length < 10)
      return 'Phone number is must be 10 digit';
    else
      return null;
  }

  static String validateEmergencyContactNumber(String value) {
    if (value.isEmpty) return 'Emergency contact number is required';
    if (value.length < 10)
      return 'Emergency contact number is must be 10 digit';
    else
      return null;
  }

//  static String validateUserName(String value) {
//    if (value.isEmpty)
//      return 'Username is required';
//    else
//      return null;
//  }
//
//  static String validateAddress(String value) {
//    if (value.isEmpty)
//      return 'Address is required';
//    else
//      return null;
//  }
//
//  static String validateFirstName(String value) {
//    if (value.isEmpty)
//      return 'Firstname is required';
//    else
//      return null;
//  }
//
//  static String validateLastName(String value) {
//    if (value.isEmpty)
//      return 'Lastname is required';
//    else
//      return null;
//  }
//
//  static String validateCity(String value) {
//    if (value.isEmpty)
//      return 'City is required';
//    else
//      return null;
//  }
//
//  static String validatePincode(String value) {
//    if (value.isEmpty)
//      return 'Pincode is required';
//    else
//      return null;
//  }
//
//  static String validateCompanyName(String value) {
//    if (value.isEmpty)
//      return 'Company Name is required';
//    else
//      return null;
//  }
//
//  static String validateGSTNumber(String value) {
//    if (value.isEmpty)
//      return 'GST Number is required';
//    else
//      return null;
//  }
//
//  static String validateConfirmPassword(String value) {
//    if (value.isEmpty)
//      return 'Confirm Password is required';
//    else
//      return null;
//  }
}
