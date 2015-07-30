//
//  SCGeneralTransaction.m
//  Pods
//
//  Created by Jörn Schmidt on 11.04.15.
//
//

#import "SCGeneralTransaction.h"

@implementation SCGeneralTransaction

+ (NSString *)object {
  return @"General.Transactions";
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  
  NSDictionary *standards = [super JSONKeyPathsByPropertyKey];
  
  return [standards mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                  @"lastChange":@"last_change"
                                                                  }];
}

@end