#include "calendarcomponents.h"

Surprise::Surprise() {
    this->surpriseType = SurpriseType::TEXT;
}

QString Surprise::getText() {
    return this->text;
}

void Surprise::setText(QString text) {
    this->text = text;
}

SurpriseType::Surprise Surprise::getSurpriseType() {
    return this->surpriseType;
}

bool Letter::getIsOpen() {
    return this->isOpen;
}

void Letter::setIsOpen(bool isOpen) {
    this->isOpen = isOpen;
}

void Letter::open() {
    this->isOpen = true;
    emit isOpenChanged();
}

quint8 Letter::getDayNumber() {
    return this->dayNumber;
}

void Letter::setDayNumber(quint8 dayNumber) {
    this->dayNumber = dayNumber;
}

Surprise *Letter::getSurprise() {
    return this->surprise;
}

void Letter::setSurprise(Surprise *surprise) {
    this->surprise = surprise;
}

MediaSurprise::MediaSurprise(SurpriseType::Surprise surpriseType) {
    this->surpriseType = surpriseType;
}

QString MediaSurprise::getUrl() {
    return this->url;
}

void MediaSurprise::setUrl(QString url) {
    this->url = url;
}

Letter* LetterContainer::getLetter(quint8 dayNumber) {
    return this->letters.at(dayNumber);
}

void LetterContainer::addLetter(Letter* letter) {
    this->letters.append(letter);
}

void LetterContainer::addLetter(Letter* letter, int idx) {
    this->letters[idx] = letter;
}
