/// @generated @signature<<791eabad6377a77bcbbb39abc0f3e5de>>

#include <Foundation/Foundation.h>

@protocol RKBatchesConfiguration;

@interface RKBatches : NSObject <NSCopying, NSCoding>

+ (instancetype)build:(void(^)(id<RKBatchesConfiguration>))block;
+ (instancetype)buildWithObject:(RKBatches *)object block:(void(^)(id<RKBatchesConfiguration>))block;

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

@protocol RKBatchesConfiguration <NSObject>

- (void)setShipmentId:(NSInteger)shipmentId;
- (void)setBatchType:(NSString*)batchType;
- (void)setQuantity:(NSInteger)quantity;
- (void)setSort:(NSInteger)sort;
- (void)setStatus:(NSString*)status;
- (void)setCreatedAt:(NSTimeInterval)createdAt;
- (void)setUpdatedAt:(NSTimeInterval)updatedAt;
- (void)setCustomSort:(NSInteger)customSort;
- (void)setDeletedAt:(NSTimeInterval)deletedAt;

@end
