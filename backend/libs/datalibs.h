#ifndef DATALIBS_H
#define DATALIBS_H

#include "../dto/calendardto.h"

class DataLibs
{
public:
    DataLibs();
    static void inspectSurpriseDataFolder(SurpriseData& surpriseData, quint8 dayNumber);
};

#endif // DATALIBS_H
