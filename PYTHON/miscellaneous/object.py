student={'name':'anu','age':30,'gender':'female'}


student['place']='kozhikode'
print(student)
print(student.keys())
print(student.values())
#print(student.clear())

student2=tuple(student)
print(student2)

#*********out put***********
# {'name': 'anu', 'age': 30, 'gender': 'female', 'place': 'kozhikode'}
# dict_keys(['name', 'age', 'gender', 'place'])
# dict_values(['anu', 30, 'female', 'kozhikode'])
#None
#('name', 'age', 'gender', 'place')



# student_list=[
#     {
#         'name':'anu',
#         'age':30,
#         'gender':'female'
#     },
#     {
#         'name':'ramu',
#         'age':22,
#         'gender':'male'
#     }

# ]

# print(student_list[0])
# print(student_list[0]['age'])

