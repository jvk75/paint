//
//  Color.h
//  paint
//
//  Created by Jari Kalinainen on 05.12.15.
//  Copyright © 2015 Jari Kalinainen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defines.h"

@interface Color : NSObject

@property (readonly) NSInteger color;
@property (readonly) NSInteger type;

// initializer
-(id)initWithColor:(NSInteger)color andType:(NSInteger)type;

-(void)printMe;

@end
