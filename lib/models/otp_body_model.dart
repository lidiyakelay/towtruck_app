class OTP {
  String? otp;

  OTP({this.otp});

 

  Map<String, dynamic> toJson() {
    return{
      "otp":this.otp,
    };
  }
}