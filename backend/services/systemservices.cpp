#include "systemservices.h"


void defineSurprises(LetterContainer* letterContainer) {
    for(int i=0;i<25;i++) {
        if(i%2 == 0) {
            MediaSurprise* surprise = new MediaSurprise(SurpriseType::VIDEO);
            surprise->setText("pippo");
            surprise->setUrl("C:/Users/lgiuliani/Projects/adventCalendar/data/1/example2.mp4");
            letterContainer->getLetter(i)->setSurprise(surprise);
        } else {
            MediaSurprise* surprise2 = new MediaSurprise(SurpriseType::IMAGE);
            surprise2->setText("pippo2");
            surprise2->setUrl("qrc:/images/home.jpg");
            letterContainer->getLetter(i)->setSurprise(surprise2);
        }
    }
}

void generateLetters(LetterContainer* letterContainer) {
    for(int i=0;i<25;i++) {
        Letter* letter = new Letter();
        letter->setDayNumber(i+1);
        letter->setIsOpen(false);
        letterContainer->addLetter(letter);
    }
}

void SystemServices::init(LetterContainer* letterContainer) {
    generateLetters(letterContainer);
    defineSurprises(letterContainer);
}
