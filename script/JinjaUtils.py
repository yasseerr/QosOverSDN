from jinja2 import Environment, FileSystemLoader

# def AutoQosJija(interface_name,NB1,NB2,nameOfAllpolicys):
#     file_loader = FileSystemLoader('./../Templates')
#
#     env = Environment(loader=file_loader)
#     # TODO lien nta3 AutoQosTempl
#     template = env.get_template('AutoQosTemp.j2')
#
#     AutoQos_dict = {"interface_name": interface_name, "NB1": NB1, "NB2": NB2, "nameOfAllpolicys": nameOfAllpolicys,
#         "nameOfAllpolicys": nameOfAllpolicys}
#     output = template.render(interface = AutoQos_dict)
#
#     return output
# print(AutoQosJija("g1",1,1,"h"))


def Classification(Name,MatchAny_OR_All,description,MatchProtocls,Precedence,DSCP):
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
print(Classification("nameclass","disc","any",["a","ad","v","v"],5,"af11"))





