from jinja2 import Environment, FileSystemLoader

def AutoQosJija(interface_name,NB1,NB2,nameOfAllpolicys):
    file_loader = FileSystemLoader('./../Templates')

    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('AutoQosTemp.j2')

    AutoQos_dict = {"interface_name": interface_name, "NB1": NB1, "NB2": NB2, "nameOfAllpolicys": nameOfAllpolicys,
        "nameOfAllpolicys": nameOfAllpolicys}
    output = template.render(interface = AutoQos_dict)

    return output
#print(AutoQosJija("g1",1,1,"h"))


def clasificationJija(Name,description,MatchAny_OR_All,MatchProtocls:list,Precedence,DSCP):
    file_loader = FileSystemLoader('./../Templates')
    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('ClasiificationTemp.j2')

    clasification_dict = {"Name":Name, "description": description, "MatchAny_OR_All": MatchAny_OR_All,
                    "MatchProtocls": MatchProtocls,
                    "Precedence": Precedence,
                    "DSCP":DSCP
                    }
    output = template.render(clasification=clasification_dict)
    return output
#print(clasificationJija("nameclass","disc","any",["HTTP","ICMP","FTTP","FTP"],5,"af11"))


def polcingJija(Name,description,Class_Map_Name,BandwithKPS,bandwidthPercent,bandwidthRemaining,ipprecedence,ipdscp):
    file_loader = FileSystemLoader('./../Templates')
    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('policyTemp.j2')

    policing_dict = {"Name":Name, "description": description, "Class_Map_Name" : Class_Map_Name,
                    "BandwithKPS":BandwithKPS,
                    "bandwidthPercent":bandwidthPercent,
                    "bandwidthRemaining":bandwidthRemaining,
                     "ipprecedence" : ipprecedence,
                     "ipdscp" : ipdscp
                    }
    output = template.render(policing=policing_dict)
    return output

#print(polcingJija("name","desssssssssssssss","a",22,"","","",""))


def servicePolicyJija(interface_name,n1,n2,inout_put,nameOfpolicy):
    file_loader = FileSystemLoader('./../Templates')
    env = Environment(loader=file_loader)
    # TODO lien nta3 AutoQosTempl
    template = env.get_template('SercicePolicyTemp.j2')

    servicePolicing_dict = {"interface_name" : interface_name, "n1" : n1, "n2" : n2 ,"inout_put" : inout_put,
                            "nameOfpolicy" : nameOfpolicy}
    output = template.render(servicePolicing = servicePolicing_dict)
    return output

print(servicePolicyJija("g",2,3,"input","r"))