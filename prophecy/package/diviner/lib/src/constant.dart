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
  static String shareList(String listId) =>
      '/account/profile/armies-lists/share-list/$listId';
  static String unshareList(String listId) =>
      '/account/profile/armies-lists/unshare-list/$listId';
  static String shareGame(String gameId) =>
      '/account/profile/armies-lists/share-list/$gameId';
  static String unshareGame(String gameId) =>
      '/account/profile/armies-lists/unshare-list/$gameId';
  static String shareStatistic(String statisticId) =>
      '/account/profile/statistics/share-statistic/$statisticId';
  static String unshareStatistic(String statisticId) =>
      '/account/profile/statistics/unshare-statistic/$statisticId';
  static String createPost = '/account/profile/posts/create-post';
  static String updatePost(String postId) =>
      '/account/profile/posts/update-post/$postId';
  static String deletePost(String postId) =>
      '/account/profile/posts/delete-post/$postId';
  static String followUser(String userId) =>
      '/account/users/follow-user/$userId';
  static String unfollowUser(String userId) =>
      '/account/users/unfollow-user/$userId';
  static String blockUser(String userId) => '/account/users/block-user/$userId';
  static String unblockUser(String userId) =>
      '/account/users/unblock-user/$userId';
  static String getBlockedUser(String userId) =>
      '/account/users/get-blocked-users/$userId';
}

class EventEndPoints {
  static String createEvent = '/events/create-event';
  static String updateEvent(String eventId) => '/events/update-event/$eventId';
  static String deleteEvent(String eventId) => '/events/delete-event/$eventId';
  static String saveEvent(String eventId) => '/events/save-event/$eventId';
  static String unsaveEvent(String eventId) => '/events/unsave-event/$eventId';
  static String getEvent(String eventId) => '/events/get-event/$eventId';
  static String getEvents = '/events/get-events';
  static String getSavedEvents = '/events/get-saved-events';
}

class ArmyEndPoints {
  static String getArmies = '/armies/get-armies';
  static String getName(String armyId) => '/armies/$armyId/get-name';
  static String getOrganisations(String armyId) =>
      '/armies/$armyId/get-organisation';
  static String getUnits(String armyId) => '/armies/$armyId/units/get-units';
  static String getUnit(String armyId, String unitId) =>
      '/armies/$armyId/units/get-unit/$unitId';
  static String getUnitModifiers(String armyId, String unitId) =>
      '/armies/$armyId/units/get-unit/$unitId/modifiers/get-modifiers';
  static String getUnitModifier(
          String armyId, String unitId, String modifierId) =>
      '/armies/$armyId/units/get-unit/$unitId/modifiers/get-modifier/$modifierId';
  static String getArmyModifiers(String armyId) =>
      '/armies/$armyId/modifiers/get-modifiers';
  static String getArmyModifier(String armyId, modifierId) =>
      '/armies/$armyId/modifiers/get-modifier/$modifierId';
  static String getRules(String armyId) => '/armies/$armyId/rules/get-rules';
  static String getRule(String armyId, String ruleId) =>
      '/armies/$armyId/rules/get-rule/$ruleId';
}

class ProphecyEndPoints {
  static String getProphecy = '/prophecies/get-prophecy';
  static String getHistory = '/prophecies/get-history';
}

class GameEndPoints {
  static String createGame = '/games/create-game';
  static String updateGame(String gameId) => '/games/update-game/$gameId';
  static String deleteGame(String gameId) => '/games/delete/$gameId';
  static String getGames = '/games/get-games';
  static String getGame(String gameId) => '/games/get-game/$gameId';
}

class UserEndPoints {
  static String getUsers = '/users/get-users';
  static String getUser(String userId) => '/users/get-user/$userId';
  static String getSharedGames(String userId) =>
      '/users/$userId/profile/games/get-shared-games';
  static String getSharedGame(String userId, String gameId) =>
      '/users/$userId/profile/games/get-shared-game/$gameId';
  static String getSharedLists(String userId) =>
      '/users/$userId/profile/armies-lists/get-shared-lists';
  static String getSharedList(String userId, String listId) =>
      '/users/$userId/profile/armies-lists/get-shared-list/$listId';
  static String getPosts(String userId) =>
      '/users/$userId/profile/posts/get-posts';
  static String getPostPicture(String postId) =>
      '/users/profile/pictures/get-post/$postId';
  static String getFollowers(String userId) =>
      '/users/$userId/profile/get-followers';
  static String getFollowedUsers(String userId) =>
      '/users/$userId/profile/get-followed-users';
}

class LocationEndPoints {
  static String createLocation = '/locations/create-statistic';
  static String updateLocation(String locationId) =>
      '/locations/update-location/$locationId';
  static String deleteLocation(String locationId) =>
      '/locations/delete-location/$locationId';
  static String getLocations = '/locations/get-statistics';
  static String getLocation(String locationId) =>
      '/locations/get-location/$locationId';
  static String getLocationEvents(String locationId) =>
      '/locations/$locationId/events/get-events';
}

class StatisticEndPoints {
  static String createStatistic = '/statistics/create-statistic';
  static String getStatistics = '/statistics/get-statistics';
  static String getStatistic(String statisticId) =>
      '/statistics/get-statistic/$statisticId';
  static String deleteStatistic(String statisticId) =>
      '/statistics/delete-statistic/$statisticId';
}
