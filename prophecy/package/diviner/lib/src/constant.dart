String baseUrl = 'https://example.com/whatsit';

class AccountEndPoints {
  static String signIn = '/account/sign-in';
  static String signUp = '/account/sign-up';
  static String signOut = '/account/sign-out';
  static String updatePassword = '/account/settings/update-password';
  static String updateUsername = '/account/settings/update-username';
  static String updateEmailAddress = '/account/settings/update-email-address';
  static String deleteAccount = '/account/settings/delete-account';
  static String updatePicture = '/account/profile/update-picture';
  static String shareList = '/account/profile/armies-lists/share-list/';
  static String unshareList = '/account/profile/armies-lists/unshare-list/';
  static String shareGame = '/account/profile/games/share-game/';
  static String unshareGame = '/account/profile/games/unshare-game/';
  static String shareStatistic = '/account/profile/statistics/share-statistic/';
  static String unshareStatistic =
      '/account/profile/statistics/unshare-statistic/';
  static String createPost = '/account/profile/posts/create-post';
  static String updatePost = '/account/profile/posts/update-post/';
  static String deletePost = '/account/profile/posts/delete-post/';
  static String followUser = '/account/users/follow-user/';
  static String unfollowUser = '/account/users/unfollow-user/';
  static String blockUser = '/account/users/block-user/';
  static String unblockUser = '/account/users/unblock-user/';
  static String getBlockedUser = '/account/users/get-blocked-users/';
}

class EventEndPoints {
  static String createEvent = '/events/create-event';
  static String updateEvent = '/events/update-event/';
  static String deleteEvent = '/events/delete-event/';
  static String saveEvent = '/events/save-event/';
  static String unsaveEvent = '/events/unsave-event/';
  static String getEvent = '/events/get-event/';
  static String getEvents = '/events/get-events';
  static String getSavedEvents = '/events/get-saved-events';
}

class ArmyEndPoints {
  static String getArmies = '/armies/get-armies';
  static String getName(String armyId) => '/armies/$armyId/get-name';
}
