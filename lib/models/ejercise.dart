class Ejercise  {
  String _id;
  String _name;
  int _duration;
  bool _isTroncosuperiorE;
  bool _isTroncoInferiroE;
  bool _Lunes;
  bool _Martes;
  bool _Miercoles;
  bool _Jueves;
  bool _Viernes;
  bool _Sabado;
  bool _Domingo;
  String _level;
  String _intensity;
  String _urlPicture;

  Map<String, dynamic> toJson() => {
    "id": _id,
    "name": _name,
    "duration": _duration,
    "isTroncosuperiorF": _isTroncosuperiorE,
    "isTroncoInferiro": _isTroncoInferiroE,
    "Lunes": _Lunes,
    "Martes": _Martes,
    "Miercoles": _Miercoles,
    "Jueves": _Jueves,
    "Viernes": _Viernes,
    "Sabado": _Sabado,
    "Domingo": _Domingo,
    "level": _level,
    "intensity": _intensity,
    "urlPicture": _urlPicture,

  };

  Ejercise(
      this._id,
      this._name,
      this._duration,
      this._isTroncosuperiorE,
      this._isTroncoInferiroE,
      this._Lunes,
      this._Martes,
      this._Miercoles,
      this._Jueves,
      this._Viernes,
      this._Sabado,
      this._Domingo,
      this._level,
      this._intensity,
      this._urlPicture);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get intensity => _intensity;

  set intensity(String value) {
    _intensity = value;
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  bool get Domingo => _Domingo;

  set Domingo(bool value) {
    _Domingo = value;
  }

  bool get Sabado => _Sabado;

  set Sabado(bool value) {
    _Sabado = value;
  }

  bool get Viernes => _Viernes;

  set Viernes(bool value) {
    _Viernes = value;
  }

  bool get Jueves => _Jueves;

  set Jueves(bool value) {
    _Jueves = value;
  }

  bool get Miercoles => _Miercoles;

  set Miercoles(bool value) {
    _Miercoles = value;
  }

  bool get Martes => _Martes;

  set Martes(bool value) {
    _Martes = value;
  }

  bool get Lunes => _Lunes;

  set Lunes(bool value) {
    _Lunes = value;
  }

  bool get isTroncoInferiro => _isTroncoInferiroE;

  set isTroncoInferiro(bool value) {
    _isTroncoInferiroE = value;
  }

  bool get isTroncosuperiorF => _isTroncosuperiorE;

  set isTroncosuperiorF(bool value) {
    _isTroncosuperiorE = value;
  }

  int get duration => _duration;

  set duration(int value) {
    _duration = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get urlPicture => _urlPicture;

  set urlPicture(String value) {
    _urlPicture = value;
  }
}