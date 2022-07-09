# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += qmltypes
CONFIG += felgo
QML_IMPORT_NAME = based
QML_IMPORT_MAJOR_VERSION = 1
# uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
# for the remaining steps to build a custom Live Code Reload app see here: https://felgo.com/custom-code-reload-app/
# CONFIG += felgo-live

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.yourcompany.wizardEVP.Platformer
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

# Optionally set a license key that is used instead of the license key from
# main.qml file (App::licenseKey for your app or GameWindow::licenseKey for your game)
# Only used for local builds and Felgo Cloud Builds (https://felgo.com/cloud-builds)
# Not used if using Felgo Live
PRODUCT_LICENSE_KEY = "1B311D910312A8A54820FA710F1633B20169187EC13CFFF9AFD5B87DA2D18FAD4F240513A939D8BC419C1C1B1DE3E0E91854D80554F9B6534D8DC14BBC8F4C842115F1664E16510A61D4EBF2E7C695BCC350ED7F5E8F329A83258280BF551E52467574384623B5B0673EBC2B3A29A4775D4460645E06E9F45C3F82FF65424CC6EAADF57746EDDBAC68FA76D158AA83E8A6642C65230551137E97E1819318D555B3459081687A99658293521EA02491E48A853ACF7BD16D590840C60764F934F8E664E4FF2223874FF22078024867DF7528D8BB397C01AAC672696558394C33628A62CC3A4E2E169B4D9DDF7D5E8A9FD54A959A50CFBB9EDA13BDB8311599A31F45A3515177A8BB443B46C6B2A7B6BF669022210FCCF2BAA774851E49D5892C7EF18C0F21A706AC17013A5F513563D32B55EF332CDC7169E6AC3507060143F90BF5E81FFC13D447729BB3FE01BF1161DCFCF0FEF092D12CB0F7130EB7D776AF34 "

qmlFolder.source = qml
DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
DEPLOYMENTFOLDERS += assetsFolder

# Add more folders to ship with the application here

# RESOURCES += resources.qrc # uncomment for publishing

# NOTE: for PUBLISHING, perform the following steps:
# 1. comment the DEPLOYMENTFOLDERS += qmlFolder line above, to avoid shipping your qml files with the application (instead they get compiled to the app binary)
# 2. uncomment the resources.qrc file inclusion and add any qml subfolders to the .qrc file; this compiles your qml files and js files to the app binary and protects your source code
# 3. change the setMainQmlFile() call in main.cpp to the one starting with "qrc:/" - this loads the qml files from the resources
# for more details see the "Deployment Guides" in the Felgo Documentation

# during development, use the qmlFolder deployment because you then get shorter compilation times (the qml files do not need to be compiled to the binary but are just copied)
# also, for quickest deployment on Desktop disable the "Shadow Build" option in Projects/Builds - you can then select "Run Without Deployment" from the Build menu in Qt Creator if you only changed QML files; this speeds up application start, because your app is not copied & re-compiled but just re-interpreted


# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

DISTFILES += \
    qml/AudioManager.qml \
    qml/Gamescene.qml \
    qml/Main.qml \
    qml/common/ButtonBase.qml \
    qml/common/ImageButton.qml \
    qml/entities/Coin.qml \
    qml/entities/Enemybased.qml \
    qml/entities/JumperEnemy.qml \
    qml/entities/Mushroom.qml \
    qml/entities/Finish.qml \
    qml/entities/Obstaclesbased.qml \
    qml/entities/Platform.qml \
    qml/entities/Player.qml \
    qml/entities/Propbased.qml \
    qml/entities/RoadBlockDirt.qml \
    qml/entities/RoadBlockGrass.qml \
    qml/entities/Spikeball.qml \
    qml/entities/Star.qml \
    qml/entities/WalkerEnemy.qml \
    qml/levels/LevelBase.qml \
    qml/levels/LevelSelection.qml \
    qml/scenes/FinishScene.qml \
    qml/scenes/GameScene.qml \
    qml/scenes/LevelScene.qml \
    qml/scenes/MenuScene.qml \
    qml/scenes/OptionScene.qml \
    qml/scenes/SceneBase.qml \
    qml/scenes/SelectLevelScene.qml

HEADERS += \
    Play.h
