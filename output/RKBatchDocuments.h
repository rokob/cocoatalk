/// @generated @signature<<791eabad6377a77bcbbb39abc0f3e5de>>

#include <Foundation/Foundation.h>

@protocol RKBatchDocumentsConfiguration;

@interface RKBatchDocuments : NSObject <NSCopying, NSCoding>

+ (instancetype)build:(void(^)(id<RKBatchDocumentsConfiguration>))block;
+ (instancetype)buildWithObject:(RKBatchDocuments *)object block:(void(^)(id<RKBatchDocumentsConfiguration>))block;

@property (nonatomic, readonly, assign) NSInteger batchId;
@property (nonatomic, readonly, assign) NSInteger documentId;
@property (nonatomic, readonly, copy) NSString* status;
@property (nonatomic, readonly, assign) NSTimeInterval createdAt;
@property (nonatomic, readonly, assign) NSTimeInterval updatedAt;
@property (nonatomic, readonly, copy) NSString* name;
@property (nonatomic, readonly, assign) NSTimeInterval deletedAt;

@end

@protocol RKBatchDocumentsConfiguration <NSObject>

- (void)setBatchId:(NSInteger)batchId;
- (void)setDocumentId:(NSInteger)documentId;
- (void)setStatus:(NSString*)status;
- (void)setCreatedAt:(NSTimeInterval)createdAt;
- (void)setUpdatedAt:(NSTimeInterval)updatedAt;
- (void)setName:(NSString*)name;
- (void)setDeletedAt:(NSTimeInterval)deletedAt;

@end
