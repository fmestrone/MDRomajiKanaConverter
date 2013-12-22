//
//  MDRomajiKanaConverter.h
//
//  Created by Yusuke Kawakami on 2013/02/27.
//  Copyright (c) 2012年 Yusuke Kawakami. All rights reserved.
//
//  Changed by Federico Mestrone on 2013/08/22.
//  Copyright (c) 2013年 Moodsdesign Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDRomajiKanaConverter : NSObject

- (NSString *)convertFromKatakanaToHiragana:(NSString *)katakana;
- (NSString *)convertFromHiraganaToKatakana:(NSString *)hiragana;
- (NSString *)convertFromRomajiToKatakana:(NSString *)romaji strict:(BOOL)strict;
- (NSString *)convertFromRomajiToKatakana:(NSString *)romaji;
- (NSString *)convertFromRomajiToHiragana:(NSString *)romaji strict:(BOOL)strict;
- (NSString *)convertFromRomajiToHiragana:(NSString *)romaji;
- (NSString *)convertFromKanaToRomaji:(NSString *)kana;
- (BOOL)isKatakana:(unichar)c;
- (BOOL)isHiragana:(unichar)c;
- (BOOL)isKana:(unichar)c;
- (BOOL)isKanji:(unichar)c;

@end
