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
#import "MDRomajiKanaConverter.h"

typedef enum {
    MDJapaneseScriptNone,
    MDJapaneseScriptHiragana,
    MDJapaneseScriptKatakana,
    MDJapaneseScriptKana,
    MDJapaneseScriptKanji,
    MDJapaneseScriptAllJapanese,
    MDJapaneseScriptAll
} MDJapaneseScriptType;

@interface NSString (RomajiKanaConversion)

+ (MDRomajiKanaConverter *)japaneseConverter;

- (NSString *)stringByConvertingRomajiToHiraganaStrictly;
- (NSString *)stringByConvertingRomajiToKatakanaStrictly;
- (NSString *)stringByConvertingRomajiToHiragana;
- (NSString *)stringByConvertingRomajiToKatakana;
- (NSString *)stringByConvertingKanaToRomaji;
- (NSString *)stringByConvertingHiraganaToKatakana;
- (NSString *)stringByConvertingKatakanaToHiragana;
- (MDJapaneseScriptType)japaneseScriptType;
- (BOOL)isRomaji;

@end

@interface NSMutableString (RomajiKanaConversion)

- (void)convertRomajiToHiraganaStrictly;
- (void)convertRomajiToKatakanaStrictly;
- (void)convertRomajiToHiragana;
- (void)convertRomajiToKatakana;
- (void)convertKanaToRomaji;
- (void)convertHiraganaToKatakana;
- (void)convertKatakanaToHiragana;

@end
