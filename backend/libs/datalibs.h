#ifndef DATALIBS_H
#define DATALIBS_H

#include "../components/calendarcomponents.h"

typedef struct {
    SurpriseType::Surprise surpriseType;
    QString mediaUrl;
    QString text;
} SurpriseData;

class DataLibs
{
public:
    DataLibs();
    static void inspectSurpriseDataFolder(SurpriseData& surpriseData, quint8 dayNumber);
};

#endif // DATALIBS_H
