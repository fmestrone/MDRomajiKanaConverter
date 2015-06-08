//
//  NSString+RomajiKanaConversion.m
//

#import "NSString+RomajiKanaConversion.h"

#define kHasHiragana     1
#define kHasKatakana     2
#define kHasKanji        4
#define kHasOther        8

@implementation NSString (RomajiKanaConversion)

+ (MDRomajiKanaConverter *)japaneseConverter
{
    static MDRomajiKanaConverter *converter;
    if ( !converter ) {
        converter = [MDRomajiKanaConverter new];
    }
    return converter;
}

- (NSString *)stringByConvertingRomajiToHiragana
{
    return [[NSString japaneseConverter] convertFromRomajiToHiragana:self];
}

- (NSString *)stringByConvertingRomajiToKatakana
{
    return [[NSString japaneseConverter] convertFromRomajiToKatakana:self];
}

- (NSString *)stringByConvertingKanaToRomaji
{
    return [[NSString japaneseConverter] convertFromKanaToRomaji:self];
}

- (NSString *)stringByConvertingHiraganaToKatakana
{
    return [[NSString japaneseConverter] convertFromHiraganaToKatakana:self];
}

- (NSString *)stringByConvertingKatakanaToHiragana
{
    return [[NSString japaneseConverter] convertFromKatakanaToHiragana:self];
}

- (MDJapaneseScriptType)japaneseScriptType
{
    short type = 0;
    short allTypes = kHasHiragana + kHasKatakana + kHasKanji + kHasOther;
    for ( int i = 0; i < [self length]; ++i ) {
        unichar c = [self characterAtIndex:i];
        if ( [[NSString japaneseConverter] isHiragana:c] ) {
            type |= kHasHiragana;
        } else if ( [[NSString japaneseConverter] isKatakana:c] ) {
            type |= kHasKatakana;
        } else if ( [[NSString japaneseConverter] isKanji:c] ) {
            type |= kHasKanji;
        } else {
            type |= kHasOther;
        }
        if ( type == allTypes ) {
            break;
        }
    }
    if ( type == kHasHiragana ) {
        return MDJapaneseScriptHiragana;
    } else if ( type == kHasKatakana ) {
        return MDJapaneseScriptKatakana;
    } else if ( type == kHasHiragana + kHasKatakana ) {
        return MDJapaneseScriptKana;
    } else if ( type == kHasKanji ) {
        return MDJapaneseScriptKanji;
    } else if ( (type & kHasKanji) && ((type & kHasHiragana) || (type & kHasKatakana)) ) {
        return MDJapaneseScriptAllJapanese;
    } else if ( type == kHasOther ) {
        return MDJapaneseScriptNone;
    } else {
        return MDJapaneseScriptAll;
    }
}

- (BOOL)isRomaji
{
    NSString *katakana = [self stringByConvertingRomajiToKatakana];
    return [katakana japaneseScriptType] == MDJapaneseScriptKatakana;
}

@end

@implementation NSMutableString (RomajiKanaConversion)

- (void)convertRomajiToHiragana {
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:[self stringByConvertingRomajiToHiragana]];
}

- (void)convertRomajiToKatakana {
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:[self stringByConvertingRomajiToKatakana]];
}

- (void)convertKanaToRomaji {
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:[self stringByConvertingKanaToRomaji]];
}

- (void)convertHiraganaToKatakana {
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:[self stringByConvertingHiraganaToKatakana]];
}

- (void)convertKatakanaToHiragana {
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:[self stringByConvertingKatakanaToHiragana]];
}

@end
