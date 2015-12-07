//
//  TestHandler.h
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestHandler : NSObject
{
    NSMutableArray *tests;
}
@property (readonly) NSInteger numberOfTests;

-(id)initWithTestCasesArray:(NSArray*)testCases;
-(void)createTestCases:(NSArray*)testCases;
-(void)runAllTests;
-(void)runSingleTest:(NSInteger)testid;

#ifdef DEBUG
-(void)printMe;
#endif

@end
