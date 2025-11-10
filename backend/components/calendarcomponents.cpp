#include "calendarcomponents.h"

#include "componentservices.h"

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

void Surprise::setData(const SurpriseData &surpriseData) {
    this->text = surpriseData.text;
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

    ComponentServices::setSurpriseAsOpen(this->dayNumber);
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

void MediaSurprise::setData(const SurpriseData &surpriseData) {
    Surprise::setData(surpriseData);
    this->url = surpriseData.mediaUrl;
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

Surprise *SurpriseFactory::create(SurpriseType::Surprise surpriseType) {
    if (surpriseType == SurpriseType::IMAGE) {
        return new MediaSurprise(SurpriseType::IMAGE);
    } else if (surpriseType == SurpriseType::VIDEO) {
        return new MediaSurprise(SurpriseType::VIDEO);
    } else {
        return new Surprise();
    }
}
