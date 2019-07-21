from PyQt5.QtQuick import QQuickView
from PyQt5.QtCore import *

from script.MainForm import MainForm

from database.databaseUtils import *
class DBView(QQuickView):

    logSig = pyqtSignal(int,arguments=['ret'])
    def __init__(self,mainForm):
        QQuickView.__init__(self)
        self.mainForm = mainForm
        self.setMinimumWidth(600)
        self.setMinimumHeight(600)
        self.rootContext().setContextProperty('dbView', self)
        self.setSource(QUrl("qml/intro.qml"))
        self.setTitle("Logging")
        self.show()

    @pyqtSlot(str,str)
    def logIn(self, username,password):
        connected = log_in(username,password)
        print(connected)
        if connected :
            self.hide()
            self.mainForm.showMaximized()
            self.logSig.emit(1)
        else :
            self.logSig.emit(0)

