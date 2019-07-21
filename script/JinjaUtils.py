from jinja2 import Environment, FileSystemLoader
from script.NapalmUtils import send_config_file
from script.Device import Device
from script.models.QosClassModel import QosClass
from script.models.QosPoliciesModel import QosPolicy
def autoQosJija(interface_name,NB1,NB2):
    file_loader = FileSystemLoader('Templates')

    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('AutoQosTemp.j2')

    AutoQos_dict = {"interface_name": interface_name, "NB1": NB1, "NB2": NB2}
    output = template.render(interface = AutoQos_dict)

    f = open("autoqos.cfg",'w')
    f.write(output)
    f.close()

#autoQosJija("g",1,1,"a")
#send_config_file("temp.cfg",Device({'id':5,'username':'projet2019',
#'password':'projet2019','secret':'projet2019','ipAddr':'13.0.0.1','neighbors':[],'os':'ios'}))



def classification(clasificationObjet : QosClass):
    file_loader = FileSystemLoader('Templates')
    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('ClasiificationTemp.j2')
    # clasification_dict = {"Name":Name, "description": description, "MatchAny_OR_All": MatchAny_OR_All,
    #                 "MatchProtocls": MatchProtocls,
    #                 "Precedence": Precedence,
    #                 "DSCP":DSCP
    #                 }
    output = template.render(clasification=clasificationObjet.get_dict())
    f = open("classification.cfg", 'w')
    f.write(output)
    f.close()


"""
qos = QosClass({'name': "name",
            'description':"description",
            'match': "match",
            'protocoles':['s','s'],
            'precedence':"precedence",
            'dscp':"dscp",
            'interfaceType': "interfaceType",
            'interfaceIndex1':"interfaceIndex1",
            'interfaceIndex2': "interfaceIndex2",
            'macAddr': "macAddr",
            'color': "classColor"
                    })
classification(qos)
"""



#print(Classification("nameclass","disc","any",["a","ad","v","v"],5,"af11"))


def policingJija(QosP : QosPolicy):
    file_loader = FileSystemLoader('Templates')
    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('policyTemp.j2')

    # policing_dict = {"Name":Name, "description": description, "Class_Map_Name" : Class_Map_Name,
    #                 "BandwithKPS":BandwithKPS,
    #                 "bandwidthPercent":bandwidthPercent,
    #                 "bandwidthRemaining":bandwidthRemaining,
    #                  "ipprecedence" : ipprecedence,
    #                  "ipdscp" : ipdscp
    #                 }
    output = template.render(policing=policing_dict)
    f = open("policing.cfg", 'w')
    f.write(output)
    f.close()



#print(polcingJija("name","desssssssssssssss","a",22,"","","",""))


def servicePolicyJija(interface_name,n1,n2,inout_put,nameOfpolicy):
    file_loader = FileSystemLoader('Templates')
    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('SercicePolicyTemp.j2')

    servicePolicing_dict = {"interface_name" : interface_name, "n1" : n1, "n2" : n2 ,"inout_put" : inout_put,
                            "   nameOfpolicy" : nameOfpolicy}
    output = template.render(servicePolicing = servicePolicing_dict)
    return output

#print(servicePolicyJija("g",2,3,"input","r"))
