COPY (
    SELECT u.username,p.has_active_subscription,p.last_login_date 
    FROM auth_user AS u JOIN
andrewslearningapi_profile AS p ON u.id=p.user_id) 
TO '/home/ab/questionnaire_analysis/users.csv' WITH CSV HEADER;


COPY (SELECT q.text,q.difficulty,qr.user_answer,q.correct_answer FROM andrewslearningapi_questionresponse AS
qr JOIN andrewslearningapi_question AS q ON qr.question_id=q.id
WHERE course_id=(SELECT id FROM andrewslearningapi_course AS c WHERE c.name='Organic Chemistry')
)
TO '/home/ab/questionnaire_analysis/difficult_orgo_questions.csv' WITH CSV HEADER;


COPY (SELECT q.text,q.difficulty,qr.user_answer,q.correct_answer FROM andrewslearningapi_questionresponse AS
qr JOIN andrewslearningapi_question AS q ON qr.question_id=q.id
WHERE course_id=(SELECT id FROM andrewslearningapi_course AS c WHERE c.name='Biochemistry')
)
TO '/home/ab/questionnaire_analysis/difficult_biochem_questions.csv' WITH CSV HEADER;

COPY (SELECT q.text,q.difficulty,qr.user_answer,q.correct_answer FROM andrewslearningapi_questionresponse AS
qr JOIN andrewslearningapi_question AS q ON qr.question_id=q.id
WHERE course_id=(SELECT id FROM andrewslearningapi_course AS c WHERE c.name='Biochemistry')
)
TO '/home/ab/questionnaire_analysis/difficult_pharm_questions.csv' WITH CSV HEADER;
