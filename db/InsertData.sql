
#################################################################################
INSERT INTO PATIENT
	(PatientName, DiseaseEntity, FoundDate, FirstSurgeryDate)
	VALUES ('Lob', 'Rhegmatogenous', '2021-01-10', '2021-01-11');
INSERT INTO PATIENT
	(PatientName, DiseaseEntity, FoundDate, FirstSurgeryDate)
	VALUES ('Bob', 'Rhegmatogenous', '2021-02-19', '2021-02-23');
INSERT INTO PATIENT
	(PatientName, DiseaseEntity, FoundDate, FirstSurgeryDate)
	VALUES ('John', 'Tractional', '2021-05-13', '2021-05-13');
INSERT INTO PATIENT
	(PatientName, DiseaseEntity, FoundDate, FirstSurgeryDate)
	VALUES ('Chris', 'Tractional', '2021-09-11', '2021-09-17');
INSERT INTO PATIENT
	(PatientName, DiseaseEntity, FoundDate, FirstSurgeryDate)
	VALUES ('Robert', 'Exudative', '2021-12-12', '2021-12-25');
  
   
   
   
   
   

#################################################################################
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (1, 1, '2021-01-11', 'Severe', 1, -6, 13, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (1, 2, '2021-01-18', 'Severe', 1, -7, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (1, 3, '2021-01-30', 'Moderate', 1, -7, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (1, 4, '2021-02-12', 'Moderate', 1, -7, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (1, 5, '2021-04-14', 'Weak', 1, -7, 15, 0);


    

INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (2, 1, '2021-02-23', 'Weak', 0, -3, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (2, 2, '2021-02-24', 'Weak', 0, -3, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (2, 3, '2021-03-13', 'Weak', 0, -3, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (2, 4, '2021-06-14', 'Weak', 0, -3, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (2, 5, '2021-09-16', 'Weak', 0, -3, 15, 0);
    
    
    
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (3, 1, '2021-05-13', 'Severe', 1, -10, 8, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (3, 2, '2021-05-14', 'Severe', 1, -10, 13, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (3, 3, '2021-05-15', 'Severe', 1, -10, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (3, 4, '2021-05-16', 'Severe', 1, -10, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (3, 5, '2021-05-17', 'Moderate', 1, -10, 15, 0);
    


INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue,State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (4, 1, '2021-09-17', 'Moderate', 1, -8, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (4, 2, '2021-09-18', 'Severe', 1, -9, 12, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (4, 3, '2021-09-19', 'Severe', 1, -10, 8, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (4, 4, '2021-09-20', 'Moderate', 1, -10, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (4, 5, '2021-09-21', 'Moderate', 1, -10, 15, 1);



INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (5, 1, '2021-12-25', 'Weak', 1, -8, 15, 1);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (5, 2, '2021-12-26', 'Weak', 1, -8, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (5, 3, '2021-12-28', 'Weak', 1, -8, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (5, 4, '2021-12-29', 'Weak', 1, -8, 15, 0);
INSERT INTO MEDICAL_DATA
	(PatientID, DateID, DateValue, State, IsThereImage, EyeSight, EyePressure, IsThereTreatment)
	VALUES (5, 5, '2021-12-30', 'Weak', 1, -8, 15, 0);








#################################################################################
INSERT INTO DOCTOR
	(DoctorName, HospitalName, SurgeryExperience)
    VALUES ('Dohun', 'Yonsei', 15);
INSERT INTO DOCTOR
	(DoctorName, HospitalName, SurgeryExperience)
    VALUES ('Mikeal', 'Samsung', 20);
INSERT INTO DOCTOR
	(DoctorName, hospitalName, SurgeryExperience)
    VALUES ('Mike', 'Suncheonheong', 10);
INSERT INTO DOCTOR
	(DoctorName, hospitalName, SurgeryExperience)
    VALUES ('Christina', 'Asan', 30);
INSERT INTO DOCTOR
	(DoctorName, hospitalName, SurgeryExperience)
    VALUES ('Lee', 'Korea', 8);







#################################################################################
INSERT INTO TREATMENT
	(TreatmentID, TreatmentName, IsSurgery)
    VALUES (1, 'Scleral buckling', 1); # 공막동륭술
INSERT INTO TREATMENT
	(TreatmentID, TreatmentName, IsSurgery)
    VALUES (2, 'Vitrectomy', 1); # 유리체절제
INSERT INTO TREATMENT
	(TreatmentID, TreatmentName, IsSurgery)
    VALUES (3, 'Retinal Cryopexy', 1); # 망막냉동유착수
INSERT INTO TREATMENT
	(TreatmentID, TreatmentName, IsSurgery)
    VALUES (4, 'Pneumatic Retinopexy', 1); # 기체망막유착수술
INSERT INTO TREATMENT
	(TreatmentID, TreatmentName, IsSurgery)
    VALUES (5, 'Laser Photocoagulation', 0); # 레이저광응고술







#################################################################################
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (1, 1); # 1번 의사는 1번 치료를 수행한다.
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (1, 2); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (1, 5); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (2, 1); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (2, 2);
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (2, 3);
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (2, 5);
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (3, 1);
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (3, 5);
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (4, 1); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (4, 2); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (4, 3); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (4, 4); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (4, 5); 
INSERT INTO TREATMENT_DOCTOR_INT
	(DoctorID, TreatmentID)
    VALUES (5, 5); 
# Summary
# 1번 의사 -> 1,2,5 치료 가능.
# 2번 의사 -> 1,2,3,5 치료 가능.
# 3번 의사 -> 1,5 치료 가능.
# 4번 의사 -> 1,2,3,4,5 치료 가능.
# 5번 의사 -> 5 치료 가능.






#################################################################################
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (1,1,1); # 1번 환자는 1번째 날에 1번 치료를 받는다.
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (1,1,2);
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (1,1,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (1,2,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (1,4,5); 
    
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (2,1,5); 
    
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,1,1); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,1,2); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,1,3); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,1,4); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,1,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,2,1); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,2,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,3,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (3,4,5); 
    
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (4,1,2);
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (4,1,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (4,2,3); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (4,3,1); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (4,4,5); 
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (4,5,5);
    
INSERT INTO DATA_TREATMENT_INT
	(PatientID, DateID, TreatmentID)
    VALUES (5,1,5); 
    
    
    
    








#################################################################################
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (1,1,1); # 1번 환자는 1번째 날에 1번 의사를 만난다.
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (1,2,1);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (1,3,1);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (1,4,1);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (1,5,1);
    
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (2,1,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (2,2,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (2,3,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (2,4,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (2,5,2);
    
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (3,1,3);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (3,2,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (3,3,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (3,4,2);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (3,5,2);

INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (4,1,4);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (4,2,4);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (4,3,4);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (4,4,4);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (4,5,4);
    
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (5,1,5);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (5,2,5);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (5,3,5);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (5,4,5);
INSERT INTO DATA_DOCTOR_INT
	(PatientID, DateID, DoctorID)
    VALUES (5,5,5);
    
    
    
    



#################################################################################
INSERT INTO QUESTION
	(QuestionNumber, PatientID, ViewCount)
    VALUES (1, 1, 100); # 1번 환자가 첫번째 질문을 사이트에 게시하였고, 100명이 이 질문을 보았다.
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (1, 10);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (1, 30);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (1, 60);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (1, 30);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (1, 1);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (2, 1);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (4, 1000);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (4, 500);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (5,200);
INSERT INTO QUESTION
	(PatientID, ViewCount)
    VALUES (5,100);
    
    
    
    
    


#################################################################################
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (1, 1, 5, 100); # 첫번쨰 질문에 대해 5번 의사가 새로운 답변을 달았다. 이 답변은 100점 짜리 답변이다.
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (1, 2, 3, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (2, 1, 3, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (3, 1, 3, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (4, 1, 3, 95);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (5, 1, 3, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (6, 1, 5, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (7, 1, 5, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (8, 1, 4, 100);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (8, 2, 3, 95);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (8, 3, 2, 98);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (8, 4, 1, 80);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (9, 1, 4, 100);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (9, 2, 3, 90);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (10, 1, 1, 100);
INSERT INTO ANSWER
	(QuestionNumber, AnswerNumber, DoctorID, AnswerGrade)
    VALUES (11, 1, 3, NULL);
    
    
    
    



#################################################################################
INSERT INTO RESEARCHER
	(ResearcherName, Major, Interest, Career)
	VALUES ('Son', 'Retinopathy', 'Retinal Detachment', 10); # 망막병증
