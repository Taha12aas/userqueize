String? validatePassword(password) {
  if (password == null || password.isEmpty) {
    return 'كلمة المرور مطلوبة';
  }
  if (password.length < 8) {
    return 'كلمة المرور يجب أن تكون أطول من 8 محارف';
  }
  final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
  final hasLowerCase = password.contains(RegExp(r'[a-z]'));
  final hasDigits = password.contains(RegExp(r'[0-9]'));
  final hasSpecialCharacters = password.contains(RegExp(r'[!@#\$&*~]'));

  if (!hasUpperCase) {
    return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
  }
  if (!hasLowerCase) {
    return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
  }
  if (!hasDigits) {
    return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
  }
  if (!hasSpecialCharacters) {
    return 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
  }

  return null;
}
