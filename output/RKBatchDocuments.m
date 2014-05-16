/// @generated @signature<<508f181d851b0c6ca270b6f691fde89f>>

#include "RKBatchDocuments.h"

static NSString * const kCoderKeyBatchId = @"batch_id";
static NSString * const kCoderKeyDocumentId = @"document_id";
static NSString * const kCoderKeyStatus = @"status";
static NSString * const kCoderKeyCreatedAt = @"created_at";
static NSString * const kCoderKeyUpdatedAt = @"updated_at";
static NSString * const kCoderKeyName = @"name";
static NSString * const kCoderKeyDeletedAt = @"deleted_at";

@implementation RKBatchDocuments

- (id)initWithBatchId:(NSInteger)batchId
    documentId:(NSInteger)documentId
    status:(NSString*)status
    createdAt:(NSTimeInterval)createdAt
    updatedAt:(NSTimeInterval)updatedAt
    name:(NSString*)name
    deletedAt:(NSTimeInterval)deletedAt
{
  if ((self = [super init])) {
    _batchId = batchId;
    _documentId = documentId;
    _status = [status copy];
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = [name copy];
    _deletedAt = deletedAt;
  }
  return self;
}

+ (id)buildWithObject:(RKBatchDocuments *)object block:(void(^)(id<RKBatchDocumentsConfiguration>))block
{
  id<RKBatchDocumentsConfiguration> configuration = [RKBatchDocumentsConfiguration configurationWithObject:object];
  return [self buildWithConfiguration:configuration block:block];
}

+ (id)build:(void(^)(id<RKBatchDocumentsConfiguration>))block
{
  id<RKBatchDocumentsConfiguration> configuration = [RKBatchDocumentsConfiguration defaultConfiguration];
  return [self buildWithConfiguration:configuration block:block];
}

+ (id)buildWithConfiguration:(id<RKBatchDocumentsConfiguration>)configuration block:(void(^)(id<RKBatchDocumentsConfiguration>))block
{
  if (block) {
    block(configuration);
  }
  return [[self alloc] initWithBatchId:configuration.batchId
    documentId:configuration.documentId
    status:configuration.status
    createdAt:configuration.createdAt
    updatedAt:configuration.updatedAt
    name:configuration.name
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
  RKBatchDocuments* other = (RKBatchDocuments*)otherObj;
  return (_batchId==other->_batchId &&
    _documentId==other->_documentId &&
    (_status==other->_status || [_status isEqual:other->_status]) &&
    _createdAt==other->_createdAt &&
    _updatedAt==other->_updatedAt &&
    (_name==other->_name || [_name isEqual:other->_name]) &&
    _deletedAt==other->_deletedAt);
}

- (NSUInteger)hash
{
  NSUInteger prime = 31;
  NSUInteger result = 1;

  result = prime * result + (NSUInteger)(_batchId);
  result = prime * result + (NSUInteger)(_documentId);
  result = prime * result + [_status hash];
  result = prime * result + (NSUInteger)(_createdAt);
  result = prime * result + (NSUInteger)(_updatedAt);
  result = prime * result + [_name hash];
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
    _batchId = [decoder decodeIntegerForKey:kCoderKeyBatchId];
    _documentId = [decoder decodeIntegerForKey:kCoderKeyDocumentId];
    _status = [decoder decodeObjectForKey:kCoderKeyStatus];
    _createdAt = [decoder decodeObjectForKey:kCoderKeyCreatedAt];
    _updatedAt = [decoder decodeObjectForKey:kCoderKeyUpdatedAt];
    _name = [decoder decodeObjectForKey:kCoderKeyName];
    _deletedAt = [decoder decodeObjectForKey:kCoderKeyDeletedAt];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeInteger:_batchId forKey:kCoderKeyBatchId];
  [coder encodeInteger:_documentId forKey:kCoderKeyDocumentId];
  [coder encodeObject:_status forKey:kCoderKeyStatus];
  [coder encodeObject:_createdAt forKey:kCoderKeyCreatedAt];
  [coder encodeObject:_updatedAt forKey:kCoderKeyUpdatedAt];
  [coder encodeObject:_name forKey:kCoderKeyName];
  [coder encodeObject:_deletedAt forKey:kCoderKeyDeletedAt];
}

@end

@interface RKBatchDocumentsConfiguration : NSObject <RKBatchDocumentsConfiguration>

+ (instancetype)defaultConfiguration;
+ (instancetype)configurationWithObject:(RKBatchDocuments*)object;

@property (nonatomic, readwrite, assign) NSInteger batchId;
@property (nonatomic, readwrite, assign) NSInteger documentId;
@property (nonatomic, readwrite, copy) NSString* status;
@property (nonatomic, readwrite, assign) NSTimeInterval createdAt;
@property (nonatomic, readwrite, assign) NSTimeInterval updatedAt;
@property (nonatomic, readwrite, copy) NSString* name;
@property (nonatomic, readwrite, assign) NSTimeInterval deletedAt;

@end

@implementation RKBatchDocumentsConfiguration

+ (instancetype)defaultConfiguration
{
  return [[self alloc] init];
}

+ (instancetype)configurationWithObject:(RKBatchDocuments*)object
{
  RKBatchDocumentsConfiguration* config = [[self alloc] init];
  config.batchId = object.batchId;
  config.documentId = object.documentId;
  config.status = object.status;
  config.createdAt = object.createdAt;
  config.updatedAt = object.updatedAt;
  config.name = object.name;
  config.deletedAt = object.deletedAt;
  return config;
}

@end
