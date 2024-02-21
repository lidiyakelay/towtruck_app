class SignUpBody{
  String email;
  String password;
 


  SignUpBody({
    required this.email,
    required this.password,
   
});
 Map<String, dynamic> toJson(){
   return{
     "email":this.email,
     "password":this.password,
   };
 }
}