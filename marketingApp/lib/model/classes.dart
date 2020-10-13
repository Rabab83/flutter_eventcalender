
class NewBrand {
  
  final String name;
  final String email;
  final String id;
   
  NewBrand({this.name, this.email, this.id});

  NewBrand.fromMap(Map<String, dynamic> data, String id)
      : name = data["name"],
        email = data['email'],
        id = id;
  
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
    };
  }

  // Map<String, dynamic> updtoMap() {
  //   return {
  //     "name": name,
  //     "email": email,
  //   };
  // }
}


//***************************************************************************//
//***************************************************************************//
               //AccountBreif Class

class AccountBreif {
  final String name;
  final String industry;
  final String aBid;

  AccountBreif({this.name, this.industry, this.aBid});
      // Get Data from firebase
  AccountBreif.fromAccountBreif(Map<String, dynamic> data, String aBid)
      : name = data["name"],
        industry = data['industry'],
        aBid = aBid;
     // Update & Send Data to  firebase
  Map<String, dynamic> toAccountBreif() {
    return {
      "name": name,
      "industry": industry,
    };
  }
    // Initialize Data to null during creating new Brand 
  Map<String, dynamic> initialAccountBreif() {
    return {
      "name": '',
      "industry": '',
            
    };
  }
}
