import 'package:ep_fv2/modules/api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USERNAME = "UC_USERNAME";
const PASSWORD = "UC_PASSWORD";
const USER_ID = "UC_USER_ID";
const TOKEN = "UC_TOKEN";
const TOKEN_DATETIME = "UC_TOKEN_DATETIME";

class UserCredentialController extends GetxController {
  final isInitializing = true.obs;
  final username = ''.obs;

  String? _username, _password, _userId, _token;
  DateTime? _tokenDatetime;
  bool isLogged = false;
  late SharedPreferences _sp;

  @override
  void onInit() async {
    super.onInit();
    ever(isInitializing, (_) {
      if (isLogged) {
        Get.offAllNamed("/");
      } else {
        Get.offAllNamed("/login");
      }
    });
    await Future.delayed(Duration(seconds: 1));
    _sp = await SharedPreferences.getInstance();
    _username = _sp.getString(USERNAME) ?? null;
    _password = _sp.getString(PASSWORD) ?? null;
    _userId = _sp.getString(USER_ID) ?? null;
    _token = _sp.getString(TOKEN) ?? null;

    final dtStr = _sp.getString(TOKEN_DATETIME) ?? null;

    if (_username != null && _password != null && _token != null && dtStr != null) {
      username.value = _username!;
      _tokenDatetime = DateTime.parse(dtStr);
      isLogged = true;
    }
    isInitializing.value = false;
  }

  Future<void> setCredentialInfo(String un, String pw) async {
    _username = un;
    _password = pw;
    this.username.value = _username!;
    await _sp.setString(USERNAME, un);
    await _sp.setString(PASSWORD, pw);
  }

  Future<void> setUserInfo(String userId) async {
    _userId = userId;
    await _sp.setString(USER_ID, userId);
  }

  Future<void> setToken(String token) async {
    _token = token;
    _tokenDatetime = DateTime.now();
    await _sp.setString(TOKEN, token);
    await _sp.setString(TOKEN_DATETIME, _tokenDatetime.toString());
  }

  Future<void> retrieveToken({String? un, String? pw}) async {
    un = un ?? _username;
    pw = pw ?? _password;

    final res = await Api().dioToken.post('/api/auth/token/', data: {
      'username': un,
      'password': pw,
    });

    await setToken(res.data['access']);
    await setCredentialInfo(un!, pw!);
  }

  Future<void> retrieveUserInfo() async {
    final userProfileRes = await Api().dio.get('/api/auth/profile/');
    final userId = userProfileRes.data['profile']['id'].toString();
    await setUserInfo(userId);
  }

  /// Refresh token if exceed 5 min
  Future<String> getToken() async {
    final exceed = DateTime.now().difference(_tokenDatetime!).inMinutes;
    if (exceed > 5) {
      print("-----------------------------");
      print("Exceed $exceed minutes, token is refreshing");
      print("-----------------------------");
      await retrieveToken();
      print("-----------------------------");
      print("New token is retrieved");
      print("-----------------------------");
      return _token!;
    } else {
      return _token!;
    }
  }

  Future<void> signOut() async {
    _username = null;
    _password = null;
    _userId = null;
    _token = null;
    _tokenDatetime = null;
    await _sp.remove(USERNAME);
    await _sp.remove(PASSWORD);
    await _sp.remove(USER_ID);
    await _sp.remove(TOKEN);
    await _sp.remove(TOKEN_DATETIME);
    isLogged = false;
    Get.offAllNamed("/login");
  }
}
