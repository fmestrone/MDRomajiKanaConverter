MDRomajiKanaConverter
=====================

Kana - Romaji Converter written in Objective-C

Romaji - Kana transform (CFStringTransform) in iOS is buggy on some iOS versions and is not precise.
The goal of this library is to become a good alternative to the iOS string transform library.


## Install
Just copy the following files into your project:
* NSString+RomajiKanaConversion.[hm]
* MDRomajiKanaConverter.[hm]
   
## Examples

```objective-c
#import "NSString+RomajiKanaConvert.h"

{
NSString *romaji = @"kyari-pamyupamyu";
NSString *kana = [romaji stringRomajiToHiragana]; // きゃりーぱみゅぱみゅ
}
{
NSString *romaji = @"hannyashinkyo";
NSString *kana = [romaji stringRomajiToHiragana]; // はんにゃしんきょう
}
{
NSString *kana = @"おくさんおげんきデスカー";
NSString *romaji = [kana stringKanaToRomaji]; // okusanogenkidesuka-
}
{
NSString *hiragana = @"ちゅーりっぷ";
NSString *katakana = [hiragana stringHiraganaToKatakana]; // チューリップ
}

```
