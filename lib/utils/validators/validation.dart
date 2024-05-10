
class GValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    //Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty){
      return 'Password is required.';
    }
  
    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]')) || !value.contains(RegExp(r'[А-Я]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'Password must contain at least one special characters.';
    }

    return null;
  }

  static String? vadateNumberPhone(String? value) {
    if (value == null || value.isEmpty){
      return 'Phone number is required';
    }
  

  //Regular expression for phone number validation
  final phoneRegExp = RegExp(r'^\d{10,11}$');

  if (!phoneRegExp.hasMatch(value)) {
    return 'Invalid phone number format (10 or 11 digits required).';
  }

  return null;
  }

}
