#include "datalibs.h"

#include <QStringList>
#include <QDir>
#include "../config/Constants.h"

DataLibs::DataLibs() {}

void DataLibs::inspectSurpriseDataFolder(SurpriseData &surpriseData, quint8 dayNumber) {
    QString path = QString(DATA_PATH) + "/" + QString::number(dayNumber);

    QStringList extvideo;
    extvideo << "*.avi";
    extvideo << "*.mp4";

    QStringList extimg;
    extimg << "*.jpg";
    extimg << "*.png";

    QStringList exttxt;
    exttxt << "*.txt";

    QDir dir(path);
    QStringList mediaList = dir.entryList(extvideo, QDir::Files);
    if(mediaList.length() == 0) {
        mediaList = dir.entryList(extimg, QDir::Files);
        if(mediaList.length() == 0) {
            surpriseData.surpriseType = SurpriseType::TEXT;
        } else {
            surpriseData.surpriseType = SurpriseType::IMAGE;
            surpriseData.mediaUrl = path + "/" + mediaList.at(0);
        }
    } else {
        surpriseData.surpriseType = SurpriseType::VIDEO;
        surpriseData.mediaUrl = path + "/" + mediaList.at(0);
    }
    mediaList = dir.entryList(exttxt, QDir::Files);
    if(mediaList.length() == 0) {
        surpriseData.text = "";
        return;
    }
    QString txtFilepath = mediaList.at(0);
    QFile file(txtFilepath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        surpriseData.text = "";
        return;
    }
    QTextStream in(&file);
    surpriseData.text = in.readAll();
    file.close();
}

bool DataLibs::getStatus(quint32 status, quint8 dayNumber) {
    return ((status & (1 << (dayNumber-1))) != 0);
}

quint32 DataLibs::setStatus(quint32 status, quint8 dayNumber) {
    status |= (1 << (dayNumber-1));
    return status;
}
