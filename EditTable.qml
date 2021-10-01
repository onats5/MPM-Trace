import QtQuick 2.15
import QtQuick.Window 2.15
//import QtQuick.Controls 1.4

import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import custom 1.0


Window {

    id: propertiesWindow
    modality: Qt.WindowModal
    color: "#d6d6d6"
    width: 300
    height: 700
    title: qsTr("Inventory settings")

    InventoryModel{
        id: invmodel
    }

    ColumnLayout{
        //anchors.centerIn: parent
        Layout.fillWidth: true
        spacing: 10
        x:5
        GridLayout{
           //anchors.centerIn: parent
           Layout.fillWidth: true
           rowSpacing: 4
           columns: 2
           //width: 320
           Text {
               id: typeLabel
               text: qsTr("Type")

                Layout.minimumWidth:110

           }
           ComboBox{
                    id: typeOfProperty
                    model: ["Stencil","Front squeegee","Rear squeegee","Support plate","Solder paste"]
                    Layout.minimumWidth:170
                    Layout.preferredWidth: 170
                    Layout.alignment: Qt.AlignRight

                    onActivated: {
                        forceModel()

                    }
                }



        }
        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2

            width: 295
            Text {
                id: partIdLabel
                text: qsTr("Part ID")

                Layout.minimumWidth:110

            }
            ComboBox{
                    id: partIdInput
                    editable: true
                    //width: 190
                    model: InventoryModel{
                        id: model

                    }
                    onAccepted:{
                        if(find(editText)===-1){
                        model.append({text: editText})
                        }
                    }

                    Layout.alignment: Qt.AlignRight

                    Layout.preferredWidth: 170
                    Layout.minimumWidth:170
                }



        }
        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2
            Text {
                id: partNameLabel
                text: qsTr("Part name")

                Layout.minimumWidth:110

            }
            TextField{
                    id: partNameInput


                    Layout.preferredWidth: 170
                    Layout.minimumWidth:170
                    Layout.alignment: Qt.AlignRight
                }



        }
        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2
            Text {
                id: isEnabled
                text: qsTr("Is enabled")

                Layout.minimumWidth:110

            }
            GroupBox{
                Layout.preferredWidth: 170
                Layout.minimumWidth:170
                 RowLayout{
                    RadioButton{
                        text: "Yes"
                        checked: true
                    }
                    RadioButton{
                        text: "No"
                    }
                }
            }
        }



        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2

            Text {
                id: maxCyclesLabel
                text: qsTr("Max cycles")


                Layout.minimumWidth:110

            }
            TextField{
                    id: maxCyclesInput


                    Layout.preferredWidth: 170
                    Layout.minimumWidth:170
                    validator: IntValidator{bottom:1}
                }
        }
        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2
            Text {
                id: presetStopCyclesLabel
                text: qsTr("Preset cycles stop")


                Layout.minimumWidth:110
            }
            TextField{
                    id: presetStopCyclesInput


                    Layout.preferredWidth: 170
                    Layout.minimumWidth:170
                    validator: IntValidator{bottom:1}
                }
        }
        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2
            Text {
                id: maxTimeLabel
                text: qsTr("Max time [min]")


                Layout.minimumWidth:110
            }
            TextField{
                    id: maxTimeInput


                    Layout.preferredWidth: 170
                    Layout.minimumWidth:170
                    validator: IntValidator{bottom:1}
                }
        }
        GridLayout{
            Layout.fillWidth: true
            rowSpacing: 4
            columns: 2
            Text {
                id: presetTimeLabel
                text: qsTr("Preset time stop [min]")


                Layout.minimumWidth:110

            }
            TextField{
                    id: presetTimeInput

                    Layout.preferredWidth: 170
                    Layout.minimumWidth:170
                    validator: IntValidator{bottom:1}
                }



        }


    RowLayout{
        Layout.fillWidth: true
            Button{
            id: saveButton
            text: "Ok"
            }
            Button{
                id:cancelButton
                text: "Cancel"
                onClicked: close();
            }
            Button{
                id:removeButton
                text: "Remove"
                //onClicked: close();
            }
        }

    }
    function forceModel()
    {

        invmodel.setQuery("select part_id from tbl_for_production_parts where part_type=1",sqlproc.getDatabase());
    }



}
