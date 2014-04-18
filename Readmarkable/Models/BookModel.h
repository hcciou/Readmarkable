//
//  BookModel.h
//  Readmarkable
//
//  Created by hcc on 2014/4/17.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
@property (nonatomic) NSString* author;
@property (nonatomic) NSString* cover;
@property (nonatomic) NSString* bookId;
@property (nonatomic) NSString* intro;
@property (nonatomic) NSString* title;

- (NSArray* )parseBookJSON;

@end
