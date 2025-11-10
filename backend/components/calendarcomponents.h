#ifndef CALENDARCOMPONENTS_H
#define CALENDARCOMPONENTS_H

#include <QObject>
#include <QList>

namespace SurpriseType {
Q_NAMESPACE
enum Surprise {
    TEXT,
    IMAGE,
    VIDEO
};
Q_ENUM_NS(Surprise)
}

class Surprise : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString text READ getText CONSTANT)
    Q_PROPERTY(SurpriseType::Surprise surpriseType READ getSurpriseType CONSTANT)
protected:
    SurpriseType::Surprise surpriseType;
    QString text;
public:
    Surprise();
    QString getText();
    void setText(QString text);
    SurpriseType::Surprise getSurpriseType();
};

class MediaSurprise : public Surprise {
    Q_OBJECT
    Q_PROPERTY(QString url READ getUrl CONSTANT)
private:
    QString url;
public:
    MediaSurprise(SurpriseType::Surprise surpriseType);
    QString getUrl();
    void setUrl(QString url);
};

class Letter : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isOpen READ getIsOpen NOTIFY isOpenChanged)
    Q_PROPERTY(quint8 dayNumber READ getDayNumber CONSTANT)
    Q_PROPERTY(Surprise* surprise READ getSurprise CONSTANT)
private:
    bool isOpen;
    quint8 dayNumber;
    Surprise* surprise;
public:
    bool getIsOpen();
    void setIsOpen(bool isOpen);
    Q_INVOKABLE
    void open();
    quint8 getDayNumber();
    void setDayNumber(quint8 dayNumber);
    Surprise* getSurprise();
    void setSurprise(Surprise* surprise);
signals:
    void isOpenChanged();
};

class LetterContainer : public QObject {
    Q_OBJECT
private:
    QList<Letter*> letters;
public:
    Q_INVOKABLE
    Letter* getLetter(quint8 dayNumber);
    void addLetter(Letter* letter);
    void addLetter(Letter* letter, int idx);
};

#endif // CALENDARCOMPONENTS_H
