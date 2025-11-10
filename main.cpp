#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "backend/services/systemservices.h"
#include "backend/components/calendarcomponents.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterUncreatableMetaObject(
        SurpriseType::staticMetaObject,
        "adventCalendarEnums", 1, 0,
        "SurpriseType",
        "Error: only enums"
    );

    QQmlApplicationEngine engine;

    LetterContainer* letterContainer = new LetterContainer();
    SystemServices::init(letterContainer);
    engine.rootContext()->setContextProperty("letterContainer", letterContainer);


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("adventCalendar", "Main");

    return app.exec();
}
