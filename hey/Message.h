//
//  Message.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 07.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum : int16_t {
    EmotionsTypeAnger,          // Гнев
    EmotionsTypeDisagreement,   // Несогласие
    EmotionsTypeNeutral,        // Нейтрально
    EmotionsTypeAgreement,      // Согласие
    EmotionsTypeEndorsement,    // Одобрение
} EmotionsType;

typedef enum : int16_t {
    SituationTypeAccident,  // Авария
    SituationTypeStyle,     // Стиль вождения
    SituationTypeParking,   // Парковка
    SituationTypeDating,    // Знакомство
    SituationTypeQuestion,  // Вопрос
    SituationTypeHelp,      // Помощь
    SituationTypeBusiness,  // Деловое предложение
    SituationTypeOther,     // Прочее
} SituationType;

@class User, Vehicle;

@interface Message : NSManagedObject

// Attributes
@property (nonatomic, retain) NSString * body;
@property (nonatomic) EmotionsType emotions;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic) SituationType situation;
@property (nonatomic, retain) NSDate * timestamp;

// Relations
@property (nonatomic, retain) User *author;
@property (nonatomic, retain) Vehicle *vehicle;

@end
