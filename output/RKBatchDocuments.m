/// @generated @signature<<13f589c3d1a6354bc7c6062b18b5e48d>>

#include "RKBatchDocuments.h"

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

- (BOOL)isEqual:(id)other
{
  if (self == other) {
    return YES;
  }
  if (![other isKindOfClass:[self class]]) {
    return NO;
  }
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

  result = prime * result + (NSUInteger)(_batch_id ^ (_batch_id >>> 32));
  result = prime * result + (NSUInteger)(_document_id ^ (_document_id >>> 32));
  result = prime * result + [_status hash];
  result = prime * result + (NSUInteger)(_created_at ^ (_created_at >>> 32));
  result = prime * result + (NSUInteger)(_updated_at ^ (_updated_at >>> 32));
  result = prime * result + [_name hash];
  result = prime * result + (NSUInteger)(_deleted_at ^ (_deleted_at >>> 32));

  return result;
}

@end
