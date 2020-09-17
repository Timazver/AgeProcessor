// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoRequest _$InfoRequestFromJson(Map<String, dynamic> json) {
  return InfoRequest(
    code: json['code'] as String,
    id: json['id'] as String,
  )
    ..endpoint = json['endpoint'] as String
    ..headers = Map<String, String>.from(json['headers'] as Map)
    ..method = _$enumDecode(_$HttpMethodEnumMap, json['method']);
}

Map<String, dynamic> _$InfoRequestToJson(InfoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'endpoint': instance.endpoint,
      'headers': instance.headers,
      'method': _$HttpMethodEnumMap[instance.method],
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$HttpMethodEnumMap = <HttpMethod, dynamic>{
  HttpMethod.GET: 'GET',
  HttpMethod.POST: 'POST',
  HttpMethod.PUT: 'PUT',
  HttpMethod.DELETE: 'DELETE'
};
