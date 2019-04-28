from PyQt5.QtCore import QUrl,QRectF,Qt
from PyQt5.QtWidgets import QGraphicsScene,QGraphicsView
from PyQt5.QtGui import QImage,QPixmap,QBrush,QColor
from script.DeviceItem import DeviceItem,LinkItem



class TopoScene(QGraphicsScene):
    def __init__(self):
        super().__init__()
        self.bgImage = QImage("assets/bg_brush2.png")
        self.setBackgroundBrush(QBrush(self.bgImage))
        self.setSceneRect(QRectF(0,0,600,600))
        #TODO initialise the items
        dev1 = DeviceItem("test")
        self.addItem(dev1)

        self.devices = {}
        self.links = []


    def createDevices(self, linkList:list):
        for linkObj in linkList:
            src_name = linkObj["src-switch"]
            dst_name = linkObj["dst-switch"]

            srcDevice:DeviceItem = None
            dstDevice:DeviceItem = None

            if(self.devices.__contains__(src_name)):
                srcDevice = self.devices[src_name]
            else:
                srcDevice = DeviceItem(name=src_name)
                self.devices[src_name] = srcDevice
                srcDevice.setPos(len(self.devices)*200,300)

            if(self.devices.__contains__(dst_name)):
                dstDevice = self.devices[dst_name]
            else:
                dstDevice = DeviceItem(name=dst_name)
                self.devices[dst_name] = dstDevice
                dstDevice.setPos(len(self.devices)*200,300)
            link = LinkItem(srcDevice,dstDevice)
            self.links.append(link)

            srcDevice.links.append(link)
            dstDevice.links.append(link)

            self.addItem(link)
            self.addItem(srcDevice)
            self.addItem(dstDevice)
        

