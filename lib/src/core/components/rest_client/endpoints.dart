abstract final class Endpoints {
  Endpoints._();

  // auth
  static const initialPost = '/discover/3';
  static const login = '/auth';
  static const signup = '/auth';
  static const signupConfirm = '/auth';
  static const refreshToken = '/auth';

  // discover
  static const discoverNewToday = '/discover';
  static const discoverBrowseAll = '/all';
  static const discoverSinglePostPreview = '/discover/';
  // search
  static const search = '/all';
  // chats
  static const chats = '/chats';
  static const singleChat = '$chats/';
  // profile
  static const profile = '/profile';
  static const profileImages = '/all';
}
