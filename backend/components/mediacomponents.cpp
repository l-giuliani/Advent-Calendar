#include "mediacomponents.h"

#include <QRandomGenerator>

PlayList::PlayList() {
    this->current = "";
}

void PlayList::setPlaylist(QStringList playlist) {
    this->playlist = playlist;
}

void PlayList::randomSelect() {
    if(this->playlist.length() == 0) {
        this->current = "";
        emit currentChanged();
    }
    int randomIdx;
    do {
        randomIdx = QRandomGenerator::global()->bounded(0, playlist.length());
    } while (this->current == this->playlist.at(randomIdx));
    this->current = this->playlist.at(randomIdx);

    emit currentChanged();
}

QString PlayList::getCurrent() {
    return this->current;
}

quint16 PlayList::getPlaylistCount() {
    return this->playlist.length();
}
