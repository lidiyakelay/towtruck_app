class SignUpBody{
  String email;
  String password;
  String firstName;
  String lastName;
  String confirmPassword;
 
 


  SignUpBody({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword
   
});
 Map<String, dynamic> toJson(){
   return{
     "email":this.email,
     "password":this.password,
     "first_name":this.firstName,
     "last_name":this.lastName,
     "password2":this.confirmPassword
   };
 }
}