#ifndef MYTIMER_H
#define MYTIMER_H

#include <QTimer>
#include <QObject>
#include <QDebug>

class MyTimer : public QObject
{
    Q_OBJECT
    public:
        MyTimer();
        ~MyTimer();
        void AddToTotalTime();

    signals:
        void timerTimeout(int totalTimeElapsed);

    public slots:
        void startMyTimer();
        void stopMyTimer();

        //REMOVE
        void startFakeTimer();

    private:
        QTimer * m_timer;
        int m_totalTimeElapsed;
};


#endif // MYTIMER_H
