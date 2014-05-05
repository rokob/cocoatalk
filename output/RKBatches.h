/// @generated @signature<<0865fbe2240decddb9298eb309d21373>>

#include <Foundation/Foundation.h>

@class RKMutableBatches;

@interface RKBatches : NSObject

+ (instancetype)build:(void(^)(RKMutableBatches*))block;
+ (instancetype)buildWithObject:(RKBatches*)object block:(void(^)(RKMutableBatches*))block;

@property (nonatomic, readonly, assign) NSInteger shipmentId;
@property (nonatomic, readonly, copy) NSString* batchType;
@property (nonatomic, readonly, assign) NSInteger quantity;
@property (nonatomic, readonly, assign) NSInteger sort;
@property (nonatomic, readonly, copy) NSString* status;
@property (nonatomic, readonly, assign) NSTimeInterval createdAt;
@property (nonatomic, readonly, assign) NSTimeInterval updatedAt;
@property (nonatomic, readonly, assign) NSInteger customSort;
@property (nonatomic, readonly, assign) NSTimeInterval deletedAt;

@end

@interface RKMutableBatches : NSObject

- (instancetype)initWithImmutableObject:(RKBatches *)immutableObject;
- (RKBatches*)makeImmutable;

@property (nonatomic, readwrite, assign) NSInteger shipmentId;
@property (nonatomic, readwrite, copy) NSString* batchType;
@property (nonatomic, readwrite, assign) NSInteger quantity;
@property (nonatomic, readwrite, assign) NSInteger sort;
@property (nonatomic, readwrite, copy) NSString* status;
@property (nonatomic, readwrite, assign) NSTimeInterval createdAt;
@property (nonatomic, readwrite, assign) NSTimeInterval updatedAt;
@property (nonatomic, readwrite, assign) NSInteger customSort;
@property (nonatomic, readwrite, assign) NSTimeInterval deletedAt;

@end
