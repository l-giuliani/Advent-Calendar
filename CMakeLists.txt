cmake_minimum_required(VERSION 3.16)

project(adventCalendar VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Multimedia)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_resources(APP_RESOURCES
    resources.qrc
)


qt_add_executable(appadventCalendar
    main.cpp
    ${APP_RESOURCES}
)

qt_add_qml_module(appadventCalendar
    URI adventCalendar
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES frontend/components/Letter.qml
        QML_FILES frontend/components/Calendar.qml
        SOURCES backend/components/calendarcomponents.h backend/components/calendarcomponents.cpp
        SOURCES backend/services/systemservices.h backend/services/systemservices.cpp
        QML_FILES frontend/components/Surprise.qml
        QML_FILES frontend/components/surprise/TextSurprise.qml
        QML_FILES frontend/components/surprise/MediaSurprise.qml
        SOURCES backend/libs/datalibs.h backend/libs/datalibs.cpp
        SOURCES backend/config/Constants.h
        SOURCES backend/dto/calendardto.h backend/dto/calendardto.cpp
        SOURCES backend/data/calendardata.h backend/data/calendardata.cpp
        SOURCES backend/components/componentservices.h backend/components/componentservices.cpp
        QML_FILES frontend/components/VMediaPlayer.qml
        QML_FILES frontend/components/Snow.qml
        QML_FILES frontend/components/Sparks.qml
        SOURCES backend/components/mediacomponents.h backend/components/mediacomponents.cpp
        QML_FILES frontend/components/BgMusic.qml
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(appadventCalendar PRIVATE DEBUG)
endif()

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appadventCalendar PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appadventCalendar
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appadventCalendar
    PRIVATE Qt6::Quick
)
target_link_libraries(appadventCalendar PRIVATE Qt6::Core Qt6::Multimedia)

include(GNUInstallDirs)
install(TARGETS appadventCalendar
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
