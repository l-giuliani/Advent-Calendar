#include "componentservices.h"

#include "../libs/datalibs.h"
#include "../data/calendardata.h"

ComponentServices::ComponentServices() {}

void ComponentServices::setSurpriseAsOpen(quint8 dayNumber) {
    quint32 newstatus = DataLibs::setStatus(calendarData.getLetterStatus(), dayNumber);
    calendarData.setLetterStatus(newstatus);
    calendarData.storeLettersStatus();
}
