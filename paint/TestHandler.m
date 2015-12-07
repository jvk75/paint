//
//  TestHandler.m
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "TestHandler.h"
#import "TestCase.h"

@implementation TestHandler

-(id)initWithTestCasesArray:(NSArray*)testCases
{
    self = [super init];
    if (self) {
        [self createTestCases:testCases];
    }
    return self;
}

-(void)createTestCases:(NSArray*)testCases
{
    tests = [NSMutableArray new];
    _numberOfTests = [testCases count];
    for (NSInteger i = 0; i < _numberOfTests; i++) {
        TestCase *tc = [[TestCase alloc] initWithTestId:i+1 AndData:[testCases objectAtIndex:i]];
        [tests addObject:tc];
    }
    
}

-(void)runAllTests // and print result
{
    for (NSInteger i = 0; i < _numberOfTests; i++) {
        NSLog(@"%@",[[tests objectAtIndex:i] runTest]);
    }
}

-(void)runSingleTest:(NSInteger)testid
{
    if ([tests objectAtIndex:testid] != nil) {
        NSLog(@"%@",[[tests objectAtIndex:testid] runTest]);
    } else {
        NSLog(@"Error: Test #%ld not found!",testid);
    }
}

#ifdef DEBUG
-(void)printMe //debug method
{
    NSLog(@"TestHandler with test:");
    [tests makeObjectsPerformSelector:@selector(printMe)];
}
#endif

@end
