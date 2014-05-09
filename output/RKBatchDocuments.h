/// @generated @signature<<13f589c3d1a6354bc7c6062b18b5e48d>>

#include <Foundation/Foundation.h>

@class RKMutableBatchDocuments;

@interface RKBatchDocuments : NSObject

+ (instancetype)build:(void(^)(RKMutableBatchDocuments *))block;
+ (instancetype)buildWithObject:(RKBatchDocuments *)object block:(void(^)(RKMutableBatchDocuments *))block;

@property (nonatomic, readonly, assign) NSInteger batch_id;
@property (nonatomic, readonly, assign) NSInteger document_id;
@property (nonatomic, readonly, copy) NSString* status;
@property (nonatomic, readonly, assign) NSTimeInterval created_at;
@property (nonatomic, readonly, assign) NSTimeInterval updated_at;
@property (nonatomic, readonly, copy) NSString* name;
@property (nonatomic, readonly, assign) NSTimeInterval deleted_at;

@end

@interface RKMutableBatchDocuments : NSObject

- (instancetype)initWithImmutableObject:(RKBatchDocuments *)immutableObject;
- (RKBatchDocuments *)makeImmutable;

@property (nonatomic, readwrite, assign) NSInteger batch_id;
@property (nonatomic, readwrite, assign) NSInteger document_id;
@property (nonatomic, readwrite, copy) NSString* status;
@property (nonatomic, readwrite, assign) NSTimeInterval created_at;
@property (nonatomic, readwrite, assign) NSTimeInterval updated_at;
@property (nonatomic, readwrite, copy) NSString* name;
@property (nonatomic, readwrite, assign) NSTimeInterval deleted_at;

@end
