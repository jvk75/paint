//
//  FileParser.m
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "FileParser.h"

@implementation FileParser

-(NSArray*)parseFilePath:(NSString*)filePath
{
    NSBundle *bundle;
    NSString *file;
    NSMutableArray *fileArgumentPath = [NSMutableArray arrayWithArray:[filePath componentsSeparatedByString:@"/"]];
    NSString *fileName = [fileArgumentPath lastObject];
    
    if  ([fileArgumentPath count] > 1) { // if input file is not in same dircetory as the app
        [fileArgumentPath removeLastObject];
        NSString *newPath = [fileArgumentPath componentsJoinedByString:@"/"];
        bundle =[NSBundle bundleWithPath:newPath];
        file = [bundle pathForResource:fileName ofType:nil];
    } else {
        bundle = [NSBundle mainBundle];
        file = [bundle pathForResource:fileName ofType:nil];
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:file]) {
        NSLog(@"Error: file '%@' does not exist!",filePath);
        return nil;
    }
    
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *fileRows = [fileContent componentsSeparatedByString:@"\n"];
    NSInteger numberOfTestCases = [[fileRows objectAtIndex:0] integerValue];
    
    NSMutableArray *result = [NSMutableArray new];
    NSInteger caseOffset = 0;
    for (NSInteger i = 0; i < numberOfTestCases; i++) {
        NSInteger numberOfCustomers = [[fileRows objectAtIndex:2+caseOffset] integerValue];
        [result addObject:[fileRows subarrayWithRange:NSMakeRange(caseOffset+1,2+numberOfCustomers)]];
        caseOffset += 2+numberOfCustomers;
    }

    return result;
}

@end
