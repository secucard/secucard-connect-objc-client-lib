//
//  SCGeneralMerchantDetail.m
//  Pods
//
//  Created by Jörn Schmidt on 11.04.15.
//
//

#import "SCGeneralMerchantDetail.h"

@implementation SCGeneralMerchantDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  
  NSDictionary *standards = [NSDictionary mtl_identityPropertyMapWithModel:self];
  
  return [standards mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                  @"news":@"_news",
                                                                  @"balance":@"_balance",
                                                                  @"points":@"_points"
                                                                  }];
}


@end
