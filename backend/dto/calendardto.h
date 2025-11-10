#ifndef CALENDARDTO_H
#define CALENDARDTO_H

#include <QObject>

namespace SurpriseType {
Q_NAMESPACE
enum Surprise {
    TEXT,
    IMAGE,
    VIDEO
};
Q_ENUM_NS(Surprise)
}

typedef struct {
    SurpriseType::Surprise surpriseType;
    QString mediaUrl;
    QString text;
} SurpriseData;

#endif // CALENDARDTO_H
