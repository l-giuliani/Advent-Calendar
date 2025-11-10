#include "systemservices.h"

#include "../libs/datalibs.h"
#include "../components/calendarcomponents.h"
#include "../data/calendardata.h"

void defineSurprises(LetterContainer* letterContainer) {
    SurpriseData surpriseData;
    for(int i=0;i<25;i++) {
        DataLibs::inspectSurpriseDataFolder(surpriseData, i+1);
        Surprise* surprise = SurpriseFactory::create(surpriseData.surpriseType);
        surprise->setData(surpriseData);
        letterContainer->getLetter(i)->setSurprise(surprise);
    }
}

void generateLetters(LetterContainer* letterContainer) {
    QStringList lettersImageList = DataLibs::retrieveLettersImages();
    for(int i=0;i<25;i++) {
        Letter* letter = new Letter();
        letter->setDayNumber(i+1);
        letter->setIsOpen(DataLibs::getStatus(calendarData.getLetterStatus(), i+1));
        letter->setImage(DataLibs::getRandomLettersImage(lettersImageList));
        letterContainer->addLetter(letter);
    }
}

void SystemServices::init(LetterContainer* letterContainer) {
    generateLetters(letterContainer);
    defineSurprises(letterContainer);
}
