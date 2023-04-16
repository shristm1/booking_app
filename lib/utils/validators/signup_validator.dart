class SignupValidator {
  String? fullName;
  String? address;
  String? contact;
  String? email;
  String? password;

  SignupValidator({this.fullName, this.address, this.contact, this.email, this.password});

  String validate() {
    String value = "Validation Successful";

    if ((fullName ?? '').isEmpty) {
      value = "Please enter your full name";
    } else if ((contact ?? '').isEmpty) {
      value = "Please enter your contact";
    } else if ((address ?? '').isEmpty) {
      value = "Please enter your address";
    } else if ((email ?? '').isEmpty) {
      value = "Please enter email";
    } else if ((password ?? '').isEmpty) {
      value = "Please enter password";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!)) {
      value = "Please enter valid email";
    } else if (password!.length < 8 || password!.length > 100) {
      value = "Password must be with in 6-20 characters.";
    } else if (!RegExp(
            "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{6,}\$")
        .hasMatch(password!)) {
      value = "Password must include at least one upper & lower case, one special character & one numeric digit.";
    }
    return value;
  }
}
