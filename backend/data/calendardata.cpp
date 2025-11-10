#include "calendardata.h"

#include <QFile>
#include <QByteArray>
#include <QDataStream>
#include "../config/Constants.h"

CalendarData calendarData;

CalendarData::CalendarData() {
    this->initialized = false;
}

bool CalendarData::loadLettersStatus() {
    QString path = STATUS_FILENAME;
    QFile file(path);
    if(!file.exists()) {
        this->lettersStatus = 0;
        if(!this->storeLettersStatus()) {
            return false;
        }
    }
    if (!file.open(QIODevice::ReadOnly)) {
        return false;
    }
    QByteArray data = file.readAll();
    file.close();

    if(data.length() < 4) {
        return false;
    }

    QDataStream stream(data.mid(0,4));
    stream.setByteOrder(QDataStream::LittleEndian);

    stream >> this->lettersStatus;

    return true;
}

bool CalendarData::storeLettersStatus() {
    QString path = STATUS_FILENAME;
    QFile file(path);
    if (!file.open(QIODevice::WriteOnly)) {
        return false;
    }

    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream << this->lettersStatus;

    file.write(data);

    file.close();
    return true;
}

quint32 CalendarData::getLetterStatus() {
    if(!this->initialized) {
        if(this->loadLettersStatus()) {
            this->initialized = true;
        }
    }
    if(!this->initialized) {
        return UNINIT_CODE;
    }
    return this->lettersStatus;
}

void CalendarData::setLetterStatus(quint32 status) {
    this->lettersStatus = status;
}
