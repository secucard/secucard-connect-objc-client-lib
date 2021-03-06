//
//  SCAuthToken.m
//  Pods
//
//  Created by Jörn Schmidt on 11.04.15.
//
//

#import "SCAuthToken.h"

@implementation SCAuthToken

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  
  NSDictionary *standards = [NSDictionary mtl_identityPropertyMapWithModel:self];
  
  return [standards mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                  @"accessToken":@"access_token",
                                                                  @"expiresIn":@"expires_in",
                                                                  @"tokenType":@"token_type",
                                                                  @"refreshToken":@"refresh_token"
                                                                  }];
}


@end
