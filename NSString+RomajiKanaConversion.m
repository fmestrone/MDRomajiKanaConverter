//
//  NSString+RomajiKanaConversion.m
//

#import "NSString+RomajiKanaConversion.h"
#import "MDRomajiKanaConverter.h"

@implementation NSString (RomajiKanaConversion)

static MDRomajiKanaConverter *converter;

+ (void)initialize
{
    if ( !converter ) {
        converter = [MDRomajiKanaConverter new];
    }
}

- (NSString *)stringByConvertingRomajiToHiragana
{
    return [converter convertFromRomajiToHiragana:self];
}

- (NSString *)stringByConvertingRomajiToKatakana
{
    return [converter convertFromRomajiToKatakana:self];
}

- (NSString *)stringByConvertingKanaToRomaji
{
    return [converter convertFromKanaToRomaji:self];
}

- (NSString *)stringByConvertingHiraganaToKatakana
{
    return [converter convertFromHiraganaToKatakana:self];
}

- (NSString *)stringByConvertingKatakanaToHiragana
{
    return [converter convertFromKatakanaToHiragana:self];
}

@end
