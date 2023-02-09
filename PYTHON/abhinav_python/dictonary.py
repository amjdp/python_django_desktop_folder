# student=['abhinav',22,'kannur',8589877125,'python','one year',400]
student = {
    'name': 'abhinav',
    'age': 22,
    'place': 'kannur',
    ' ph_no': 8589877125,
    'course': 'python',
    'duration': 'one year',
    '  mark': 400
}
print(student['place'])

students=[
{
    'name': 'abhinav',
    'age': 22,
    'place': 'kannur',
    'ph_no': 8589877125,
    'course': 'python',
    'duration': 'one year',
    'mark': 400
},
{
    'name': 'abhi',
    'age': 45,
    'place': 'kannur-1',
    'ph_no': 8589877125,
    'course': 'python',
    'duration': 'one year',
    'mark': 400
}

]
students[1]['duration']= 'two year'
print(students)