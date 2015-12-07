//
//  Customer.m
//  paint
//
//  Created by Jari Kalinainen on 05.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "Customer.h"

@implementation Customer

-(id)initWithData:(NSString *)dataString
{
    self = [super init];
    if (self) {
        //DMSG(dataString);
        NSArray *data = [dataString componentsSeparatedByString:@" "];
        _numberOfColors = [[data objectAtIndex:0] integerValue];
        _colors = [NSMutableDictionary new];
        for (NSInteger i = 0; i < _numberOfColors; i++) {
            Color *col = [[Color alloc] initWithColor:[[data objectAtIndex:2*i+1] integerValue] andType:[[data objectAtIndex:2*i+2] integerValue]];
            [_colors setObject:col forKey:[NSNumber numberWithInteger:[[data objectAtIndex:2*i+1] integerValue]]];
        }
    }
    return self;
}

-(BOOL)hasColor:(NSInteger)color withType:(NSInteger)type
{
    if ([_colors objectForKey:[NSNumber numberWithInteger:color]] == nil) {
        return NO;
    } else {
        if (type < kNOTYPE) {
            if ([(Color*)[_colors objectForKey:[NSNumber numberWithInteger:color]] type] == type) {
                return YES;
            } else {
                return NO;
            }
        } else {
            return YES;
        }
    }
    return NO;
}

-(NSInteger)getColorType:(NSInteger)color
{
    return [(Color*)[_colors objectForKey:[NSNumber numberWithInteger:color]] type];
}

-(BOOL)hasColor:(NSInteger)color;
{
    return [self hasColor:color withType:kNOTYPE];
}

-(void)removeColorWithObj:(NSNumber*)color
{
    [self removeColor:[color integerValue]];
}

-(void)removeColor:(NSInteger)color
{
    if ([_colors objectForKey:[NSNumber numberWithInteger:color]] != nil) {
        [_colors removeObjectForKey:[NSNumber numberWithInteger:color]];
        _numberOfColors = [_colors count];
    }
}

#ifdef DEBUG
-(void)printMe
{
    NSLog(@"  - customer with colors:");
    [[_colors allValues] makeObjectsPerformSelector:@selector(printMe)];
}
#endif

@end
