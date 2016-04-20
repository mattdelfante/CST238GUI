#include "c++HeaderFiles/musicvideo.h"

MusicVideo::MusicVideo() : m_musicVideoStatus(SPLASH_SCREEN)
{}

void MusicVideo::setStatus(Status status)
{
    m_musicVideoStatus = status;
}

Status MusicVideo::getStatus()
{
    return m_musicVideoStatus;
}
