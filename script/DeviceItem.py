from PyQt5.QtCore import QUrl,QRectF,Qt,QPoint,QLineF
from PyQt5.QtWidgets import QGraphicsScene,QGraphicsView,QGraphicsItem,QGraphicsSceneMouseEvent,QGraphicsLineItem
from PyQt5.QtGui import QPainter,QImage,QPen



class DeviceItem(QGraphicsItem):

    deviceTypes = ["router","switch","terminal"]
    deviceImages = {
        "router":QImage("assets/router.png").scaled(100,80,Qt.KeepAspectRatio),
        "switch":QImage("assets/switch.png").scaled(100,80,Qt.KeepAspectRatio)
    }
    
    def __init__(self,name:str):
        super().__init__()
        self.namePen = QPen()
        self.namePen.setWidthF(0.5)
        self.setZValue(20)
        self.setAcceptHoverEvents(True)
        self.setEnabled(True)
        self.setFlags(QGraphicsItem.ItemIsMovable)
        self.deviceType = "switch"
        self.neighbors = []
        self.links = []
        self.name = name

    def boundingRect(self):
        return QRectF(-25,0,150,100)

    def paint(self,painter:QPainter,style,widget):
        #painter.fillRect(self.boundingRect(),Qt.red)
        painter.drawImage(QPoint(0,35),self.deviceImages[self.deviceType])
        painter.setPen(self.namePen)
        painter.drawText(QRectF(-25,0,150,20),Qt.AlignCenter,self.name)


    def mouseMoveEvent(self,event:QGraphicsSceneMouseEvent):
        super().mouseMoveEvent(event)
        for l in self.links:
            l.updateLine()



class LinkItem(QGraphicsLineItem):
    linkPen = QPen()
    def __init__(self,src:DeviceItem,des:DeviceItem):
        super().__init__()
        self.setZValue(10)
        self.setOpacity(0.6)
        self.linkPen.setWidth(4)
        self.linkPen.setColor(Qt.darkBlue)
        self.setPen(self.linkPen)
        self.src = src
        self.des = des
        line_t = QLineF()
        line_t.setP1(src.pos() + src.boundingRect().center())
        line_t.setP2(des.pos() +des.boundingRect().center())
        self.setLine(line_t)
        #print("P1X : {0:3} P1Y :{1:3}".format(line.p1().x(),line.p1().y()))
        #print("P2X : {0:3} P2Y :{1:3}".format(line.p2().x(),line.p2().y()))
        self.setLine(line_t)

    def updateLine(self):
        line_t = QLineF()
        line_t.setP1(self.src.pos() + self.src.boundingRect().center())
        line_t.setP2(self.des.pos() +self.des.boundingRect().center())
        self.setLine(line_t)
        self.update()
