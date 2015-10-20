//
//  NSLogRedirect.m
//  NSLogRedirect
//
//  Created by Евгений Губин on 22.05.14.
//  Copyright (c) 2014 yillio.com. All rights reserved.
//

#import "NSLogRedirect.h"

@implementation NSLogRedirect

static NSString *_currentLog = nil;

+ (FILE*)stdErr {
    return stderr;
}

+(FILE*)reopenFile:(FILE*)file toPath:(NSString*)path withAttributes:(NSString*)attributes {
    const char* toPathVector = [path fileSystemRepresentation];
    const char* attributesVector = [attributes fileSystemRepresentation];
    return freopen(toPathVector, attributesVector, file);
}

+ (void) enableRedirectToFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd_MM_yyyy_HH_mm_ss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [[@"report_" stringByAppendingString:dateString] stringByAppendingString:@".log"];
    
    _currentLog = [documentsDirectory stringByAppendingPathComponent:fileName];
    freopen([_currentLog fileSystemRepresentation], "a+", stderr);
    
    NSLog(@"NSLog redirected to console.log");
}

+ (BOOL) isRedirectEnabled
{
    return _currentLog != nil;
}

+ (NSString *) currentLog
{
    return _currentLog;
}

+ (void) throwError
{
    void *p = nil;
    int *i = p;
    NSLog(@"%d", *i);
}

@end
