#ifndef CALENDARDATA_H
#define CALENDARDATA_H

#include <QObject>

#define UNINIT_CODE 0x8000

class CalendarData
{
private:
    quint32 lettersStatus;
    bool initialized;
public:
    CalendarData();
    bool loadLettersStatus();
    bool storeLettersStatus();
    quint32 getLetterStatus();
    void setLetterStatus(quint32 status);
};

extern CalendarData calendarData;

#endif // CALENDARDATA_H
