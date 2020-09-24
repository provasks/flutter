class Client {
  final String customerCode;
  final String customerName;
  final String customerAddress;
   final String image;
   final String logo;
   final String contact;
   final String location;
  // final String observation;
  // final String createdBy;
  // final String serialNo;
  // final String createdAt;
  // final String createTimestamp;
  // final String updateTimestamp;

  Client(
    this.customerCode,
    this.customerName,
    this.customerAddress,
    this.image,
    this.logo,
    this.contact,
    this.location
  );
  factory Client.fromMap(Map<String, dynamic> json) {
    return Client(
      json['customerCode'],
      json['customerName'],
      json['customerAddress'],
      json['image'],
      json['logo'],
      json['contact'],
      json['location']
    );
  }
}
