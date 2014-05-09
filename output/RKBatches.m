/// @generated @signature<<13f589c3d1a6354bc7c6062b18b5e48d>>

#include "RKBatches.h"

@implementation RKBatches

- (id)initWithShipment_id:(NSInteger)shipment_id
    batch_type:(NSString*)batch_type
    quantity:(NSInteger)quantity
    sort:(NSInteger)sort
    status:(NSString*)status
    created_at:(NSTimeInterval)created_at
    updated_at:(NSTimeInterval)updated_at
    custom_sort:(NSInteger)custom_sort
    deleted_at:(NSTimeInterval)deleted_at
{
  if ((self = [super init])) {
    self.shipment_id = shipment_id;
    self.batch_type = batch_type;
    self.quantity = quantity;
    self.sort = sort;
    self.status = status;
    self.created_at = created_at;
    self.updated_at = updated_at;
    self.custom_sort = custom_sort;
    self.deleted_at = deleted_at;
  }
  return self;
}

+ (id)buildWithObject:(RKBatches *)object block:(void(^)(RKMutableBatches *))block
{
  RKMutableBatches* mutableObject = [[RKMutableBatches alloc] initWithImmutableObject:object];
  if (block) {
    block(mutableObject);
  }
  return [mutableObject makeImmutable];
}

+ (id)build:(void(^)(RKMutableBatches *))block
{
  RKMutableBatches* mutableObject = [[RKMutableBatches alloc] init];
  return [self buildWithObject:mutableObject block:block];
}

@end

@implementation RKMutableBatches

- (id)initWithImmutableObject:(RKBatches *)immutableObject
{
  if ((self = [super init])) {
    self.shipment_id = immutableObject.shipment_id;
    self.batch_type = immutableObject.batch_type;
    self.quantity = immutableObject.quantity;
    self.sort = immutableObject.sort;
    self.status = immutableObject.status;
    self.created_at = immutableObject.created_at;
    self.updated_at = immutableObject.updated_at;
    self.custom_sort = immutableObject.custom_sort;
    self.deleted_at = immutableObject.deleted_at;
  }
  return self;
}

- (RKBatches *)makeImmutable;
{
  RKBatches* object = [[RKBatches alloc]
    initWithShipment_id:_shipment_id  
    batch_type:_batch_type  
    quantity:_quantity  
    sort:_sort  
    status:_status  
    created_at:_created_at  
    updated_at:_updated_at  
    custom_sort:_custom_sort  
    deleted_at:_deleted_at  
  ];
  return object;
}

- (BOOL)isEqual:(id)other
{
  if (self == other) {
    return YES;
  }
  if (![other isKindOfClass:[self class]]) {
    return NO;
  }
  return (_shipment_id==other->_shipment_id &&
    [_batch_type isEqual:other->_batch_type] &&
    _quantity==other->_quantity &&
    _sort==other->_sort &&
    [_status isEqual:other->_status] &&
    _created_at==other->_created_at &&
    _updated_at==other->_updated_at &&
    _custom_sort==other->_custom_sort &&
    _deleted_at==other->_deleted_at);
}

- (NSUInteger)hash
{
  NSUInteger prime = 31;
  NSUInteger result = 1;

  result = prime * result + (NSUInteger)(_shipment_id ^ (_shipment_id >>> 32));
  result = prime * result + [_batch_type hash];
  result = prime * result + (NSUInteger)(_quantity ^ (_quantity >>> 32));
  result = prime * result + (NSUInteger)(_sort ^ (_sort >>> 32));
  result = prime * result + [_status hash];
  result = prime * result + (NSUInteger)(_created_at ^ (_created_at >>> 32));
  result = prime * result + (NSUInteger)(_updated_at ^ (_updated_at >>> 32));
  result = prime * result + (NSUInteger)(_custom_sort ^ (_custom_sort >>> 32));
  result = prime * result + (NSUInteger)(_deleted_at ^ (_deleted_at >>> 32));

  return result;
}

@end
