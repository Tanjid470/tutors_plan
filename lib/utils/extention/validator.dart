mixin Validators{
  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    final regex = RegExp(pattern);
    if (value != value?.toLowerCase()) {
      return 'Capital letters are not allowed in the email';
    }
    else if(value!.isNotEmpty && !regex.hasMatch(value))
    {
      return 'Enter a valid email address';
    }
    else if (value.isEmpty){
      return 'Email is required';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one numeric character";
    }
    if (!value.contains(RegExp(r'[!@#$%^&*()<>?/|}{~:]'))) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  static String? validateName(String? value){
    if (value == null || value.isEmpty) {
      return 'username is Required';
    }
    else if (value.length <= 2){
      return 'Name must contain at least 3 characters!';
    }
    return '';
  }

  static String? validateTitle(String? value){
    if (value == null || value.isEmpty) {
      return 'Title is required';
    }
    else if (value.length <= 2){
      return 'title must contain at least 3 characters!';
    }
    return '';
  }

  static String  firstNameValidation(String? value){
    if (value == null || value.isEmpty) {
      return 'first name is Required';
    }
    else if (value.length <= 3){
      return 'first name must contain at least 3 characters!';
    }
    return '';
  }

  static String  lastNameValidation(String? value){
    if (value == null || value.isEmpty) {
      return 'last name is Required';
    }
    else if (value.length <= 3){
      return 'last name must contain at least 3 characters!';
    }
    return '';
  }

  static String dateOfBirthValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of Birth is Required';
    }
    return '';
  }

  static String validateDescription(String? value){
    if (value == null || value.isEmpty) {
      return 'Description is Required';
    }
    else if (value.length <= 10){
      return 'Description must contain at least 10 characters!';
    }
    return '';
  }
}