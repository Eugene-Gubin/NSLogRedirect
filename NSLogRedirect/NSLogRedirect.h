//
//  NSLogRedirect.h
//  NSLogRedirect
//
//  Created by Евгений Губин on 22.05.14.
//  Copyright (c) 2014 yillio.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLogRedirect : NSObject

+ (void) enableRedirectToFile;
+ (BOOL) isRedirectEnabled;
+ (NSString *) currentLog;
+ (void) throwError;
+ (FILE*) reopenFile:(FILE*)file toPath:(NSString*)path withAttributes:(NSString*)attributes;
+ (FILE*) stdErr;

@end
