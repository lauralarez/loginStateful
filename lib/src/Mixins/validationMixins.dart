class ValidationMixin {
  String validateEmail(value) {
    if (!value.contains('@') && !value.contains('@') && value.length < 15) {
      return 'Por favor, Introduzca un correo valido';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.length < 4) {
      return 'La clave debe contener al menos 8 caracteres';
    }
    return null;
  }
}
