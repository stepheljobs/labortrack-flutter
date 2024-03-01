import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _errorimage = prefs.getString('ff_errorimage') ?? _errorimage;
    });
    _safeInit(() {
      _isShow = prefs.getBool('ff_isShow') ?? _isShow;
    });
    _safeInit(() {
      _TimeInAllAttendance =
          prefs.getStringList('ff_TimeInAllAttendance') ?? _TimeInAllAttendance;
    });
    _safeInit(() {
      _setDay = prefs.getString('ff_setDay') ?? _setDay;
    });
    _safeInit(() {
      _TimeOutAllAttendance = prefs.getStringList('ff_TimeOutAllAttendance') ??
          _TimeOutAllAttendance;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_apiUserData')) {
        try {
          _apiUserData = jsonDecode(prefs.getString('ff_apiUserData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isGenerate = false;
  bool get isGenerate => _isGenerate;
  set isGenerate(bool _value) {
    _isGenerate = _value;
  }

  String _filteredDate = '';
  String get filteredDate => _filteredDate;
  set filteredDate(String _value) {
    _filteredDate = _value;
  }

  bool _connected = false;
  bool get connected => _connected;
  set connected(bool _value) {
    _connected = _value;
  }

  String _errorimage = '';
  String get errorimage => _errorimage;
  set errorimage(String _value) {
    _errorimage = _value;
    prefs.setString('ff_errorimage', _value);
  }

  bool _isShow = true;
  bool get isShow => _isShow;
  set isShow(bool _value) {
    _isShow = _value;
    prefs.setBool('ff_isShow', _value);
  }

  List<String> _checkTimeInAttendance = [];
  List<String> get checkTimeInAttendance => _checkTimeInAttendance;
  set checkTimeInAttendance(List<String> _value) {
    _checkTimeInAttendance = _value;
  }

  void addToCheckTimeInAttendance(String _value) {
    _checkTimeInAttendance.add(_value);
  }

  void removeFromCheckTimeInAttendance(String _value) {
    _checkTimeInAttendance.remove(_value);
  }

  void removeAtIndexFromCheckTimeInAttendance(int _index) {
    _checkTimeInAttendance.removeAt(_index);
  }

  void updateCheckTimeInAttendanceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkTimeInAttendance[_index] = updateFn(_checkTimeInAttendance[_index]);
  }

  void insertAtIndexInCheckTimeInAttendance(int _index, String _value) {
    _checkTimeInAttendance.insert(_index, _value);
  }

  List<String> _TimeInAllAttendance = [];
  List<String> get TimeInAllAttendance => _TimeInAllAttendance;
  set TimeInAllAttendance(List<String> _value) {
    _TimeInAllAttendance = _value;
    prefs.setStringList('ff_TimeInAllAttendance', _value);
  }

  void addToTimeInAllAttendance(String _value) {
    _TimeInAllAttendance.add(_value);
    prefs.setStringList('ff_TimeInAllAttendance', _TimeInAllAttendance);
  }

  void removeFromTimeInAllAttendance(String _value) {
    _TimeInAllAttendance.remove(_value);
    prefs.setStringList('ff_TimeInAllAttendance', _TimeInAllAttendance);
  }

  void removeAtIndexFromTimeInAllAttendance(int _index) {
    _TimeInAllAttendance.removeAt(_index);
    prefs.setStringList('ff_TimeInAllAttendance', _TimeInAllAttendance);
  }

  void updateTimeInAllAttendanceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _TimeInAllAttendance[_index] = updateFn(_TimeInAllAttendance[_index]);
    prefs.setStringList('ff_TimeInAllAttendance', _TimeInAllAttendance);
  }

  void insertAtIndexInTimeInAllAttendance(int _index, String _value) {
    _TimeInAllAttendance.insert(_index, _value);
    prefs.setStringList('ff_TimeInAllAttendance', _TimeInAllAttendance);
  }

  String _setDay = '';
  String get setDay => _setDay;
  set setDay(String _value) {
    _setDay = _value;
    prefs.setString('ff_setDay', _value);
  }

  List<String> _checkTimeOutAttendance = [];
  List<String> get checkTimeOutAttendance => _checkTimeOutAttendance;
  set checkTimeOutAttendance(List<String> _value) {
    _checkTimeOutAttendance = _value;
  }

  void addToCheckTimeOutAttendance(String _value) {
    _checkTimeOutAttendance.add(_value);
  }

  void removeFromCheckTimeOutAttendance(String _value) {
    _checkTimeOutAttendance.remove(_value);
  }

  void removeAtIndexFromCheckTimeOutAttendance(int _index) {
    _checkTimeOutAttendance.removeAt(_index);
  }

  void updateCheckTimeOutAttendanceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkTimeOutAttendance[_index] = updateFn(_checkTimeOutAttendance[_index]);
  }

  void insertAtIndexInCheckTimeOutAttendance(int _index, String _value) {
    _checkTimeOutAttendance.insert(_index, _value);
  }

  List<String> _TimeOutAllAttendance = [];
  List<String> get TimeOutAllAttendance => _TimeOutAllAttendance;
  set TimeOutAllAttendance(List<String> _value) {
    _TimeOutAllAttendance = _value;
    prefs.setStringList('ff_TimeOutAllAttendance', _value);
  }

  void addToTimeOutAllAttendance(String _value) {
    _TimeOutAllAttendance.add(_value);
    prefs.setStringList('ff_TimeOutAllAttendance', _TimeOutAllAttendance);
  }

  void removeFromTimeOutAllAttendance(String _value) {
    _TimeOutAllAttendance.remove(_value);
    prefs.setStringList('ff_TimeOutAllAttendance', _TimeOutAllAttendance);
  }

  void removeAtIndexFromTimeOutAllAttendance(int _index) {
    _TimeOutAllAttendance.removeAt(_index);
    prefs.setStringList('ff_TimeOutAllAttendance', _TimeOutAllAttendance);
  }

  void updateTimeOutAllAttendanceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _TimeOutAllAttendance[_index] = updateFn(_TimeOutAllAttendance[_index]);
    prefs.setStringList('ff_TimeOutAllAttendance', _TimeOutAllAttendance);
  }

  void insertAtIndexInTimeOutAllAttendance(int _index, String _value) {
    _TimeOutAllAttendance.insert(_index, _value);
    prefs.setStringList('ff_TimeOutAllAttendance', _TimeOutAllAttendance);
  }

  dynamic _apiUserData;
  dynamic get apiUserData => _apiUserData;
  set apiUserData(dynamic _value) {
    _apiUserData = _value;
    prefs.setString('ff_apiUserData', jsonEncode(_value));
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
