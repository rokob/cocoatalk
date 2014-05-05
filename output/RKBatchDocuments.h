/// @generated @signature<<0865fbe2240decddb9298eb309d21373>>

#include <Foundation/Foundation.h>

@class RKMutableBatchDocuments;

@interface RKBatchDocuments : NSObject

+ (instancetype)build:(void(^)(RKMutableBatchDocuments*))block;
+ (instancetype)buildWithObject:(RKBatchDocuments*)object block:(void(^)(RKMutableBatchDocuments*))block;

@property (nonatomic, readonly, assign) NSInteger batchId;
@property (nonatomic, readonly, assign) NSInteger documentId;
@property (nonatomic, readonly, copy) NSString* status;
@property (nonatomic, readonly, assign) NSTimeInterval createdAt;
@property (nonatomic, readonly, assign) NSTimeInterval updatedAt;
@property (nonatomic, readonly, copy) NSString* name;
@property (nonatomic, readonly, assign) NSTimeInterval deletedAt;

@end

@interface RKMutableBatchDocuments : NSObject

- (instancetype)initWithImmutableObject:(RKBatchDocuments *)immutableObject;
- (RKBatchDocuments*)makeImmutable;

@property (nonatomic, readwrite, assign) NSInteger batchId;
@property (nonatomic, readwrite, assign) NSInteger documentId;
@property (nonatomic, readwrite, copy) NSString* status;
@property (nonatomic, readwrite, assign) NSTimeInterval createdAt;
@property (nonatomic, readwrite, assign) NSTimeInterval updatedAt;
@property (nonatomic, readwrite, copy) NSString* name;
@property (nonatomic, readwrite, assign) NSTimeInterval deletedAt;

@end
