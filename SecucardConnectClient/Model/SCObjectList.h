//
//  SCObjectList.h
//  Pods
//
//  Created by Jörn Schmidt on 13.04.15.
//
//

#import <Mantle/Mantle.h>

@interface SCObjectList : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *scrollId;
@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, copy) NSArray *data;

@end