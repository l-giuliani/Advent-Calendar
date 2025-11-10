#ifndef DATALIBS_H
#define DATALIBS_H

#include "../dto/calendardto.h"

class DataLibs
{
public:
    DataLibs();
    static void inspectSurpriseDataFolder(SurpriseData& surpriseData, quint8 dayNumber);
    static QStringList retrieveLettersImages();
    static QString getRandomLettersImage(QStringList images);
    static bool getStatus(quint32 status, quint8 dayNumber);
    static quint32 setStatus(quint32 status, quint8 dayNumber);
};

#endif // DATALIBS_H
