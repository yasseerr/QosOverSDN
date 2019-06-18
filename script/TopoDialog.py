from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import QDialog
from ui.ui_addRouterDialog import Ui_Dialog
class TopoDialog(QDialog):
    
    def __init__(self):
        QDialog.__init__(self)
        self.ui = Ui_Dialog()
        self.ui.setupUi(self)
        self.ui.quickWidget.setSource(QUrl("qml/AddRouter.qml"))


