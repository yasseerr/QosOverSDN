# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui/mainform.ui'
#
# Created by: PyQt5 UI code generator 5.9.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(1014, 671)
        self.horizontalLayout = QtWidgets.QHBoxLayout(Form)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setSpacing(1)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.menuWidget = QtQuickWidgets.QQuickWidget(Form)
        self.menuWidget.setMinimumSize(QtCore.QSize(300, 0))
        self.menuWidget.setMaximumSize(QtCore.QSize(300, 16777215))
        self.menuWidget.setResizeMode(QtQuickWidgets.QQuickWidget.SizeRootObjectToView)
        self.menuWidget.setSource(QtCore.QUrl("file:///C:/Users/HP/Desktop/QosOverSDN/qml/menuQml.qml"))
        self.menuWidget.setObjectName("menuWidget")
        self.horizontalLayout.addWidget(self.menuWidget)
        self.topologieView = QtWidgets.QGraphicsView(Form)
        self.topologieView.setObjectName("topologieView")
        self.horizontalLayout.addWidget(self.topologieView)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))

from PyQt5 import QtQuickWidgets

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())

