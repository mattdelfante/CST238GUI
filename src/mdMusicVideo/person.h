#ifndef PERSON_H
#define PERSON_H

#include <QString>
#include <QObject>
#include <QDebug>

class Person : public QObject
{
    Q_OBJECT
    public:
        Person();

    public slots:
        void setDancing(bool dancing);
        bool getDancing();
        void setWalking(bool walking);
        bool getWalking();

    protected:
        bool m_isDancing;
        bool m_isWalking;
};
#endif // PERSON_H
