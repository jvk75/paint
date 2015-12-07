//
//  TestCase.m
//  paint
//
//  Created by Jari Kalinainen on 06.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "TestCase.h"

@implementation TestCase

// simple one line initialisation
-(id)initWithTestId:(NSInteger)testid AndData:(NSArray*)dataArray
{
    self = [super init];
    if (self) {
        _testId = testid;
        [self prepareTestWithData:dataArray];
        resultColors = [NSMutableDictionary new];
    }
    return self;
}

// create customers with data for the test
-(void)prepareTestWithData:(NSArray *)testDataArray
{
    colors = [[testDataArray objectAtIndex:kNUMBEROFCOLORSROW] integerValue];
    NSInteger numberOfCustomers = [[testDataArray objectAtIndex:kNUMBEROFCUSTOMERSROW] integerValue];
    customers = [NSMutableArray new];
    for (NSInteger j = 0; j < numberOfCustomers; j++) {
        Customer *cust = [[Customer alloc] initWithTestData:[testDataArray objectAtIndex:j+kFIRSTCUSTOMERDATAROW]];
        [customers addObject:cust];
    }
}

// run the test and return result string
-(NSString*)runTest
{
    for (NSInteger col = 1; col < colors+1; col++) {
        NSInteger numberOfCustomers = [customers count];
        NSMutableArray *singleColorCustomer = [NSMutableArray new];
        NSMutableArray *multiColorCustomer = [NSMutableArray new];
        for (NSInteger c = 0 ; c < numberOfCustomers; c++) {
            Customer *cust = [customers objectAtIndex:c];
            if ([cust hasColor:i2n(col)]) {
                if ([cust numberOfColors] == 1) {
                    [singleColorCustomer addObject:cust];
                } else {
                    [multiColorCustomer addObject:cust];
                }
            }
        }
        if ([singleColorCustomer count] == 0 && [multiColorCustomer count] == 0) { // no custmers for color
            [resultColors setObject:@"0" forKey:[NSNumber numberWithInteger:col]];
            
        } else if ([singleColorCustomer count] == 1) { // only one customer for color
            [resultColors setObject:[NSNumber numberWithInteger:[(Customer*)[singleColorCustomer firstObject] getColorType:i2n(col)]] forKey:i2n(col)];
            [customers removeObject:[singleColorCustomer firstObject]];
            if ([multiColorCustomer count] > 0) {
                [multiColorCustomer makeObjectsPerformSelector:@selector(removeColor:) withObject:i2n(col)];
            }
            
        } else if ([singleColorCustomer count] > 1) {
            [resultColors removeAllObjects];
            [resultColors setObject:@"IMPOSSIBLE" forKey:i2n(1)];
            break;
            
        } else {  // two or more wants the same color
            [resultColors setObject:[NSString stringWithFormat:@"%ld",[[multiColorCustomer firstObject] getColorType:i2n(col)]] forKey:i2n(col)];
            [customers removeObject:[multiColorCustomer firstObject]];
            [multiColorCustomer makeObjectsPerformSelector:@selector(removeColor:) withObject:i2n(col)];
        }
        
    }
    
    return [self createResultString];
}

-(NSString*)createResultString
{
    NSMutableString *result = [NSMutableString stringWithString:@""];
    for (NSInteger i = 1; i < colors+1; i++) {
        if ([resultColors objectForKey:[NSNumber numberWithInteger:i]] != nil) {
            [result appendFormat:@"%@ ",[resultColors objectForKey:[NSNumber numberWithInteger:i]]];
        }
    }
    return [NSString stringWithFormat:@"Case #%ld: %@",_testId,result];
}

#ifdef DEBUG
-(void)printMe //debug method
{
    NSLog(@"- TestCase #%ld",_testId);
    [customers makeObjectsPerformSelector:@selector(printMe)];
}
#endif

@end
