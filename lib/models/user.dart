class User {
  var _uid;
  var _name;
  var _email;
  var _password;
  var _weight;
  var _genre;
  var _isTroncosuperiorF;
  var _isTroncoInferiro;
  var _isCardio;
  var _level;
  var _bornDate;
  var _city;

  User.Empty();

  Map<String, dynamic> toJson() => {
    "uid": _uid,
    "name": _name,
    "email": _email,
    "password": _password,
    "weight": _weight,
    "genre": _genre,
    "isTroncosuperiorF": _isTroncosuperiorF,
    "isTroncoInferiro": _isTroncoInferiro,
    "isCardio": _isCardio,
    "level": _level,
    "bornDate": _bornDate,
    "city": _city,
  };

  User.fromJson(Map<String, dynamic> json)
      : _uid=json['uid'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _weight = json['weight'],
        _genre = json['genre'],
        _isTroncosuperiorF = json['isTroncosuperiorF'],
        _isTroncoInferiro = json['isTroncoInferiro'],
        _isCardio = json['isCardio'],
        _level = json['level'],
        _bornDate = json['bornDate'],
        _city = json['city'];

  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }


  get level => _level;

  set level(value) {
    _level = value;
  }

  get isCardio => _isCardio;

  set isCardio(value) {
    _isCardio = value;
  }

  get isTroncoInferiro => _isTroncoInferiro;

  set isTroncoInferiro(value) {
    _isTroncoInferiro = value;
  }

  get isTroncosuperiorF => _isTroncosuperiorF;

  set isTroncosuperiorF(value) {
    _isTroncosuperiorF = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }

  User(
      this._uid,
      this._name,
      this._email,
      this._password,
      this. _weight,
      this._genre,
      this._isTroncosuperiorF,
      this._isTroncoInferiro,
      this._isCardio,
      this._level,
      this._bornDate,
      this._city);

  get city => _city;

  set city(value) {
    _city = value;
  }

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  get weight => _weight;

  set weight(value) {
    _weight = value;
  }
}