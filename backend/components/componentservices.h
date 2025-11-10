#ifndef COMPONENTSERVICES_H
#define COMPONENTSERVICES_H

#include <QObject>

class ComponentServices {
public:
    ComponentServices();
    static void setSurpriseAsOpen(quint8 dayNumber);
};

#endif // COMPONENTSERVICES_H
