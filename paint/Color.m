//
//  Color.m
//  paint
//
//  Created by Jari Kalinainen on 05.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import "Color.h"

@implementation Color

-(id)initWithColor:(NSInteger)color andType:(NSInteger)type
{
    self = [super init];
    if (self) {
        _color = color;
        _type = type;
    }
    return self;
}

#ifdef DEBUG
-(void)printMe
{
    NSLog(@"     - color: %ld, type: %ld",_color,_type);
}
#endif 

@end
