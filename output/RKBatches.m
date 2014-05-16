/// @generated @signature<<508f181d851b0c6ca270b6f691fde89f>>

#include "RKBatches.h"

static NSString * const kCoderKeyShipmentId = @"shipment_id";
static NSString * const kCoderKeyBatchType = @"batch_type";
static NSString * const kCoderKeyQuantity = @"quantity";
static NSString * const kCoderKeySort = @"sort";
static NSString * const kCoderKeyStatus = @"status";
static NSString * const kCoderKeyCreatedAt = @"created_at";
static NSString * const kCoderKeyUpdatedAt = @"updated_at";
static NSString * const kCoderKeyCustomSort = @"custom_sort";
static NSString * const kCoderKeyDeletedAt = @"deleted_at";

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
    _shipmentId = shipmentId;
    _batchType = [batchType copy];
    _quantity = quantity;
    _sort = sort;
    _status = [status copy];
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _customSort = customSort;
    _deletedAt = deletedAt;
  }
  return self;
}

+ (id)buildWithObject:(RKBatches *)object block:(void(^)(id<RKBatchesConfiguration>))block
{
  id<RKBatchesConfiguration> configuration = [RKBatchesConfiguration configurationWithObject:object];
  return [self buildWithConfiguration:configuration block:block];
}

+ (id)build:(void(^)(id<RKBatchesConfiguration>))block
{
  id<RKBatchesConfiguration> configuration = [RKBatchesConfiguration defaultConfiguration];
  return [self buildWithConfiguration:configuration block:block];
}

+ (id)buildWithConfiguration:(id<RKBatchesConfiguration>)configuration block:(void(^)(id<RKBatchesConfiguration>))block
{
  if (block) {
    block(configuration);
  }
  return [[self alloc] initWithShipmentId:configuration.shipmentId
    batchType:configuration.batchType
    quantity:configuration.quantity
    sort:configuration.sort
    status:configuration.status
    createdAt:configuration.createdAt
    updatedAt:configuration.updatedAt
    customSort:configuration.customSort
    deletedAt:configuration.deletedAt
  ];
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
  return (_shipmentId==other->_shipmentId &&
    (_batchType==other->_batchType || [_batchType isEqual:other->_batchType]) &&
    _quantity==other->_quantity &&
    _sort==other->_sort &&
    (_status==other->_status || [_status isEqual:other->_status]) &&
    _createdAt==other->_createdAt &&
    _updatedAt==other->_updatedAt &&
    _customSort==other->_customSort &&
    _deletedAt==other->_deletedAt);
}

- (NSUInteger)hash
{
  NSUInteger prime = 31;
  NSUInteger result = 1;

  result = prime * result + (NSUInteger)(_shipmentId);
  result = prime * result + [_batchType hash];
  result = prime * result + (NSUInteger)(_quantity);
  result = prime * result + (NSUInteger)(_sort);
  result = prime * result + [_status hash];
  result = prime * result + (NSUInteger)(_createdAt);
  result = prime * result + (NSUInteger)(_updatedAt);
  result = prime * result + (NSUInteger)(_customSort);
  result = prime * result + (NSUInteger)(_deletedAt);

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
    _shipmentId = [decoder decodeIntegerForKey:kCoderKeyShipmentId];
    _batchType = [decoder decodeObjectForKey:kCoderKeyBatchType];
    _quantity = [decoder decodeIntegerForKey:kCoderKeyQuantity];
    _sort = [decoder decodeIntegerForKey:kCoderKeySort];
    _status = [decoder decodeObjectForKey:kCoderKeyStatus];
    _createdAt = [decoder decodeObjectForKey:kCoderKeyCreatedAt];
    _updatedAt = [decoder decodeObjectForKey:kCoderKeyUpdatedAt];
    _customSort = [decoder decodeIntegerForKey:kCoderKeyCustomSort];
    _deletedAt = [decoder decodeObjectForKey:kCoderKeyDeletedAt];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeInteger:_shipmentId forKey:kCoderKeyShipmentId];
  [coder encodeObject:_batchType forKey:kCoderKeyBatchType];
  [coder encodeInteger:_quantity forKey:kCoderKeyQuantity];
  [coder encodeInteger:_sort forKey:kCoderKeySort];
  [coder encodeObject:_status forKey:kCoderKeyStatus];
  [coder encodeObject:_createdAt forKey:kCoderKeyCreatedAt];
  [coder encodeObject:_updatedAt forKey:kCoderKeyUpdatedAt];
  [coder encodeInteger:_customSort forKey:kCoderKeyCustomSort];
  [coder encodeObject:_deletedAt forKey:kCoderKeyDeletedAt];
}

@end

@interface RKBatchesConfiguration : NSObject <RKBatchesConfiguration>

+ (instancetype)defaultConfiguration;
+ (instancetype)configurationWithObject:(RKBatches*)object;

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

@implementation RKBatchesConfiguration

+ (instancetype)defaultConfiguration
{
  return [[self alloc] init];
}

+ (instancetype)configurationWithObject:(RKBatches*)object
{
  RKBatchesConfiguration* config = [[self alloc] init];
  config.shipmentId = object.shipmentId;
  config.batchType = object.batchType;
  config.quantity = object.quantity;
  config.sort = object.sort;
  config.status = object.status;
  config.createdAt = object.createdAt;
  config.updatedAt = object.updatedAt;
  config.customSort = object.customSort;
  config.deletedAt = object.deletedAt;
  return config;
}

@end
