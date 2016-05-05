#include "../c++HeaderFiles/mytimer.h"

MyTimer::MyTimer()
{
    m_timer = new QTimer(this);
    m_timer->setTimerType(Qt::PreciseTimer);
    m_timer->setInterval(100);
    m_timer->setSingleShot(false);
    QObject::connect(m_timer, &QTimer::timeout, this, &MyTimer::AddToTotalTime);
}

MyTimer::~MyTimer()
{
    m_timer->stop();
    delete m_timer;
    m_totalTimeElapsed = 0;
}

void MyTimer::AddToTotalTime()
{
    m_totalTimeElapsed += m_timer->interval();
    emit timerTimeout(m_totalTimeElapsed);
}

