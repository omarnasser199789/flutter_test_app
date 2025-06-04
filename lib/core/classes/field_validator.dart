class FieldValidator {
  static String? validatePassword(String? value) {
    /// At least one uppercase letter (positive lookahead for uppercase letter).
    // String upperCasePattern = r'(?=.*?[A-Z])';
    /// At least one lowercase letter (positive lookahead for lowercase letter).
    // String lowerCasePattern = r'(?=.*?[a-z])';
    /// At least one digit (positive lookahead for a digit).
    String digitPattern = r'(?=.*?[0-9])';
    /// At least one special character from the set (!@#\$&*~) (positive lookahead for special character).
    // String specialCharPattern = r'(?=.*?[!@#\$&*~?])';
    /// Password must be at least 8 characters long (min length of 8 characters).
    String lengthPattern = r'.{8,}';

    List<String> errorMessages = [];

    if (value == null || value.isEmpty) {
      return "passwordCanNotBeEmpty";
    }

    // if (!RegExp(upperCasePattern).hasMatch(value)) {
    //   errorMessages.add("oneUpperCaseLetter");
    // }

    // if (!RegExp(lowerCasePattern).hasMatch(value)) {
    //   errorMessages.add("oneLowerCaseLetter");
    // }

    if (!RegExp(digitPattern).hasMatch(value)) {
      errorMessages.add("oneNumber");
    }

    // if (!RegExp(specialCharPattern).hasMatch(value)) {
    //   errorMessages.add("andOneSpecialCharacter");
    // }

    if (!RegExp(lengthPattern).hasMatch(value)) {
      errorMessages.add("andMustBeAtLeastCharactersLong");
    }

    if (errorMessages.isNotEmpty) {
      return errorMessages.join('\n');
    }

    return null;
  }

  static String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if(value !=null){
      if (!regex.hasMatch(value)) {
        return "pleaseEnterValidEmail";
      } else {
        return null;
      }
    }else{
      return null;
    }
  }
}
