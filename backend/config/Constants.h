#ifndef CONSTANTS_H
#define CONSTANTS_H

// #define DATA_PATH "C:/Users/lgiuliani/Projects/adventCalendar/data"
// #define LETTERS_IMG_PATH "C:/Users/lgiuliani/Projects/adventCalendar/data/letters"
// #define STATUS_FILENAME "C:/Users/lgiuliani/Projects/adventCalendar/data/status.dat"

#ifndef DEBUG
    #define DATA_PATH "../data"
    #define LETTERS_IMG_PATH "../data/letters"
    #define STATUS_FILENAME "../data/status.dat"
#else
    #define DATA_PATH "../../../data"
    #define LETTERS_IMG_PATH "../../../data/letters"
    #define STATUS_FILENAME "../../../data/status.dat"
#endif
#endif // CONSTANTS_H
