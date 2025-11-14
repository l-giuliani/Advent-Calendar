#ifndef MEDIACOMPONENTS_H
#define MEDIACOMPONENTS_H

#include <QObject>
#include <QStringList>

class PlayList : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString current READ getCurrent() NOTIFY currentChanged)
    Q_PROPERTY(quint16 count READ getPlaylistCount() CONSTANT)
private:
    QStringList playlist;
    QString current;
public:
    PlayList();
    void setPlaylist(QStringList playlist);
    Q_INVOKABLE
    void randomSelect();
    Q_INVOKABLE
    void stop();
    Q_INVOKABLE
    void restart();
    QString getCurrent();
    quint16 getPlaylistCount();
signals:
    void currentChanged();
};

#endif // MEDIACOMPONENTS_H
