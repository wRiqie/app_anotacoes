import 'dart:convert';

import '../../data/models/session_model.dart';
import '../constants.dart';
import 'preferences_helper.dart';

class SessionHelper {
  final PreferencesHelper _preferencesHelper;
  SessionModel? _actualSession;

  SessionHelper(this._preferencesHelper);

  Future<void> init() async {
    final sessionString = _preferencesHelper.getString(Constants.actualSession);
    if (sessionString != null) {
      _actualSession = SessionModel.fromMap(jsonDecode(sessionString));
    }
  }

  Future<void> saveSession(
    SessionModel session,
  ) async {
    _actualSession = session;
    _preferencesHelper.setString(
        Constants.actualSession, jsonEncode(session.toMap()));
  }

  bool get isSignedIn => _actualSession != null;

  SessionModel? get actualSession => _actualSession;

  Future<void> signOut() async {
    await _preferencesHelper.remove(Constants.actualSession);
    _actualSession = null;
  }
}
