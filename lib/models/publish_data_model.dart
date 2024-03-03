import 'dart:io';

class PublishData {
  late File? imageFile;
  late String description;
  late Map<String, double> location;

  PublishData({
     this.imageFile,
    required this.description,
    required this.location,
  });
  Map<String, dynamic> toJson(){
  
    if (this.imageFile==null){
      return{"description": this.description,
    "location": this.location};
    }
     else{
       return{
    "image":this.imageFile,
    "description": this.description,
    "location": this.location};
     }
    ;
  }
}
