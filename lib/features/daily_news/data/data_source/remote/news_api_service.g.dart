// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NewsApiService implements NewsApiService {
  _NewsApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apiKey': apiKey,
      r'country': country,
      r'category': category,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    
    // Fetching the response
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<HttpResponse<List<ArticleModel>>>(
        Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        ).compose(
          _dio.options,
          '/top-headlines',
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    
    // Print raw response data
    print('Raw response data: ${_result.data}');

    // Parsing the articles
    List<ArticleModel> value = (_result.data!['articles'] as List<dynamic>)
        .map<ArticleModel>((dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    
    // Print parsed articles
    print('Parsed articles: $value');

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
