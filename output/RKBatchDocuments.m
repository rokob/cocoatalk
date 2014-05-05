/// @generated @signature<<0865fbe2240decddb9298eb309d21373>>

#include "RKBatchDocuments.h"

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
    self.batchId = batchId;
    self.documentId = documentId;
    self.status = status;
    self.createdAt = createdAt;
    self.updatedAt = updatedAt;
    self.name = name;
    self.deletedAt = deletedAt;
  }
  return self;
}

+ (id)buildWithObject:(RKBatchDocuments*)object block:(void(^)(RKMutableBatchDocuments*))block
{
  RKMutableBatchDocuments* mutableObject = [[RKMutableBatchDocuments alloc] initWithImmutableObject:object];
  if (block) {
    block(mutableObject);
  }
  return [mutableObject makeImmutable];
}

+ (id)build:(void(^)(RKMutableBatchDocuments*))block
{
  RKMutableBatchDocuments* mutableObject = [[RKMutableBatchDocuments alloc] init];
  return [self buildWithObject:mutableObject block:block];
}

@end

@implementation RKMutableBatchDocuments

- (id)initWithImmutableObject:(RKBatchDocuments*)immutableObject
{
  if ((self = [super init])) {
    self.batchId = immutableObject.batchId;
    self.documentId = immutableObject.documentId;
    self.status = immutableObject.status;
    self.createdAt = immutableObject.createdAt;
    self.updatedAt = immutableObject.updatedAt;
    self.name = immutableObject.name;
    self.deletedAt = immutableObject.deletedAt;
  }
  return self;
}

- (RKBatchDocuments*)makeImmutable;
{
  RKBatchDocuments* object = [[RKBatchDocuments alloc] initWithBatchId:self.batchId
      documentId:self.documentId
      status:self.status
      createdAt:self.createdAt
      updatedAt:self.updatedAt
      name:self.name
      deletedAt:self.deletedAt
  ];
  return object;
}

@end
