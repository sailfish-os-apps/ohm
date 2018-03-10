import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    ListModel {
        id: pagesModel

        ListElement {
            pin: "PIN 1"
            col: "White/Orange"
            title: "Tx+"
            description: "Tx+"
        }
        ListElement {
            pin: "PIN 2"
            col: "Orange"
            title: "Tx-"
            description: "Tx-"
        }
        ListElement {
            pin: "PIN 3"
            col: "White/Green"
            title: "Rx+"
            description: "Rx+"
        }
        ListElement {
            pin: "PIN 4"
            col: "Blue"
            title: "-"
            description: "Not used"
        }
        ListElement {
            pin: "PIN 5"
            col: "White/Blue"
            title: "-"
            description: "Not used"
        }
        ListElement {
            pin: "PIN 6"
            col: "Green"
            title: "Rx-"
            description: "Rx-"
        }
        ListElement {
            pin: "PIN 7"
            col: "White/Brown"
            title: "-"
            description: "Not used"
        }
        ListElement {
            pin: "PIN 8"
            col: "Brown"
            title: "-"
            description: "Not used"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id: pagehead
            title: "RJ-45 pin assignments"
        }

        Column {
            id: column
            anchors {
                top: pagehead.bottom
            }
            SectionHeader {
                text: qsTr("Ethernet male")
            }
            Image {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/rj45-male.png"
                width: 350 * resScale
                height: 200 * resScale
            }
            SectionHeader {
                text: qsTr("Ethernet female")
            }
            Image {
                id: img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 0
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/rj45-female.png"
                width: 350 * resScale
                height: 200 * resScale
            }

            Separator {
                id: effect
                color: Theme.primaryColor
                width: page.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }

            VerticalScrollDecorator {
            }

            Repeater {
                id: list
                model: pagesModel
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id: combx
                    //  height : Theme.itemSizeSmall / 1.5
                    width: parent.width
                    currentIndex: -1
                    menu: ContextMenu {
                        MenuItem {
                            Label {
                                text: pagesModel.get(index).description
                                font.pixelSize: Theme.fontSizeExtraSmall / 1.5 * resScale
                                color: Theme.primaryColor
                                anchors {
                                    verticalCenter: parent.verticalCenter
                                    horizontalCenter: parent.horizontalCenter
                                }
                            }
                            onClicked: combx.currentIndex = -1
                        }
                    }
                    Label {
                        anchors {
                            left: parent.horizontalCenter
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.title
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id: co
                        anchors {
                            left: pin.right
                            leftMargin: Theme.paddingLarge * 2
                            rightMargin: Theme.paddingLarge * 2
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.col
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id: pin
                        anchors {
                            left: parent.left
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.pin
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                }
            }
        }
    }
}