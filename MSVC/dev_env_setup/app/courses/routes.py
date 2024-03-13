from app.courses import bp 
from app.extensions import db

from app.models.course import CoursesModel, CoursesIn, CoursesOut
from app.models.student import StudentsModel, StudentIn, StudentOut
from app.models.registration import RegistrationIn

# get all courses
@bp.get('/')
@bp.output(CoursesOut(many=True))
def view_courses(database_table=CoursesModel):
    return database_table.query.all()

# get course by id
@bp.get('/<int:course_id>')
@bp.output(CoursesOut)
def view_courses_by_id(course_id, database_table=CoursesModel):
    course = db.get_or_404(database_table, course_id)
    return course

# create new course
@bp.post('/create')
@bp.input(CoursesIn, location='json')
@bp.output(CoursesOut, status_code=201)
def create_course(json_data, database_table=CoursesModel):
    course = database_table(**json_data)
    db.session.add(course)
    db.session.commit()
    return course

# change the information for a db entry
@bp.patch('/<int:course_id>/edit')
@bp.input(CoursesIn(partial=True), location='json')
@bp.output(CoursesOut)
def update_course(course_id, json_data, database_table=CoursesModel):
    course = db.get_or_404(database_table, course_id, )
    for key, value in json_data.items():
        setattr(course, key, value)
    db.session.commit()
    return course

# remove course by id
@bp.delete('/<int:course_id>/remove')
@bp.output(CoursesOut)
def delete_course(course_id, database_table=CoursesModel):
    course = db.get_or_404(database_table, course_id)
    db.session.delete(course)
    db.session.commit()
    return course

# register a student with a course
@bp.post('/<int:course_id>/register')
@bp.input(RegistrationIn, location='json')
@bp.output(CoursesOut, status_code=201)
def register_student(course_id, json_data):
    student_id = json_data["student_id"]
    course_id_json = json_data["course_id"]

    if course_id == course_id_json:
        student = db.get_or_404(StudentsModel, student_id)
        course = db.get_or_404(CoursesModel, course_id_json)

        course.students.append(student)
        db.session.commit()
        return course

# get all students of a course
@bp.get('/<int:course_id>/students')
@bp.output(StudentOut(many=True))
def get_course_students(course_id, database_table=CoursesModel):
    course = db.get_or_404(database_table, course_id)
    students = course.students
    return students
