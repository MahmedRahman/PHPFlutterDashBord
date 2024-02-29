class APPInputValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // This regex checks for a password with at least one number, one letter, and one special character, with a minimum length of 8 characters.
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and contain at least one letter, one number, and one special character';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$'); // This pattern can be adjusted as needed
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a first name';
    }

    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a last name';
    }

    return null;
  }

  static String? validateEmailOrPhone(String? value) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    final phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$'); // This pattern can be adjusted as needed

    if (value == null || value.isEmpty) {
      return 'Please enter an email or phone number';
    } else if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return 'Enter a valid email or phone number';
    }
    return null;
  }
}
