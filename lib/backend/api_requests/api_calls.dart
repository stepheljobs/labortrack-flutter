import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetLocationAPICall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? long,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLocationAPI',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${long}&key=AIzaSyBdgtkFEFeHIqfOA15dPwyz2X-GMgYqy2U',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? currentAddress(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetUserDataCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserData',
      apiUrl: 'https://iztwpzhalxhzwmkuiqae.supabase.co/rest/v1/users',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6dHdwemhhbHhoendta3VpcWFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQzNDk5ODgsImV4cCI6MjAxOTkyNTk4OH0.UvOS-q-jPsTcaZCxqEmjGAFP3dITckzO4VznBWhhv6M',
      },
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
