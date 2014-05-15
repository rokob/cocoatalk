/// @generated @signature<<13f589c3d1a6354bc7c6062b18b5e48d>>

#include "RKBatches.h"

static NSString * const kCoderKeyshipment_id = @"shipment_id";
static NSString * const kCoderKeybatch_type = @"batch_type";
static NSString * const kCoderKeyquantity = @"quantity";
static NSString * const kCoderKeysort = @"sort";
static NSString * const kCoderKeystatus = @"status";
static NSString * const kCoderKeycreated_at = @"created_at";
static NSString * const kCoderKeyupdated_at = @"updated_at";
static NSString * const kCoderKeycustom_sort = @"custom_sort";
static NSString * const kCoderKeydeleted_at = @"deleted_at";

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

#pragma mark -
#pragma mark Equality

- (BOOL)isEqual:(id)otherObj
{
  if (self == other) {
    return YES;
  }
  if (![other isKindOfClass:[self class]]) {
    return NO;
  }
  RKBatches* other = (RKBatches*)otherObj;
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

  result = prime * result + (NSUInteger)(_shipment_id);
  result = prime * result + [_batch_type hash];
  result = prime * result + (NSUInteger)(_quantity);
  result = prime * result + (NSUInteger)(_sort);
  result = prime * result + [_status hash];
  result = prime * result + (NSUInteger)(_created_at);
  result = prime * result + (NSUInteger)(_updated_at);
  result = prime * result + (NSUInteger)(_custom_sort);
  result = prime * result + (NSUInteger)(_deleted_at);

  return result;
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
  return self;
}

#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)decoder
{
  if ((self = [super init])) {
    _shipment_id = [decoder decodeIntegerForKey:kCoderKeyshipment_id];
    _batch_type = [decoder decodeObjectForKey:kCoderKeybatch_type];
    _quantity = [decoder decodeIntegerForKey:kCoderKeyquantity];
    _sort = [decoder decodeIntegerForKey:kCoderKeysort];
    _status = [decoder decodeObjectForKey:kCoderKeystatus];
    _created_at = [decoder decodeObjectForKey:kCoderKeycreated_at];
    _updated_at = [decoder decodeObjectForKey:kCoderKeyupdated_at];
    _custom_sort = [decoder decodeIntegerForKey:kCoderKeycustom_sort];
    _deleted_at = [decoder decodeObjectForKey:kCoderKeydeleted_at];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeInteger:_shipment_id forKey:kCoderKeyshipment_id];
  [coder encodeObject:_batch_type forKey:kCoderKeybatch_type];
  [coder encodeInteger:_quantity forKey:kCoderKeyquantity];
  [coder encodeInteger:_sort forKey:kCoderKeysort];
  [coder encodeObject:_status forKey:kCoderKeystatus];
  [coder encodeObject:_created_at forKey:kCoderKeycreated_at];
  [coder encodeObject:_updated_at forKey:kCoderKeyupdated_at];
  [coder encodeInteger:_custom_sort forKey:kCoderKeycustom_sort];
  [coder encodeObject:_deleted_at forKey:kCoderKeydeleted_at];
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

@end
