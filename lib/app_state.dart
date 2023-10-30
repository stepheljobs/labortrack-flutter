import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

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
  }

  List<dynamic> _projectState = [];
  List<dynamic> get projectState => _projectState;
  set projectState(List<dynamic> _value) {
    _projectState = _value;
  }

  void addToProjectState(dynamic _value) {
    _projectState.add(_value);
  }

  void removeFromProjectState(dynamic _value) {
    _projectState.remove(_value);
  }

  void removeAtIndexFromProjectState(int _index) {
    _projectState.removeAt(_index);
  }

  void updateProjectStateAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _projectState[_index] = updateFn(_projectState[_index]);
  }

  void insertAtIndexInProjectState(int _index, dynamic _value) {
    _projectState.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
