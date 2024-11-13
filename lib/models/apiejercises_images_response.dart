import 'dart:convert';
/// count : 317
/// next : "https://wger.de/api/v2/exerciseimage/?exercise=1&language=4&limit=20&offset=20"
/// previous : null
/// eimage : [{"id":3,"uuid":"ef0b00e2-3323-4e7f-88fe-d71ef34b3384","exercise_base":167,"exercise_base_uuid":"b186f1f8-4957-44dc-bf30-d0b00064ce6f","image":"https://wger.de/media/exercise-images/91/Crunches-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":7,"uuid":"bed4f21b-28be-4ef1-bd88-1a4e3db66c5c","exercise_base":427,"exercise_base_uuid":"cbc5fbc9-9bca-4766-941d-4b6903d4a521","image":"https://wger.de/media/exercise-images/93/Decline-crunch-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":11,"uuid":"59efcec2-a7ce-40ba-bf2b-1a6eabe52fbd","exercise_base":301,"exercise_base_uuid":"37f6bd56-815a-4975-99af-05e749fae4b2","image":"https://wger.de/media/exercise-images/128/Hyperextensions-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":15,"uuid":"1c37e4e1-5144-4a50-8294-16180a9bc767","exercise_base":76,"exercise_base_uuid":"3db63138-a047-4a4d-b616-1a0b7dfca105","image":"https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":19,"uuid":"065f9418-6245-46ae-8e24-b4013ce084e4","exercise_base":95,"exercise_base_uuid":"bcb7020c-8678-496d-8f4d-aad0e233a5bd","image":"https://wger.de/media/exercise-images/129/Standing-biceps-curl-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":23,"uuid":"ca71df8e-a6d6-453f-a25a-f4cebae3b970","exercise_base":92,"exercise_base_uuid":"1ae6a28d-10e7-4ecf-af4f-905f8193e2c6","image":"https://wger.de/media/exercise-images/81/Biceps-curl-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":27,"uuid":"7276a19e-06d0-45ae-a2a3-569bed75686b","exercise_base":91,"exercise_base_uuid":"7b99a081-6b1a-4aa5-b86a-5a935d083a35","image":"https://wger.de/media/exercise-images/74/Bicep-curls-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":35,"uuid":"c64a9199-5ad7-4552-abdd-491deb02296a","exercise_base":197,"exercise_base_uuid":"7c8eb1ac-2d7e-4ca7-919a-1848ba38e0f4","image":"https://wger.de/media/exercise-images/83/Bench-dips-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":39,"uuid":"dd0a0445-11cf-45d3-bbd1-6ae0add6b39c","exercise_base":572,"exercise_base_uuid":"72a945ec-3a7f-424b-9a05-1616ef7dce91","image":"https://wger.de/media/exercise-images/151/Dumbbell-shrugs-2.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":43,"uuid":"f22c1928-fc70-4595-b090-af73e7a019fe","exercise_base":571,"exercise_base_uuid":"270e108d-3cd2-45a9-807b-c357317eb15c","image":"https://wger.de/media/exercise-images/150/Barbell-shrugs-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":47,"uuid":"aa574839-4a7e-4c0d-ac72-2f7448478a1c","exercise_base":272,"exercise_base_uuid":"c0d9fe98-f4fe-49f3-8037-05e1984e7d2d","image":"https://wger.de/media/exercise-images/86/Bicep-hammer-curl-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":51,"uuid":"4545b1ab-bf7f-4626-894e-b801047f2fa9","exercise_base":275,"exercise_base_uuid":"04365177-e078-489b-983a-8ac61b7346f1","image":"https://wger.de/media/exercise-images/138/Hammer-curls-with-rope-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":55,"uuid":"f3ea8468-02df-4022-a8ef-17700c98d63c","exercise_base":482,"exercise_base_uuid":"5930ce9c-dfbd-452c-9949-dd34c5e41fd6","image":"https://wger.de/media/exercise-images/195/Push-ups-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":60,"uuid":"ad26f561-e80b-43e2-93ed-07c0fba63a3d","exercise_base":246,"exercise_base_uuid":"95a7e546-e8f8-4521-a76b-983d94161b25","image":"https://wger.de/media/exercise-images/84/Lying-close-grip-triceps-press-to-chin-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":66,"uuid":"a02c9c7d-f42d-43e0-9946-1b99b014daee","exercise_base":268,"exercise_base_uuid":"fb928a58-9e24-4e7b-b714-71a5f759e8d6","image":"https://wger.de/media/exercise-images/116/Good-mornings-2.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":68,"uuid":"08517378-bc36-4f6b-9952-1f45a02d936e","exercise_base":73,"exercise_base_uuid":"3717d144-7815-4a97-9a56-956fb889c996","image":"https://wger.de/media/exercise-images/192/Bench-press-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":73,"uuid":"6c1a7459-266d-491a-bd50-7cbaea2bc771","exercise_base":154,"exercise_base_uuid":"424da49e-d155-4247-bbb2-161a5c797789","image":"https://wger.de/media/exercise-images/181/Chin-ups-2.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":77,"uuid":"94347272-2ea7-407f-9362-cde777bc908d","exercise_base":513,"exercise_base_uuid":"32c129f7-cc28-4ebc-8465-e4fa62e220b1","image":"https://wger.de/media/exercise-images/106/T-bar-row-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":84,"uuid":"63da5c54-7f1d-4a09-9867-2bdda2a6ddeb","exercise_base":83,"exercise_base_uuid":"4af6dbd9-8991-484b-9810-68f117c21edf","image":"https://wger.de/media/exercise-images/109/Barbell-rear-delt-row-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]},{"id":88,"uuid":"90e32fa6-a90d-46b3-8ea8-c9ec8e666eca","exercise_base":525,"exercise_base_uuid":"d9e306b6-d6ff-4e61-b283-4b085d8edaaf","image":"https://wger.de/media/exercise-images/70/Reverse-grip-bent-over-rows-1.png","is_main":true,"style":"1","license":1,"license_title":"","license_object_url":"","license_author":"Everkinetic","license_author_url":"","license_derivative_source_url":"","author_history":[]}]

ApiejercisesImagesResponse apiejercisesImagesResponseFromJson(String str) => ApiejercisesImagesResponse.fromJson(json.decode(str));
String apiejercisesImagesResponseToJson(ApiejercisesImagesResponse data) => json.encode(data.toJson());
class ApiejercisesImagesResponse {
  ApiejercisesImagesResponse({
      num? count, 
      String? next, 
      dynamic previous, 
      List<Eimage>? eimage,}){
    _count = count;
    _next = next;
    _previous = previous;
    _eimage = eimage;
}

  ApiejercisesImagesResponse.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['eimage'] != null) {
      _eimage = [];
      json['eimage'].forEach((v) {
        _eimage?.add(Eimage.fromJson(v));
      });
    }
  }
  num? _count;
  String? _next;
  dynamic _previous;
  List<Eimage>? _eimage;
ApiejercisesImagesResponse copyWith({  num? count,
  String? next,
  dynamic previous,
  List<Eimage>? eimage,
}) => ApiejercisesImagesResponse(  count: count ?? _count,
  next: next ?? _next,
  previous: previous ?? _previous,
  eimage: eimage ?? _eimage,
);
  num? get count => _count;
  String? get next => _next;
  dynamic get previous => _previous;
  List<Eimage>? get eimage => _eimage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['next'] = _next;
    map['previous'] = _previous;
    if (_eimage != null) {
      map['eimage'] = _eimage?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// uuid : "ef0b00e2-3323-4e7f-88fe-d71ef34b3384"
/// exercise_base : 167
/// exercise_base_uuid : "b186f1f8-4957-44dc-bf30-d0b00064ce6f"
/// image : "https://wger.de/media/exercise-images/91/Crunches-1.png"
/// is_main : true
/// style : "1"
/// license : 1
/// license_title : ""
/// license_object_url : ""
/// license_author : ""
/// license_author_url : ""
/// license_derivative_source_url : ""
/// author_history : []

Eimage eimageFromJson(String str) => Eimage.fromJson(json.decode(str));
String eimageToJson(Eimage data) => json.encode(data.toJson());
class Eimage {
  Eimage({
      num? id, 
      String? uuid, 
      num? exerciseBase, 
      String? exerciseBaseUuid, 
      String? image, 
      bool? isMain, 
      String? style, 
      num? license, 
      String? licenseTitle, 
      String? licenseObjectUrl, 
      String? licenseAuthor, 
      String? licenseAuthorUrl, 
      String? licenseDerivativeSourceUrl, 
      List<dynamic>? authorHistory,}){
    _id = id;
    _uuid = uuid;
    _exerciseBase = exerciseBase;
    _exerciseBaseUuid = exerciseBaseUuid;
    _image = image;
    _isMain = isMain;
    _style = style;
    _license = license;
    _licenseTitle = licenseTitle;
    _licenseObjectUrl = licenseObjectUrl;
    _licenseAuthor = licenseAuthor;
    _licenseAuthorUrl = licenseAuthorUrl;
    _licenseDerivativeSourceUrl = licenseDerivativeSourceUrl;
    _authorHistory = authorHistory;
}

  Eimage.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _exerciseBase = json['exercise_base'];
    _exerciseBaseUuid = json['exercise_base_uuid'];
    _image = json['image'];
    _isMain = json['is_main'];
    _style = json['style'];
    _license = json['license'];
    _licenseTitle = json['license_title'];
    _licenseObjectUrl = json['license_object_url'];
    _licenseAuthor = json['license_author'];
    _licenseAuthorUrl = json['license_author_url'];
    _licenseDerivativeSourceUrl = json['license_derivative_source_url'];
    if (json['author_history'] != null) {
      _authorHistory = [];
      json['author_history'].forEach((v) {
        _authorHistory?.add(v as String); // Agrega 'v' como cadena
      });
    }
  }
  num? _id;
  String? _uuid;
  num? _exerciseBase;
  String? _exerciseBaseUuid;
  String? _image;
  bool? _isMain;
  String? _style;
  num? _license;
  String? _licenseTitle;
  String? _licenseObjectUrl;
  String? _licenseAuthor;
  String? _licenseAuthorUrl;
  String? _licenseDerivativeSourceUrl;
  List<dynamic>? _authorHistory;
Eimage copyWith({  num? id,
  String? uuid,
  num? exerciseBase,
  String? exerciseBaseUuid,
  String? image,
  bool? isMain,
  String? style,
  num? license,
  String? licenseTitle,
  String? licenseObjectUrl,
  String? licenseAuthor,
  String? licenseAuthorUrl,
  String? licenseDerivativeSourceUrl,
  List<dynamic>? authorHistory,
}) => Eimage(  id: id ?? _id,
  uuid: uuid ?? _uuid,
  exerciseBase: exerciseBase ?? _exerciseBase,
  exerciseBaseUuid: exerciseBaseUuid ?? _exerciseBaseUuid,
  image: image ?? _image,
  isMain: isMain ?? _isMain,
  style: style ?? _style,
  license: license ?? _license,
  licenseTitle: licenseTitle ?? _licenseTitle,
  licenseObjectUrl: licenseObjectUrl ?? _licenseObjectUrl,
  licenseAuthor: licenseAuthor ?? _licenseAuthor,
  licenseAuthorUrl: licenseAuthorUrl ?? _licenseAuthorUrl,
  licenseDerivativeSourceUrl: licenseDerivativeSourceUrl ?? _licenseDerivativeSourceUrl,
  authorHistory: authorHistory ?? _authorHistory,
);
  num? get id => _id;
  String? get uuid => _uuid;
  num? get exerciseBase => _exerciseBase;
  String? get exerciseBaseUuid => _exerciseBaseUuid;
  String? get image => _image;
  bool? get isMain => _isMain;
  String? get style => _style;
  num? get license => _license;
  String? get licenseTitle => _licenseTitle;
  String? get licenseObjectUrl => _licenseObjectUrl;
  String? get licenseAuthor => _licenseAuthor;
  String? get licenseAuthorUrl => _licenseAuthorUrl;
  String? get licenseDerivativeSourceUrl => _licenseDerivativeSourceUrl;
  List<dynamic>? get authorHistory => _authorHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['exercise_base'] = _exerciseBase;
    map['exercise_base_uuid'] = _exerciseBaseUuid;
    map['image'] = _image;
    map['is_main'] = _isMain;
    map['style'] = _style;
    map['license'] = _license;
    map['license_title'] = _licenseTitle;
    map['license_object_url'] = _licenseObjectUrl;
    map['license_author'] = _licenseAuthor;
    map['license_author_url'] = _licenseAuthorUrl;
    map['license_derivative_source_url'] = _licenseDerivativeSourceUrl;
    if (_authorHistory != null) {
      map['author_history'] = _authorHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}