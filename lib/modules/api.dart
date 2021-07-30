import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ep_fv2/controllers/utils/network.dart';
import 'package:ep_fv2/controllers/utils/user_credential.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

const BASE_LOCAL_URL = "http://192.168.8.6";
//TODO AUTO change url when in development mode
const BASE_GLOBAL_URL = "http://192.168.9.30:8000";
// const BASE_GLOBAL_URL = "http://epgroup.dyndns.org:5031";
const CONNECT_TIMEOUT = 5000;
const RECEIVE_TIMEOUT = 3000;

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class Api {
  late Dio _dioLocal, _dioGlobal;
  late Dio _dioTokenLocal, _dioTokenGlobal;

  static final _instance = Api._internal();

  factory Api() => _instance;

  Api._internal() {
    _dioLocal = Dio();
    _dioLocal.options.baseUrl = BASE_LOCAL_URL;
    _dioLocal.options.connectTimeout = CONNECT_TIMEOUT;
    _dioLocal.options.receiveTimeout = RECEIVE_TIMEOUT;
    (_dioLocal.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
    _dioLocal.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        _dioLocal.interceptors.requestLock.lock();
        _dioLocal.interceptors.responseLock.lock();

        String token = await Get.find<UserCredentialController>().getToken();
        options.headers["Authorization"] = "Bearer $token";
        handler.next(options);

        _dioLocal.interceptors.requestLock.unlock();
        _dioLocal.interceptors.responseLock.unlock();
      }),
    );
    //_dioLocal.interceptors.add(LogInterceptor());

    _dioGlobal = Dio();
    _dioGlobal.options.baseUrl = BASE_GLOBAL_URL;
    _dioGlobal.options.connectTimeout = CONNECT_TIMEOUT;
    _dioGlobal.options.receiveTimeout = RECEIVE_TIMEOUT;
    (_dioGlobal.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
    _dioGlobal.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        _dioGlobal.interceptors.requestLock.lock();
        _dioGlobal.interceptors.responseLock.lock();

        String token = await Get.find<UserCredentialController>().getToken();
        options.headers["Authorization"] = "Bearer $token";
        handler.next(options);

        _dioGlobal.interceptors.requestLock.unlock();
        _dioGlobal.interceptors.responseLock.unlock();
      }),
    );
    //_dioGlobal.interceptors.add(LogInterceptor());

    _dioTokenLocal = Dio();
    _dioTokenLocal.options.baseUrl = BASE_LOCAL_URL;
    _dioTokenLocal.options.connectTimeout = CONNECT_TIMEOUT;
    _dioTokenLocal.options.receiveTimeout = RECEIVE_TIMEOUT;
    (_dioTokenLocal.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;

    _dioTokenGlobal = Dio();
    _dioTokenGlobal.options.baseUrl = BASE_GLOBAL_URL;
    _dioTokenGlobal.options.connectTimeout = CONNECT_TIMEOUT;
    _dioTokenGlobal.options.receiveTimeout = RECEIVE_TIMEOUT;
    (_dioTokenGlobal.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
  }

  Dio get dio {
    if (Get.find<NetworkController>().isLocal) {
      return _dioLocal;
    }
    return _dioGlobal;
  }

  Dio get dioToken {
    if (Get.find<NetworkController>().isLocal) {
      return _dioTokenLocal;
    }
    return _dioTokenGlobal;
  }
}
