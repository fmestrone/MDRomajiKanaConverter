//
//  NSString+RomajiKanaConversion.h
//
//  Created by Yusuke Kawakami on 2013/02/27.
//  Copyright (c) 2012年 Yusuke Kawakami. All rights reserved.
//
//  Changed by Federico Mestrone on 2013/08/22.
//  Copyright (c) 2013年 Moodsdesign Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RomajiKanaConversion)

- (NSString *)stringByConvertingRomajiToHiragana;
- (NSString *)stringByConvertingRomajiToKatakana;
- (NSString *)stringByConvertingKanaToRomaji;
- (NSString *)stringByConvertingHiraganaToKatakana;
- (NSString *)stringByConvertingKatakanaToHiragana;

@end
