//
//  BookModel.m
//  Readmarkable
//
//  Created by hcc on 2014/4/17.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

- (instancetype) initWithJSONData:(id)data
{
    self = [super init];
    if (self)
    {
        self.author = data[@"author"];
        self.cover = data[@"cover"];
        self.bookId = data[@"id"];
        self.intro = data[@"intro"];
        self.title = data[@"title"];
    }
    return self;
}

+(instancetype) bookWithJSONData:(id)data
{
    return [[BookModel alloc] initWithJSONData:data];
}

- (NSArray *)parseBookJSON
{
    NSString* filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/books.json"];
    NSData* data =[NSData dataWithContentsOfFile:filePath
                                         options:NSDataReadingMappedIfSafe
                                           error:nil];
    NSError* error = nil;
    NSArray* jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:&error];
    NSMutableArray* booksArray = @[].mutableCopy;
    [jsonData enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BookModel* book = [BookModel bookWithJSONData: obj];
        [booksArray addObject: book];
    }];
    return booksArray;
}



@end
