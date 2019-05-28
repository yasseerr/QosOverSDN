from PyQt5 import QtCore
import napalm

#print(QtCore.__version__)
#print("{:12} {:<10}".format("yaya","123456"))

#topo = TopoScene()

#a:QtCore.QRectF = None

#p1 = QtCore.QPointF(10,20)
#p2 = QtCore.QPointF(30,40)
#p3 = p1+p2

driver  = napalm.get_network_driver("ios")
router1 : napalm.ios.IOSDriver  = driver("10.0.0.2","yasser","p2019")
router1.open()

print(router1.get_facts())
print(router1.get_interfaces())
