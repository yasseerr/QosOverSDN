from jinja2 import Environment, FileSystemLoader


file_loader = FileSystemLoader('.')

env = Environment(loader=file_loader)
template = env.get_template('AutoQosTemp.j2')

AutoQos_dict = {"interface_name": "GigabitEthernet", "NB1": "1", "NB2": "2", "nameOfAllpolicys": "Server Port",
    "nameOfAllpolicys": "Server Port"}
output = template.render(interface = AutoQos_dict)

print(output)




