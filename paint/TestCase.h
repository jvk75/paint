//
//  TestCase.h
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface TestCase : NSObject
{
    NSInteger colors;
    NSMutableArray *customers;
    NSMutableDictionary *resultColors;
}

@property NSInteger testId;

-(id)initWithTestId:(NSInteger)testid AndData:(NSArray*)dataArray;
-(void)prepareTestWithData:(NSArray *)testDataArray;
-(NSString*)runTest;

#ifdef DEBUG
-(void)printMe;
#endif

@end
