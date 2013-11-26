//
//  ADMC_URLS.m
//  ADMC_iPhone
//
//  Created by Yomna Ahmed on 11/26/13.
//  Copyright (c) 2013 Sarmady. All rights reserved.
//

#import "ADMC_URLS.h"

@implementation ADMC_URLS

//GetBaseURL....
+ (NSString *)getBaseURL{

     return @"http://www.super.ae/api/";

}


// Get the URL of the authentication....
+ (NSString *)getAuthenticationURL{//:(NSString *)userName andUserPassword:(NSString *)userPassword{
  
     return  [NSString stringWithFormat:@"%@authenticate",[self getBaseURL]];
 
}

// Get the getFeaturesArticles....
+ (NSString *)getFeaturesArticlesURL:(NSString *)authToken{

     return  [NSString stringWithFormat:@"%@articles/feature?auth_token=%@",[self getBaseURL],authToken];
}

// Get the getSearchArticles....
+ (NSString *)getSearchArticlesURL:(NSString *)authToken andKeyWord:(NSString *)searchKeyWord{
   
     return  [NSString stringWithFormat:@"%@articles/search?auth_token=%@&q=%@",[self getBaseURL],authToken,searchKeyWord];
}

// Get the getArticleDetails....
+ (NSString *)getArticleDetailsURL:(NSString *)authToken andArticleID:(NSString *)articleID{

     return  [NSString stringWithFormat:@"%@articles/details?auth_token=%@&id=%@",[self getBaseURL],authToken,articleID];

}


//Get the ArticleFromCategoryURL ....
+ (NSString *)getArticleFromCategoryURL:(NSString *)authToken andCategoryID:(NSString *)categoryID andPageNumber:(int)pageNumber{
    return  [NSString stringWithFormat:@"%@articles/category?auth_token=%@&id=%@&page=%d",
            [self getBaseURL],authToken,categoryID,pageNumber];
}

//Get the getAddCommentURL......
+ (NSString *)getAddCommentURL{ //:(NSString * )authToken andPostID:(NSString *)postID andUserName:(NSString *)userName
                 // andUserEmail:(NSString *)userEmail andContent:(NSString *)commentContent{

    return [NSString stringWithFormat:@"%@comment",[self getBaseURL]];
}


//GetAllPhotosAlbumsURL.....
+ (NSString *)getAllPhotoAlbumsURL:(NSString *)authToken{
    return [NSString stringWithFormat:@"%@photos?auth_token=%@",[self getBaseURL],authToken];
}

//GetPhotoAlbumURL....
+ (NSString *)getPhotoAlbumURL:(NSString *)authToken andAlbumID:(NSString *)photoAlbumID{
  return [NSString stringWithFormat:@"%@photo?auth_token=%@&id=%@",[self getBaseURL],authToken,photoAlbumID];
}


//GetAllVideoAlbumsURL.....
+ (NSString *)getAllVideoAlbumsURL:(NSString *)authToken{
    
  return [NSString stringWithFormat:@"%@videos?auth_token=%@",[self getBaseURL],authToken];

}

//GetVideoAlbumURL....
+ (NSString *)getVideoAlbumURL:(NSString *)authToken andVideoAlbumID:(NSString *)videoAlbumID{
   return [NSString stringWithFormat:@"%@video?auth_token=%@&id=%@",[self getBaseURL],authToken,videoAlbumID];
}

//GetAllQuizzesURL....
+ (NSString *)getALLQuizzesURL:(NSString *)authToken{
    return [NSString stringWithFormat:@"%@quiz?auth_token=%@",[self getBaseURL],authToken];
}

//GetQuizDetailsURL....
+ (NSString *)getQuizDetailsURL:(NSString *)authToken andQuizID:(NSString *)quizID{
   
    return [NSString stringWithFormat:@"%@quiz?auth_token=%@&id=%@",[self getBaseURL],authToken,quizID];
}

//GetAllLeaguesURL....
+ (NSString *)getAllLeaguesURL:(NSString *)authToken{
   return [NSString stringWithFormat:@"%@matchcenter/api_all_leagues.php?auth_token=%@",[self getBaseURL],authToken];
}

//GetLeagueDetailsURL....
+ (NSString *)getLeagueDetailsURL:(NSString *)authToken andLeagueID:(NSString *)leagueID{

   return [NSString stringWithFormat:@"%@matchcenter/api_all_leagues.php?compid=%@&auth_token=%@",[self getBaseURL],leagueID,authToken];
}


//GetMatchesURL......
+ (NSString *)getMatchesURL:(NSString *)authToken andMatchDate:(NSString *)matchDate{
  
  return [NSString stringWithFormat:@"%@matchcenter/api_matches.php?md=%@&auth_token=%@",[self getBaseURL],matchDate,authToken];

}


//GetAllCompitionMatchesURL....
+ (NSString *)getAllCompitionMatchesURL:(NSString *)authToken andCompitionID:(NSString *)compitionID
                          andWeekNumber:(int)weekNumber{
  return [NSString stringWithFormat:@"%@matchcenter/api_matches.php?compid=%@&weeknum=%d&auth_token=%@",[self getBaseURL],compitionID,weekNumber,authToken];

}

//GetLiveMatchesURL.....
+ (NSString *)getLiveMatchesURL:(NSString *)authToken andIsLive:(BOOL)isLive{

  return [NSString stringWithFormat:@"%@matchcenter/api_matches.php?live=%d&auth_token=%@",[self getBaseURL],isLive,authToken];

}

//GetTopScorersURL......
+ (NSString *)getTopScorersURL:(NSString *)authToken andCompitionID:(NSString *)compitionID{
    return [NSString stringWithFormat:@"%@matchcenter/api_league_top_scorers.php?compid=%@&auth_token=%@",[self getBaseURL],compitionID,authToken];
}

//GetALLTablesForCompitionURL....
+ (NSString *)getALLTablesForCompitionURL:(NSString *)authToken andCompitionID:(NSString *)compitionID{

    return [NSString stringWithFormat:@"%@matchcenter/api_league_table.php?compid=%@&auth_token=%@",[self getBaseURL],compitionID,authToken];

}

//GetMatchDetailsURL....
+ (NSString *)getMatchDetailsURL:(NSString *)matchID{

    return [NSString stringWithFormat:@"%@matchcenter/api_matchdetails.php?mid=%@",[self getBaseURL],matchID];

}
@end
