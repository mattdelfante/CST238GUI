#ifndef MUSICVIDEO_H
#define MUSICVIDEO_H

#include <QString>
#include <QObject>
#include <QDebug>

enum Status
{
    SPLASH_SCREEN = 0,
    MUSIC_VIDEO,
    CREDITS
};

class MusicVideo : public QObject
{
    public:
        MusicVideo();

    public slots:
        void setStatus(Status status);
        Status getStatus();

    private:
        Status m_musicVideoStatus;
};

#endif // MUSICVIDEO_H
