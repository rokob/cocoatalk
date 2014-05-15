/// @generated @signature<<13f589c3d1a6354bc7c6062b18b5e48d>>

#include "RKBatchDocuments.h"

static NSString * const kCoderKeybatch_id = @"batch_id";
static NSString * const kCoderKeydocument_id = @"document_id";
static NSString * const kCoderKeystatus = @"status";
static NSString * const kCoderKeycreated_at = @"created_at";
static NSString * const kCoderKeyupdated_at = @"updated_at";
static NSString * const kCoderKeyname = @"name";
static NSString * const kCoderKeydeleted_at = @"deleted_at";

@implementation RKBatchDocuments

- (id)initWithBatch_id:(NSInteger)batch_id
    document_id:(NSInteger)document_id
    status:(NSString*)status
    created_at:(NSTimeInterval)created_at
    updated_at:(NSTimeInterval)updated_at
    name:(NSString*)name
    deleted_at:(NSTimeInterval)deleted_at
{
  if ((self = [super init])) {
    self.batch_id = batch_id;
    self.document_id = document_id;
    self.status = status;
    self.created_at = created_at;
    self.updated_at = updated_at;
    self.name = name;
    self.deleted_at = deleted_at;
  }
  return self;
}

+ (id)buildWithObject:(RKBatchDocuments *)object block:(void(^)(RKMutableBatchDocuments *))block
{
  RKMutableBatchDocuments* mutableObject = [[RKMutableBatchDocuments alloc] initWithImmutableObject:object];
  if (block) {
    block(mutableObject);
  }
  return [mutableObject makeImmutable];
}

+ (id)build:(void(^)(RKMutableBatchDocuments *))block
{
  RKMutableBatchDocuments* mutableObject = [[RKMutableBatchDocuments alloc] init];
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
  RKBatchDocuments* other = (RKBatchDocuments*)otherObj;
  return (_batch_id==other->_batch_id &&
    _document_id==other->_document_id &&
    [_status isEqual:other->_status] &&
    _created_at==other->_created_at &&
    _updated_at==other->_updated_at &&
    [_name isEqual:other->_name] &&
    _deleted_at==other->_deleted_at);
}

- (NSUInteger)hash
{
  NSUInteger prime = 31;
  NSUInteger result = 1;

  result = prime * result + (NSUInteger)(_batch_id);
  result = prime * result + (NSUInteger)(_document_id);
  result = prime * result + [_status hash];
  result = prime * result + (NSUInteger)(_created_at);
  result = prime * result + (NSUInteger)(_updated_at);
  result = prime * result + [_name hash];
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
    _batch_id = [decoder decodeIntegerForKey:kCoderKeybatch_id];
    _document_id = [decoder decodeIntegerForKey:kCoderKeydocument_id];
    _status = [decoder decodeObjectForKey:kCoderKeystatus];
    _created_at = [decoder decodeObjectForKey:kCoderKeycreated_at];
    _updated_at = [decoder decodeObjectForKey:kCoderKeyupdated_at];
    _name = [decoder decodeObjectForKey:kCoderKeyname];
    _deleted_at = [decoder decodeObjectForKey:kCoderKeydeleted_at];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeInteger:_batch_id forKey:kCoderKeybatch_id];
  [coder encodeInteger:_document_id forKey:kCoderKeydocument_id];
  [coder encodeObject:_status forKey:kCoderKeystatus];
  [coder encodeObject:_created_at forKey:kCoderKeycreated_at];
  [coder encodeObject:_updated_at forKey:kCoderKeyupdated_at];
  [coder encodeObject:_name forKey:kCoderKeyname];
  [coder encodeObject:_deleted_at forKey:kCoderKeydeleted_at];
}

@end

@implementation RKMutableBatchDocuments

- (id)initWithImmutableObject:(RKBatchDocuments *)immutableObject
{
  if ((self = [super init])) {
    self.batch_id = immutableObject.batch_id;
    self.document_id = immutableObject.document_id;
    self.status = immutableObject.status;
    self.created_at = immutableObject.created_at;
    self.updated_at = immutableObject.updated_at;
    self.name = immutableObject.name;
    self.deleted_at = immutableObject.deleted_at;
  }
  return self;
}

- (RKBatchDocuments *)makeImmutable;
{
  RKBatchDocuments* object = [[RKBatchDocuments alloc]
    initWithBatch_id:_batch_id  
    document_id:_document_id  
    status:_status  
    created_at:_created_at  
    updated_at:_updated_at  
    name:_name  
    deleted_at:_deleted_at  
  ];
  return object;
}

@end
