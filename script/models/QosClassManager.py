from script.models.QosClassModel import QosClass
import yaml

from PyQt5.QtCore import QObject


class QosClassManager(QObject):
    def __init__(self,parent=None):
        super().__init__(parent)
        self.classes = dict()

        # load classes from  Yaml file
        self.loadClasses()
        #TODO publish classes to qml


    def loadClasses(self):
        f = open("data/QosClasses.yaml","r")
        data_py = yaml.load(f)
        for class_obj in data_py:
            new_class = QosClass(class_obj)
            self.classes[new_class.name] = new_class
    
    #TODO Save the classes function

