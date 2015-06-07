//
//  SCStoreService.m
//  Pods
//
//  Created by Jörn Schmidt on 10.04.15.
//
//

#import "SCStoreService.h"

@implementation SCStoreService

/**
 *  get instance of service
 *
 *  @return the singleton instance
 */
+ (SCStoreService*)sharedService
{
  static SCStoreService *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [SCStoreService new];
  });
  
  return instance;
}

- (PMKPromise*) checkIn:(NSString*) storeId sid:(NSString*)sid {
  
  return [[self serviceManagerByChannel:PersistentChannel] execute:[SCGeneralStore class] objectId:storeId action:@"checkin" actionArg:sid arg:nil];
  
}

- (PMKPromise*) setDefault:(NSString*)storeId {
  
  return [[self serviceManagerByChannel:OnDemandChannel] execute:[SCGeneralStore class] objectId:storeId action:@"setDefault" actionArg:nil arg:nil];
  
}

- (PMKPromise*) getStores:(SCQueryParams*)queryParams {
  
  return [[self serviceManagerByChannel:OnDemandChannel] findObjects:[SCGeneralStore class] queryParams:queryParams];
  
}

- (PMKPromise*) getStoreList:(SCQueryParams*)queryParams {
  return [self getList:[SCGeneralStore class] withParams:queryParams onChannel:OnDemandChannel];
}

- (PMKPromise*) getStore:(NSString*)pid {
  return [self get:[SCGeneralStore class] withId:pid onChannel:OnDemandChannel];
}

- (PMKPromise*) postProcessObjects:(NSArray*)objects {
 
  return [PMKPromise new:^(PMKFulfiller fulfill, PMKRejecter reject) {
    for (SCGeneralStore *store in objects) {
      NSLog(@"store: %@", store.id);
      // TODO: implement this
//      MediaResource picture = ((Store) object).getLogo();
//      if (picture != null) {
//        if (!picture.isCached()) {
//          picture.download();
//        }
//      }
    }
  }];
  
}


@end
