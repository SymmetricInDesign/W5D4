class Course < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :user

    belongs_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User

    has_many :advance_courses,
        class_name: :Course,
        primary_key: :id,
        foreign_key: :prereq_id

    belongs_to :pre_course,
        class_name: :Course,
        primary_key: :id,
        foreign_key: :prereq_id
    
end
