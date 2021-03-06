/******************************************
 *
 *  Copyright (c) 2015. hp.weber GmbH & Co secucard KG (www.secucard.com)
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 ******************************************/

#import "SCStompDestination.h"
#import "SCStompManager.h"

@implementation SCStompDestination

- (NSString *)destination {
  
  NSString *dest = [NSString stringWithFormat:@"%@%@", [SCStompManager sharedManager].configuration.basicDestination, kStompDestinationPrefix];
  
  dest = [dest stringByAppendingString:self.command];
  
  if (self.type) {
    dest = [dest stringByAppendingString:[[self.type object] lowercaseString]];                 // -> general.publicmerchants
  }
  
  if (self.method) {
    dest = [dest stringByAppendingString:@"."];
    dest = [dest stringByAppendingString:self.method];
  }
  
  return dest;
  
}

+ (instancetype) initWithCommand:(NSString*)command {
  return [self initWithCommand:command type:nil method:nil];
}

+ (instancetype) initWithCommand:(NSString*)command type:(Class)type {
  return [self initWithCommand:command type:type method:nil];
}

+ (instancetype) initWithCommand:(NSString*)command type:(Class)type method:(NSString*)method {
  
  SCStompDestination *destination = [SCStompDestination new];
  
  destination.command = command;
  destination.type = type;
  destination.method = method;
  
  return destination;
  
}

@end