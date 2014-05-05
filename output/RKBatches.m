/// @generated @signature<<0865fbe2240decddb9298eb309d21373>>

#include "RKBatches.h"

@implementation RKBatches

- (id)initWithShipmentId:(NSInteger)shipmentId
      batchType:(NSString*)batchType
      quantity:(NSInteger)quantity
      sort:(NSInteger)sort
      status:(NSString*)status
      createdAt:(NSTimeInterval)createdAt
      updatedAt:(NSTimeInterval)updatedAt
      customSort:(NSInteger)customSort
      deletedAt:(NSTimeInterval)deletedAt
{
  if ((self = [super init])) {
    self.shipmentId = shipmentId;
    self.batchType = batchType;
    self.quantity = quantity;
    self.sort = sort;
    self.status = status;
    self.createdAt = createdAt;
    self.updatedAt = updatedAt;
    self.customSort = customSort;
    self.deletedAt = deletedAt;
  }
  return self;
}

+ (id)buildWithObject:(RKBatches*)object block:(void(^)(RKMutableBatches*))block
{
  RKMutableBatches* mutableObject = [[RKMutableBatches alloc] initWithImmutableObject:object];
  if (block) {
    block(mutableObject);
  }
  return [mutableObject makeImmutable];
}

+ (id)build:(void(^)(RKMutableBatches*))block
{
  RKMutableBatches* mutableObject = [[RKMutableBatches alloc] init];
  return [self buildWithObject:mutableObject block:block];
}

@end

@implementation RKMutableBatches

- (id)initWithImmutableObject:(RKBatches*)immutableObject
{
  if ((self = [super init])) {
    self.shipmentId = immutableObject.shipmentId;
    self.batchType = immutableObject.batchType;
    self.quantity = immutableObject.quantity;
    self.sort = immutableObject.sort;
    self.status = immutableObject.status;
    self.createdAt = immutableObject.createdAt;
    self.updatedAt = immutableObject.updatedAt;
    self.customSort = immutableObject.customSort;
    self.deletedAt = immutableObject.deletedAt;
  }
  return self;
}

- (RKBatches*)makeImmutable;
{
  RKBatches* object = [[RKBatches alloc] initWithShipmentId:self.shipmentId
      batchType:self.batchType
      quantity:self.quantity
      sort:self.sort
      status:self.status
      createdAt:self.createdAt
      updatedAt:self.updatedAt
      customSort:self.customSort
      deletedAt:self.deletedAt
  ];
  return object;
}

@end
