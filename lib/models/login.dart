class Login {
  bool isAuthenticated;
  bool hasError;
  String errorMessage;
  int employeeNumber;
  String employeeLocation;
  String designation;
  String userFullName;
  String userEmail;

  Login({
    this.isAuthenticated,
    this.hasError,
    this.errorMessage,
    this.employeeNumber,
    this.employeeLocation,
    this.designation,
    this.userFullName,
    this.userEmail,
  });


  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      isAuthenticated: json['isAuthenticated'],
      hasError: json['hasError'],
      errorMessage: json['errorMessage'].toString(),
      employeeNumber: json['employeeNumber'],
      employeeLocation: json['employeeLocation'].toString(),
      designation: json['designation'].toString(),
      userFullName: json['userFullName'].toString(),
      userEmail: json['userFullName'].toString(),
    );
  }
}
