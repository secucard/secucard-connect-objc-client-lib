//
//  SCSmartTransaction.m
//  Pods
//
//  Created by Jörn Schmidt on 11.04.15.
//
//

#import "SCSmartTransaction.h"

@implementation SCSmartTransaction

+ (NSString *)object {
  return @"smart.transactions";
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  
  NSDictionary *standards = [super JSONKeyPathsByPropertyKey];
  
  return [standards mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                  @"basketInfo":@"basket_info",
                                                                  @"deviceSource":@"device_source",
                                                                  @"targetDevice":@"target_device",
                                                                  @"paymentMethod":@"payment_method",
                                                                  @"receiptLines":@"receipt",
                                                                  @"paymentRequested":@"payment_requested",
                                                                  @"paymentExecuted":@"payment_executed"
                                                                  }];
}

+ (NSValueTransformer *)basketInfoJSONTransformer {
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:[SCSmartBasketInfo class]];
}

+ (NSValueTransformer *)basketJSONTransformer {
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:[SCSmartBasket class]];
}

+ (NSValueTransformer *)targetDeviceJSONTransformer {
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:[SCSmartDevice class]];
}

+ (NSValueTransformer *)deviceSourceJSONTransformer {
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:[SCSmartDevice class]];
}


@end
