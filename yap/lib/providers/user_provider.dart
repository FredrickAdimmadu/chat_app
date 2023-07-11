import 'package:flutter/widgets.dart';
import 'package:yap/models/chat_user.dart';
import 'package:yap/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  ChatUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  ChatUser get getUser => _user ?? ChatUser(
    image: '',
    about: '',
    name: '',
    createdAt: '',
    isOnline: false,
    id: '',
    lastActive: '',
    email: '',
    pushToken: '',
    number: '',
    relationship: '',
    country: '',
    gender: '',
    language: '',
    website: '',
    followers: [],
    following: [],
    password: '',
    updatePassword: '',
    description: '',
    file: '',
    profImage: '',
    postId: '',
    postUrl: '',
    likes: '',
    datePublished: '',
    commentId: '',
    text: '',
    caption: '',
  );

  Future<void> refreshUser() async {
    ChatUser user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
