//
//  Post.m
//  Instagram
//
//  Created by Brian Sanchez on 7/7/20.
//  Copyright © 2020 Brian Sanchez. All rights reserved.
//

#import "Post.h"
#import <Parse/Parse.h>

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;
 
+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage:(UIImage *)image withCaption:(NSString *)caption withCompletion:(PFBooleanResultBlock)completion {
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    [newPost saveInBackgroundWithBlock:completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

@end
