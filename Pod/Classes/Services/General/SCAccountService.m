//
//  SCAccountService.m
//  Pods
//
//  Created by Jörn Schmidt on 10.04.15.
//
//

#import "SCAccountService.h"
#import "SCClientConfiguration.h"
#import "SCLogManager.h"

@implementation SCAccountService

+ (SCAccountService*)sharedService
{
  static SCAccountService *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    instance = [SCAccountService new];
    instance.registeredEventClasses = @[[SCGeneralAccount class]];
    
  });
  
  return instance;
}


- (void) updateAccount:(SCGeneralAccount*)account completionHandler:(void (^)(SCGeneralAccount *, SecuError *))handler {
  
  [SCLogManager info:@"CONNECT-SDK: updateAccount"];
  
  [[self serviceManagerByChannel:OnDemandChannel] updateObject:account completionHandler:^(SCSecuObject *responseObject, SecuError *error) {
    
    if ([responseObject isKindOfClass:[SCSecuObject class]]) {
      
      handler((SCGeneralAccount*)responseObject, error);
    } else {
      handler(nil, error);
    }
    
    
  }];
  
}

- (void) getAccount:(NSString*)accountId completionHandler:(void (^)(SCGeneralAccount *, SecuError *))handler {
  
  [SCLogManager info:@"CONNECT-SDK: getAccount"];
  
  [[self serviceManagerByChannel:OnDemandChannel] getObject:[SCGeneralAccount class] objectId:accountId completionHandler:handler];
  
}

- (void) deleteAccount:(NSString*)accountId completionHandler:(void (^)(bool, SecuError *))handler {
  
  [SCLogManager info:@"CONNECT-SDK: deleteAccount"];
  
  [[self serviceManagerByChannel:OnDemandChannel] deleteObject:[SCGeneralAccount class] objectId:accountId completionHandler:handler];
  
}

- (void) updateLocation:(NSString*)accountId location:(SCGeneralLocation*)location completionHandler:(void (^)(bool, SecuError *))handler {
  
  [SCLogManager info:@"CONNECT-SDK: updateLocation"];
  
  [[self serviceManagerByChannel:PersistentChannel] updateObject:[SCGeneralAccount class] objectId:accountId action:@"location" actionArg:nil arg:location completionHandler:^(id responseObject, SecuError *error) {
    
    handler((error == nil), error);
    
  }];
  
}

- (void) createAccount:(SCGeneralAccount*)account completionHandler:(void (^)(SCGeneralAccount *, SecuError *))handler {
  
  [SCLogManager info:@"CONNECT-SDK: createAccount"];
  
  [[self serviceManagerByChannel:OnDemandChannel] createObject:account secure:FALSE completionHandler:handler];
  
}

- (void) updateBeacons:(NSArray*)beaconList completionHandler:(void (^)(bool, SecuError *))handler {
  
  [SCLogManager info:@"CONNECT-SDK: updateBeacons"];
  
  return [[self serviceManagerByChannel:PersistentChannel] updateObject:[SCGeneralAccount class] objectId:@"me" action:@"beaconEnvironment" actionArg:nil arg:beaconList completionHandler:^(id responseObject, SecuError *error) {
    
    handler((error == nil), error);
    
  }];
  
}

- (void) passwordReset:(NSString*)email fromOrigin:(NSString*)origin completionHandler:(void (^)(bool, SecuError *))handler {

  [SCLogManager info:@"CONNECT-SDK: passwordReset"];
  
  return [[self serviceManagerByChannel:OnDemandChannel] execute:[SCGeneralAccount class] objectId:@"null" action:@"passwordreset" actionArg:email arg:@{@"origin": origin} secure:FALSE completionHandler:^(id responseObject, SecuError *error) {
    handler((error == nil), error);
  }];
  
}


@end
