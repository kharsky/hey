//
//  Message.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OldVehicle;

typedef enum : NSUInteger {
    EmotionsTypeAnger,          // Гнев
    EmotionsTypeDisagreement,   // Несогласие
    EmotionsTypeNeutral,        // Нейтрально
    EmotionsTypeAgreement,      // Согласие
    EmotionsTypeEndorsement,    // Одобрение
} EmotionsType;

typedef enum : NSUInteger {
    SituationTypeAccident,  // Авария
    SituationTypeStyle,     // Стиль вождения
    SituationTypeParking,   // Парковка
    SituationTypeDating,    // Знакомство
    SituationTypeQuestion,  // Вопрос
    SituationTypeHelp,      // Помощь
    SituationTypeBusiness,  // Деловое предложение
    SituationTypeOther,     // Прочее
} SituationType;


@interface OldMessage : NSObject

@property (nonatomic, copy) NSString *body;              // текст сообщения
@property (nonatomic, strong) UIImage *photo;            // фотография
@property (nonatomic, strong) NSDate *timestamp;         // время добавления сообщения
@property (nonatomic, assign) EmotionsType emotions;    // эмоции
@property (nonatomic, assign) SituationType situation;  // дорожная ситуация
@property (nonatomic, strong) OldVehicle *vehicle;          // автомобиль

@end
