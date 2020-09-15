class Client {
   final String clientId; 
   final String name;
   final String address;
   final String image;
   final String logo;
   
   Client(this.clientId, this.name, this.address, this.image, this.logo); 
   factory Client.fromMap(Map<String, dynamic> json) { 
      return Client( 
         json['clientId'], 
         json['name'], 
         json['address'], 
         json['image'], 
         json['logo'], 
      );
   }
}