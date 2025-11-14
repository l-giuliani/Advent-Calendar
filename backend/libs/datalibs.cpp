#include "datalibs.h"

#include <QStringList>
#include <QDir>
#include <QRandomGenerator>
#include "../config/Constants.h"
#include <QGuiApplication>

DataLibs::DataLibs() {}

void DataLibs::inspectSurpriseDataFolder(SurpriseData &surpriseData, quint8 dayNumber) {
    QString executableDir = QCoreApplication::applicationDirPath();
    QString path = executableDir + "/" + QString(DATA_PATH) + "/" + QString::number(dayNumber);

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
    QFile file(path + "/" + txtFilepath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        surpriseData.text = "";
        return;
    }
    QTextStream in(&file);
    surpriseData.text = in.readAll();
    file.close();
}

QStringList DataLibs::retrieveLettersImages() {
    QString executableDir = QCoreApplication::applicationDirPath();
    QString path = executableDir + "/" + QString(LETTERS_IMG_PATH);
    QDir dir(path);
    QStringList list = dir.entryList(QDir::Files);
    QStringList reslist;
    for (const QString &fi : list) {
        reslist << (executableDir + "/" + QString(LETTERS_IMG_PATH) + "/" + fi);
    }
    return reslist;
}

QString DataLibs::getRandomLettersImage(QStringList images) {
    int randomIdx = QRandomGenerator::global()->bounded(0, images.length());
    return images.at(randomIdx);
}

bool DataLibs::getStatus(quint32 status, quint8 dayNumber) {
    return ((status & (1 << (dayNumber-1))) != 0);
}

quint32 DataLibs::setStatus(quint32 status, quint8 dayNumber) {
    status |= (1 << (dayNumber-1));
    return status;
}

QStringList DataLibs::loadBgMusic() {
    QString executableDir = QCoreApplication::applicationDirPath();
    QString path = executableDir + "/" + QString(BGMUSIC_PATH);
    QDir dir(path);
    QStringList list = dir.entryList(QDir::Files);
    QStringList reslist;
    for (const QString &fi : list) {
        reslist << (path + "/" + fi);
    }
    return reslist;
}
