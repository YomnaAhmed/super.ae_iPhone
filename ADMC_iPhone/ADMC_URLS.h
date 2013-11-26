//
//  ADMC_URLS.h
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/26/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADMC_URLS : NSObject

//GetBaseURL....
+ (NSString *)getBaseURL;

// Get the URL of the authentication....
+ (NSString *)getAuthenticationURL;//:(NSString *)userName andUserPassword:(NSString *)userPassword;

// Get the getFeaturesArticles....
+ (NSString *)getFeaturesArticlesURL:(NSString *)authToken;

// Get the getSearchArticles....
+ (NSString *)getSearchArticlesURL:(NSString *)authToken andKeyWord:(NSString *)searchKeyWord;

// Get the getArticleDetails....
+ (NSString *)getArticleDetailsURL:(NSString *)authToken andArticleID:(NSString *)articleID;


//Get the ArticleFromCategoryURL ....
+ (NSString *)getArticleFromCategoryURL:(NSString *)authToken andCategoryID:(NSString *)categoryID andPageNumber:(int)pageNumber;

//Get the getAddCommentURL......
+ (NSString *)getAddCommentURL;//:(NSString * )authToken andPostID:(NSString *)postID andUserName:(NSString *)userName
                 // andUserEmail:(NSString *)userEmail andContent:(NSString *)commentContent;


//GetAllPhotosAlbumsURL.....
+ (NSString *)getAllPhotoAlbumsURL:(NSString *)authToken;

//GetPhotoAlbumURL....
+ (NSString *)getPhotoAlbumURL:(NSString *)authToken andAlbumID:(NSString *)photoAlbumID;


//GetAllVideoAlbumsURL.....
+ (NSString *)getAllVideoAlbumsURL:(NSString *)authToken;

//GetVideoAlbumURL....
+ (NSString *)getVideoAlbumURL:(NSString *)authToken andVideoAlbumID:(NSString *)videoAlbumID;

//GetAllQuizzesURL....
+ (NSString *)getALLQuizzesURL:(NSString *)authToken;

//GetQuizDetailsURL....
+ (NSString *)getQuizDetailsURL:(NSString *)authToken andQuizID:(NSString *)quizID;

//GetAllLeaguesURL....
+ (NSString *)getAllLeaguesURL:(NSString *)authToken;

//GetLeagueDetailsURL....
+ (NSString *)getLeagueDetailsURL:(NSString *)authToken andLeagueID:(NSString *)leagueID;

//GetMatchesURL......
+ (NSString *)getMatchesURL:(NSString *)authToken andMatchDate:(NSString *)matchDate;


//GetAllCompitionMatchesURL....
+ (NSString *)getAllCompitionMatchesURL:(NSString *)authToken andCompitionID:(NSString *)compitionID
                          andWeekNumber:(int)weekNumber;

//GetLiveMatchesURL.....
+ (NSString *)getLiveMatchesURL:(NSString *)authToken andIsLive:(BOOL)isLive;

//GetTopScorersURL......
+ (NSString *)getTopScorersURL:(NSString *)authToken andCompitionID:(NSString *)compitionID;

//GetALLTablesForCompitionURL....
+ (NSString *)getALLTablesForCompitionURL:(NSString *)authToken andCompitionID:(NSString *)compitionID;

//GetMatchDetailsURL....
+ (NSString *)getMatchDetailsURL:(NSString *)matchID;


@end
