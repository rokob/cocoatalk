/// @generated @signature<<13f589c3d1a6354bc7c6062b18b5e48d>>

#include <Foundation/Foundation.h>

@class RKMutableBatches;

@interface RKBatches : NSObject <NSCopying, NSCoding>

+ (instancetype)build:(void(^)(RKMutableBatches *))block;
+ (instancetype)buildWithObject:(RKBatches *)object block:(void(^)(RKMutableBatches *))block;

@property (nonatomic, readonly, assign) NSInteger shipment_id;
@property (nonatomic, readonly, copy) NSString* batch_type;
@property (nonatomic, readonly, assign) NSInteger quantity;
@property (nonatomic, readonly, assign) NSInteger sort;
@property (nonatomic, readonly, copy) NSString* status;
@property (nonatomic, readonly, assign) NSTimeInterval created_at;
@property (nonatomic, readonly, assign) NSTimeInterval updated_at;
@property (nonatomic, readonly, assign) NSInteger custom_sort;
@property (nonatomic, readonly, assign) NSTimeInterval deleted_at;

@end

@interface RKMutableBatches : NSObject

- (instancetype)initWithImmutableObject:(RKBatches *)immutableObject;
- (RKBatches *)makeImmutable;

@property (nonatomic, readwrite, assign) NSInteger shipment_id;
@property (nonatomic, readwrite, copy) NSString* batch_type;
@property (nonatomic, readwrite, assign) NSInteger quantity;
@property (nonatomic, readwrite, assign) NSInteger sort;
@property (nonatomic, readwrite, copy) NSString* status;
@property (nonatomic, readwrite, assign) NSTimeInterval created_at;
@property (nonatomic, readwrite, assign) NSTimeInterval updated_at;
@property (nonatomic, readwrite, assign) NSInteger custom_sort;
@property (nonatomic, readwrite, assign) NSTimeInterval deleted_at;

@end
