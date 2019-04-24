# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ui/mainform.ui',
# licensing of 'ui/mainform.ui' applies.
#
# Created: Tue Apr 23 16:43:40 2019
#      by: pyside2-uic  running on PySide2 5.12.1
#
# WARNING! All changes made in this file will be lost!

from PySide2 import QtCore, QtGui, QtWidgets

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(1014, 671)
        self.horizontalLayout = QtWidgets.QHBoxLayout(Form)
        self.horizontalLayout.setSpacing(1)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.menuWidget = QQuickWidget(Form)
        self.menuWidget.setMinimumSize(QtCore.QSize(300, 0))
        self.menuWidget.setMaximumSize(QtCore.QSize(300, 16777215))
        self.menuWidget.setResizeMode(QQuickWidget.SizeRootObjectToView)
        self.menuWidget.setSource(QtCore.QUrl("file:///C:/Users/HP/Desktop/QosOverSDN/qml/menuQml.qml"))
        self.menuWidget.setObjectName("menuWidget")
        self.horizontalLayout.addWidget(self.menuWidget)
        self.topologieView = QtWidgets.QGraphicsView(Form)
        self.topologieView.setObjectName("topologieView")
        self.horizontalLayout.addWidget(self.topologieView)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        Form.setWindowTitle(QtWidgets.QApplication.translate("Form", "Form", None, -1))

from QtQuickWidgets.QQuickWidget import QQuickWidget
