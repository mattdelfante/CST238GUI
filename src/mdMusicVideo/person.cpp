#include"Person.h"

Person::Person() : m_isDancing(false), m_isWalking(false)
{}

void Person::setDancing(bool dancing)
{
    m_isDancing = dancing;
}

bool Person::getDancing()
{
    return m_isDancing;
}

void Person::setWalking(bool walking)
{
    m_isWalking = walking;
}

bool Person::getWalking()
{
    return m_isDancing;
}

