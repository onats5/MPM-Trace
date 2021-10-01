import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
//import QtRemoteObjects 5.12
import custom 1.0



Window {
    width: 290
    height: 720
    visible: true
    color: "#d6d6d6"
    title: qsTr("MPM Trace Utility")
    property int mpmEnabled: 0
    property int stencilEnabled: 0
    property int squeegeeF_Enabled: 0
    property int squeegeeR_Enabled: 0
    property int supportEnabled: 0
    property int pasteEnabled: 0

    property int useStencilCounter: 0
    property int useStencilCounterLimit: 0
    property int totalUseStencilCounter: 0
    property int totalUseStencilCounterLimit: 0
    property int rectWidthA: 270
    property int rectWidthB: 250
    property int fontASiz: 17
    property int fontBSiz: 15

    flags: Qt.WindowStaysOnTopHint

    /*{
        Rectangle{
            width: parent.parent.width
            height: 40
            color: "gold"
        }
    }*/


    SqlProcessor{
        id:sqlproc
    }


    Connections{
        target: sqlproc
        function onAnswerFromDatabase(ans,actualCycles,presetCycles,totalCycles,totalLimit,answerText){
            //input.text=scannerInput.text
            //scannerInput.text=""
            setTextEdit(ans,actualCycles,presetCycles,totalCycles,totalLimit,answerText)
            //console.log("OK")
        }
        function onAnswerFromDatabaseProgramSet(stencilName,frontSqueegeeName,rearSqueegeeName,supportName,solderPasteName){
            stencilNameLabel.text = stencilName
            squeegeeFrontNameLabel.text = frontSqueegeeName
            squeegeeRearNameLabel.text = rearSqueegeeName
            supportNameLabel.text = supportName
            pasteNameLabel.text = solderPasteName
            checkEmptySet();
        }
        function onEmitError(text){
            showErrorMessage("Error",text);
        }
        function onAnswerFromDatabaseUserPass(pwd){
            if(pwd){
                //console.log("Pass");
                insertTable.show();
            }else{
                showErrorMessage("Invalid password","Write valid password or contact stanislav.hvizdos@leyardgroup.com");
            }
        }

    }

    Connections{
        target: nexto
        function onProgramNameChanged_signal(name){
            //tcpLabel.text = "Connected";
            prginput.text = name
            clearItems("!CLEAR!");
            checkProgramName();
        }
        /*onInitialized:{
            tcpLabel.text = "Connected";
        }*/
        function onState_signal(text){
            tcpLabel.text = text;
        }
    }


    MessageDialog{
        id: messageDialog
        title: "Error"
            onAccepted: {
                console.log("And of course you could only agree.")

            }

    }
    function setTextEdit(n,a,b,c,d,t){
        switch (n){
        case 0:
            messageDialog.text= "Part "+t+" doesn't exist"
            messageDialog.detailedText = "Please, check if part exist in database, or check scanner"

            messageDialog.setVisible(true)
            break;

        case 1:
            input.text=t
            input.parent.color="#48cc3f"
            stencilEnabled=1
            useStencilCounter=a
            useStencilCounterLimit=b
            totalUseStencilCounter=c
            totalUseStencilCounterLimit=d
        break;
        case 2:
            inputSqueegeeF.text=t
            inputSqueegeeF.parent.color="#48cc3f"
            squeegeeF_Enabled=1
            break;
        case 3:
            inputSqueegeeR.text=t
            inputSqueegeeR.parent.color="#48cc3f"
            squeegeeR_Enabled=1
            break;
        case 4:
            inputSupport.text=t
            inputSupport.parent.color="#48cc3f"
            supportEnabled=1
            break;
        case 5:
            inputPaste.text=t
            inputPaste.parent.color="#48cc3f"
            pasteEnabled=1
            break;

        case 9:
            messageDialog.text= "Part is disabled"
            messageDialog.detailedText = "Please, check this part in database and if you want to use it, enable it"

            messageDialog.setVisible(true)

        break;
        case 99:
            messageDialog.text="Stencil doesn't match with program";
            messageDialog.detailedText = "Please, check if you have the correct stencil, it seems that you have incorect one"
            messageDialog.setVisible(true);
            stencilEnabled=0
            input.text=""
            input.parent.color="#a9a7a7"
            break;
        case 98:
            messageDialog.text="Squeegee front doesn't match with program";
            messageDialog.detailedText = "Please, check if you have the correct squeegee, maybe you have exchanged each other between front and rear"
            messageDialog.setVisible(true);
            squeegeeF_Enabled=0
            inputSqueegeeF.text=""
            inputSqueegeeF.parent.color="#a9a7a7"
            mpmEnabled=0
            prginput.parent.color="#a9a7a7"
            break;
        case 97:
            messageDialog.text="Squeegee rear doesn't match with program";
            messageDialog.detailedText = "Please, check if you have the correct squeegee, maybe you have exchanged each other between front and rear"
            messageDialog.setVisible(true);
            squeegeeR_Enabled=0
            inputSqueegeeR.text=""
            inputSqueegeeR.parent.color="#a9a7a7"
            break;
        case 96:
            messageDialog.text="Support plate doesn't match with program";
            messageDialog.detailedText = "Please, check if you have the correct support plate, be aware, incorrect plate may get to machine damage"
            messageDialog.setVisible(true);
            supportEnabled=0
            inputSupport.text=""
            inputSupport.parent.color="#a9a7a7"
            break;
        case 95:
            messageDialog.text="Solder paste doesn't match with program";
            messageDialog.detailedText = "Please, check if you have the correct solder paste, be aware, incorrect paste may get to quality issue"
            messageDialog.setVisible(true);
            pasteEnabled=0
            inputPaste.text=""
            inputPaste.parent.color="#a9a7a7"
            break;
        default:
           break;
        }
        if(stencilEnabled&&squeegeeF_Enabled&&squeegeeR_Enabled&&supportEnabled&&pasteEnabled){
            prginput.parent.color="#48cc3f"
            mpmEnabled=1
        }else{
            prginput.parent.color="#a9a7a7"
            mpmEnabled=0
        }

        scannerInput.text=""
    }

    function clearItems(t){
        if(t==="!CLEAR!"){
            stencilEnabled=0
            squeegeeF_Enabled=0
            squeegeeR_Enabled=0
            supportEnabled=0
            pasteEnabled=0
            mpmEnabled=0
            prginput.parent.color="#a9a7a7"
            input.text=""
            input.parent.color="#a9a7a7"
            inputSqueegeeF.text=""
            inputSqueegeeF.parent.color="#a9a7a7"
            inputSqueegeeR.text=""
            inputSqueegeeR.parent.color="#a9a7a7"
            inputSupport.text=""
            inputSupport.parent.color="#a9a7a7"
            inputPaste.text=""
            inputPaste.parent.color="#a9a7a7"
            scannerInput.text=""
            useStencilCounter=0
            useStencilCounterLimit=0
            totalUseStencilCounter=0
            totalUseStencilCounterLimit=0
        }else if(t==="!END!"){
            Qt.quit()
        }else if(t==="!INV!"){
            showInputPwdDialog();
        }else if(t!==""){
            sqlproc.checkPartInDatabase(t,prginput.text)
        }
    }

    Column{
        spacing: 5
        /*Rectangle {
                    x: 20
                    y: 20
                    width: 100; height: 100
                    color: "forestgreen"

                    NumberAnimation on x { to: 250; duration: 1000 }
                }*/

        Rectangle{

            //anchors.fill: parent
                    border.color: "#707070"
                    color: "#c1c1c1"
                    radius: 4
                    x:10
                    y: 20
                    width: rectWidthA; height: 90
                    Column{
                        spacing: 10
                        Text{
                            id: prgLabel
                            //verticalAlignment: Text.AlignVCenter
                            font.pixelSize:fontASiz
                            color: "#353333"
                            horizontalAlignment: Text.AlignHLeft
                            //anchors.verticalCenter: parent.verticalCenter
                            text: "MPM program:"
                        }
                        Rectangle{
                            border.color: "#707070"
                            color: "#a9a7a7"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 50

                        Text {
                                    id: prghint
                                    anchors { fill: parent; leftMargin: 14 }
                                    verticalAlignment: Text.AlignVCenter
                                    text: "No program loaded..."
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: prginput.displayText.length ? 0 : 1
                                }
                        Text {
                                    id: prgprefix
                                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: !hint.opacity
                                }
                        TextInput {
                                   id: prginput
                                   focus: false
                                   anchors { left: prgprefix.right; right: parent.right; top: parent.top; bottom: parent.bottom }
                                   verticalAlignment: Text.AlignVCenter
                                   font.pixelSize: fontBSiz
                                   color: "#707070"
                                   horizontalAlignment: Text.AlignHCenter
                                   readOnly: true
                               }
                        }
                    }


        }

        Rectangle{

            //anchors.fill: parent
                    border.color: "#707070"
                    color: "#c1c1c1"
                    radius: 4
                    x:10
                    y: 20
                    width: rectWidthA; height: 130
                    Column{
                        spacing: 10
                        RowLayout{
                            Text{
                                id: stencilLabel
                                //verticalAlignment: Text.AlignVCenter
                                font.pixelSize: fontASiz
                                color: "#353333"
                                horizontalAlignment: Text.AlignHLeft
                                //anchors.verticalCenter: parent.verticalCenter
                                text: "STENCIL:"
                            }
                            Text{
                                id: stencilNameLabel
                                font.pixelSize: 12
                                color: "#353333"
                                horizontalAlignment: Text.AlignHRight
                            }
                        }


                        Rectangle{
                            border.color: "#707070"
                            color: "#a9a7a7"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 50

                        Text {
                                    id: hint
                                    anchors { fill: parent; leftMargin: 14 }
                                    verticalAlignment: Text.AlignVCenter
                                    text: "No stencil loaded..."
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: input.displayText.length ? 0 : 1
                                }
                        Text {
                                    id: prefix
                                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: !hint.opacity
                                }
                        TextInput {
                                   id: input
                                   focus: false
                                   anchors { left: prefix.right; right: parent.right; top: parent.top; bottom: parent.bottom }
                                   verticalAlignment: Text.AlignVCenter
                                   font.pixelSize: fontBSiz
                                   color: "#707070"
                                   horizontalAlignment: Text.AlignHCenter
                                   /*Component.onCompleted: {
                                       input
                                   }*/



                                   //onAccepted: wrapper.accepted()
                                   //text: "EEE"
                                   readOnly: true
                               }
                        }
                        Rectangle{
                            id:stencilCounter
                            border.color: "#707070"
                            color: "#c1c1c1"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 30
                            RowLayout{
                                anchors.fill: parent
                                Label{text:"Counter:";color: "#353333"}
                                Label{text:"Clean:"+useStencilCounter+"/"+useStencilCounterLimit;color: "#353333"}
                                Label{text:"Total:"+totalUseStencilCounter+"/"+totalUseStencilCounterLimit;color: "#353333"}


                            }
                        }
                    }


        }

        Rectangle{

            //anchors.fill: parent
                    border.color: "#707070"
                    color: "#c1c1c1"
                    radius: 4
                    x:10
                    y: 20
                    width: rectWidthA; height: 90
                    Column{
                        spacing: 10
                        RowLayout{
                            Text{
                                id: squeegeeFLabel
                                //verticalAlignment: Text.AlignVCenter
                                font.pixelSize: fontASiz
                                color: "#353333"
                                horizontalAlignment: Text.AlignHLeft
                                //anchors.verticalCenter: parent.verticalCenter
                                text: "SQUEEGEE FRONT:"
                            }
                            Text{
                                id: squeegeeFrontNameLabel
                                font.pixelSize: 12
                                color: "#353333"
                                horizontalAlignment: Text.AlignHRight
                            }
                        }


                        Rectangle{
                            border.color: "#707070"
                            color: "#a9a7a7"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 50

                        Text {
                                    id: hintSqueegeeF
                                    anchors { fill: parent; leftMargin: 14 }
                                    verticalAlignment: Text.AlignVCenter
                                    text: "No squeeggee loaded..."
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: inputSqueegeeF.displayText.length ? 0 : 1
                                }
                        Text {
                                    id: prefixSqueegeeF
                                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: !hintSqueegeeF.opacity
                                }
                        TextInput {
                                   id: inputSqueegeeF
                                   focus: false
                                   anchors { left: prefixSqueegeeF.right; right: parent.right; top: parent.top; bottom: parent.bottom }
                                   verticalAlignment: Text.AlignVCenter
                                   font.pixelSize: fontBSiz
                                   color: "#707070"
                                   horizontalAlignment: Text.AlignHCenter
                                   //onAccepted: wrapper.accepted()
                                   //text: "EEE"
                                   readOnly: true
                               }
                    }
                    }


        }

        Rectangle{

            //anchors.fill: parent
                    border.color: "#707070"
                    color: "#c1c1c1"
                    radius: 4
                    x:10
                    y: 20
                    width: rectWidthA; height: 90
                    Column{
                        spacing: 10
                        RowLayout{
                            Text{
                                id: squeegeeRLabel
                                //verticalAlignment: Text.AlignVCenter
                                font.pixelSize: fontASiz
                                color: "#353333"
                                horizontalAlignment: Text.AlignHLeft
                                //anchors.verticalCenter: parent.verticalCenter
                                text: "SQUEEGEE REAR:"
                            }
                            Text{
                                id: squeegeeRearNameLabel
                                font.pixelSize: 12
                                color: "#353333"
                                horizontalAlignment: Text.AlignHRight
                            }
                        }


                        Rectangle{
                            border.color: "#707070"
                            color: "#a9a7a7"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 50

                        Text {
                                    id: hintSqueegeeR
                                    anchors { fill: parent; leftMargin: 14 }
                                    verticalAlignment: Text.AlignVCenter
                                    text: "No squeeggee loaded..."
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: inputSqueegeeR.displayText.length ? 0 : 1
                                }
                        Text {
                                    id: prefixSqueegeeR
                                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: !hintSqueegeeR.opacity
                                }
                        TextInput {
                                   id: inputSqueegeeR
                                   focus: false
                                   anchors { left: prefixSqueegeeR.right; right: parent.right; top: parent.top; bottom: parent.bottom }
                                   verticalAlignment: Text.AlignVCenter
                                   font.pixelSize: fontBSiz
                                   color: "#707070"
                                   horizontalAlignment: Text.AlignHCenter
                                   //onAccepted: wrapper.accepted()
                                   //text: "EEE"
                                   readOnly: true
                               }
                        }
                    }


        }

        Rectangle{

            //anchors.fill: parent
                    border.color: "#707070"
                    color: "#c1c1c1"
                    radius: 4
                    x:10
                    y: 20
                    width: rectWidthA; height: 90
                    Column{
                        spacing: 10
                        RowLayout{
                            Text{
                                id: supportLabel
                                //verticalAlignment: Text.AlignVCenter
                                font.pixelSize: fontASiz
                                color: "#353333"
                                horizontalAlignment: Text.AlignHLeft
                                //anchors.verticalCenter: parent.verticalCenter
                                text: "SUPPORT PLATE:"
                            }
                            Text{
                                id: supportNameLabel
                                font.pixelSize: 12
                                color: "#353333"
                                horizontalAlignment: Text.AlignHRight
                            }
                        }


                        Rectangle{
                            border.color: "#707070"
                            color: "#a9a7a7"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 50

                        Text {
                                    id: hintSupport
                                    anchors { fill: parent; leftMargin: 14 }
                                    verticalAlignment: Text.AlignVCenter
                                    text: "No support loaded..."
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: inputSupport.displayText.length ? 0 : 1
                                }
                        Text {
                                    id: prefixSupport
                                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: !hintSupport.opacity
                                }
                        TextInput {
                                   id: inputSupport
                                   focus: false
                                   anchors { left: prefixSupport.right; right: parent.right; top: parent.top; bottom: parent.bottom }
                                   verticalAlignment: Text.AlignVCenter
                                   font.pixelSize: fontBSiz
                                   color: "#707070"
                                   horizontalAlignment: Text.AlignHCenter
                                   //onAccepted: wrapper.accepted()
                                   //text: "EEE"
                                   readOnly: true
                               }
                    }
                    }


        }

        Rectangle{

            //anchors.fill: parent
                    border.color: "#707070"
                    color: "#c1c1c1"
                    radius: 4
                    x:10
                    y: 20
                    width: rectWidthA; height: 90
                    Column{
                        spacing: 10
                        RowLayout{
                            Text{
                                id: pasteLabel
                                //verticalAlignment: Text.AlignVCenter
                                font.pixelSize: fontASiz
                                color: "#353333"
                                horizontalAlignment: Text.AlignHLeft
                                //anchors.verticalCenter: parent.verticalCenter
                                text: "SOLDER PASTE:"
                            }
                            Text{
                                id: pasteNameLabel
                                font.pixelSize: 12
                                color: "#353333"
                                horizontalAlignment: Text.AlignHRight
                            }
                        }


                        Rectangle{
                            border.color: "#707070"
                            color: "#a9a7a7"
                            radius: 4
                            x:10
                            y:10
                            width: rectWidthB; height: 50

                        Text {
                                    id: hintPaste
                                    anchors { fill: parent; leftMargin: 14 }
                                    verticalAlignment: Text.AlignVCenter
                                    text: "No paste loaded..."
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: inputPaste.displayText.length ? 0 : 1
                                }
                        Text {
                                    id: prefixPaste
                                    anchors { left: parent.left; leftMargin: 14; verticalCenter: parent.verticalCenter }
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: fontBSiz
                                    color: "#707070"
                                    opacity: !hintPaste.opacity
                                }
                        TextInput {
                                   id: inputPaste
                                   focus: false
                                   anchors { left: prefixPaste.right; right: parent.right; top: parent.top; bottom: parent.bottom }
                                   verticalAlignment: Text.AlignVCenter
                                   font.pixelSize: fontBSiz
                                   color: "#707070"
                                   horizontalAlignment: Text.AlignHCenter
                                   //onAccepted: wrapper.accepted()
                                   //text: "EEE"
                                   readOnly: true
                               }
                    }
                    }


        }

        TextField{
            id: scannerInput
            focus: true
            width: rectWidthA
            height: 50
            x:10
            y:100
            textColor: "#353333"
            placeholderText: qsTr("Scan code here");
            onEditingFinished: {
                //console.log("editing finished");
                //input.text=text
                //input.parent.color="#48cc3f"
                clearItems(text)

                //text=""

            }

        }

    Component.onCompleted: {
        sqlproc.initializeObject();
        nexto.initializeObject();
        //initialization();

    }
    }

    StatusBar{
        id: statusBar
        anchors.bottom: parent.bottom
        /*Item {
                 id: statuscontent
                 anchors { top: statusBar.bottom; left: parent.left; right: parent.right; bottom: parent.bottom }

             }*/
        RowLayout{
            anchors.fill: parent
            Label{id: tcpLabel
                text:"Disconnected"}
            Label{text:"SH"
                //Layout.alignment:right}
                horizontalAlignment:Label.AlignRight}
        }


    }

    Dialog {
        id: pwdDialog
        title: "Input password";
        standardButtons: Dialog.Ok | Dialog.Cancel
        width: 205
        height: 80
        Column{
                 /*Text {
                     id: pwdLabel
                     text: qsTr("Password")
                     color: Style.text
                 }*/
            anchors.fill: parent
                 TextField{
                     id: pwdEdit
                     focus: true
                     echoMode: TextInput.Password
                     //inputMethodHints: Qt.ImhHiddenText
                     textColor: "#353333"
                     width: parent.width
                 }
             }
        onAccepted: {
            sqlproc.checkPass(pwdEdit.text);
            pwdEdit.text="";
        }

    }

    function initialization(){
        console.log("initialization");
        nexto.requestForPrgName();

        /*if(nexto.isReplicaValid){
            tcpLabel.text="Connected";
        }*/
    }

    function checkProgramName(){
        sqlproc.checkProgramSetInDatabase(prginput.text)
    }

    function checkEmptySet(){
        if(stencilNameLabel.text == ""){
            stencilEnabled=true;
        }
        if(squeegeeFLabel.text == ""){
            squeegeeF_Enabled = true;
        }
        if(squeegeeRLabel.text == ""){
            squeegeeR_Enabled = true;
        }
        if(supportNameLabel.text == ""){
            supportEnabled = true;
        }
        if(pasteNameLabel.text == ""){
            pasteEnabled = true;
        }
    }

    function showErrorMessage(textA,textB)
    {
        messageDialog.text=textA;
        messageDialog.detailedText = textB;
        messageDialog.setVisible(true);
    }
    function showInputPwdDialog()
    {
        scannerInput.text=""
        pwdDialog.open();
    }

    EditTable {
        id:insertTable

    }
}




