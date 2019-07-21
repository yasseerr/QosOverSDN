
import yaml
from PyQt5.QtCore import *

class QosPolicy(object):

    def __init__(self,init_obj):
        self.name = init_obj.get('name', "not_set")
        self.description = init_obj.get('description', "not_set")
        self.className = init_obj.get('className', "not_set")
        self.bandwidthKb = init_obj.get('bandwidthKb', -1)
        self.bandwidthPercent = init_obj.get('bandwidthPercent', -1)
        self.bandwidthRemaining = init_obj.get('bandwidthRemaining', -1)
        self.precedence = init_obj.get('precedence', "not_set")
        self.dscp = init_obj.get('dscp', "not_set")
        self.policyColor = init_obj.get("color", "#336699")
    
    def get_dict(self):
        return {
            'name': self.name,
            'description': self.description,
            'className': self.className,
            'bandwidthKb': self.bandwidthKb,
            'bandwidthPercent': self.bandwidthPercent,
            'bandwidthRemaining': self.bandwidthRemaining,
            'precedence': self.precedence,
            'dscp': self.dscp,
            'policyColor': self.policyColor
        }


class QosPoliciesModel(QAbstractListModel):
    QOS_NAME = Qt.UserRole +1
    QOS_COLOR = Qt.UserRole +2
    QOS_DESCRIPTION = Qt.UserRole +3
    QOS_CLASSNAME = Qt.UserRole +4
    QOS_BANDWIDTHKB = Qt.UserRole +5
    QOS_BANDWITHPERCENT = Qt.UserRole +6
    QOS_BANDWITHREMAINING = Qt.UserRole +7
    QOS_PRECEDENCE = Qt.UserRole +8
    QOS_DSCP = Qt.UserRole +9

    updateModelSig = pyqtSignal()
    def __init__(self,controleWidget,parent =None):
        super().__init__(parent)
        self.qosPolicies = list()
        self.loadPolicies()
        self.controleWidget = controleWidget
    
    def data(self,index : QModelIndex,role:int):
        rowNum = index.row()
        theQosPolicy : QosPolicy = self.qosPolicies[rowNum]
        if(not index.isValid()):
            return QVariant()
        if(role == self.QOS_NAME):
            return theQosPolicy.name
        elif(role == self.QOS_COLOR):
            return theQosPolicy.policyColor
        elif(role == self.QOS_DESCRIPTION):
            return theQosPolicy.description
        elif(role == self.QOS_CLASSNAME):
            return theQosPolicy.className
        elif(role == self.QOS_BANDWIDTHKB):
            return theQosPolicy.bandwidthKb
        elif(role == self.QOS_BANDWITHPERCENT):
            return theQosPolicy.bandwidthPercent
        elif(role == self.QOS_BANDWITHREMAINING):
            return theQosPolicy.bandwidthRemaining
        elif(role == self.QOS_PRECEDENCE):
            return theQosPolicy.precedence
        elif(role == self.QOS_DSCP):
            return theQosPolicy.dscp
        return "wallou"
    
    def rowCount(self, parent=None):
        return len(self.qosPolicies)
    
    def roleNames(self):
        return {
            self.QOS_NAME: b'name',
            self.QOS_COLOR: b'policyColor',
            self.QOS_DESCRIPTION: b'description',
            self.QOS_BANDWIDTHKB: b'bandwidthKb',
            self.QOS_BANDWITHPERCENT: b'bandwidthPercent',
            self.QOS_BANDWITHREMAINING: b'bandwidthRemaining',
            self.QOS_PRECEDENCE: b'precedence',
            self.QOS_DSCP: b'dscp',
            self.QOS_CLASSNAME: b'className',
        }
    
    def loadPolicies(self):
        f = open("data/QosPolicies.yaml", "r")
        data_py = yaml.load(f)
        for policy_obj in data_py:
            new_policy = QosPolicy(policy_obj)
            self.qosPolicies.append(new_policy)

    @pyqtSlot(str, str, str, int, int, int, str,str)
    def addQosPolicy(self, name, description, className, bandwidthKb, bandwidthPercent, bandwidthRemaining, precedence, dscp):
        init_obj = {
            'name': name,
            'description': description,
            'className': className,
            'bandwidthKb': bandwidthKb,
            'bandwidthPercent': bandwidthPercent,
            'bandwidthRemaining': bandwidthRemaining,
            'precedence': precedence,
            'dscp': dscp
        }
        newQosPolicy = QosPolicy(init_obj)
        self.qosPolicies.append(newQosPolicy)
        self.controleWidget.rootContext().setContextProperty('policiesModel', self)
        self.updateModelSig.emit()
        self.saveModel()

    def saveModel(self):
        f = open("data/QosPolicies.yaml", 'w')
        to_dump = []
        for qos_policy in self.qosPolicies:
            to_dump.append(qos_policy.get_dict())
        f.write(yaml.dump(to_dump))
        f.close()

    def getPolicyByName(self,name:QosPolicy):
        for pol in self.qosPolicies:
            if pol.name== name : return pol
        return None

