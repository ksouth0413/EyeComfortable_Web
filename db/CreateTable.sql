
#################################################################################
CREATE TABLE PATIENT (
	PatientID 		     Int 				NOT NULL AUTO_INCREMENT,
    
	PatientName		     varChar(100)		NOT NULL,
	DiseaseEntity		 varChar(100)		NOT NULL,
	FoundDate      		 date				NULL,
	FirstSurgeryDate     date				NULL,
    
	CONSTRAINT 	PatientPK				  	PRIMARY KEY(PatientID),
    
    CONSTRAINT 	DiseaseEntity CHECK
					(DiseaseEntity IN ('Rhegmatogenous', 'Tractional', 'Exudative')),
                    # 열공성 망막박리, 견인성 망막박리, 삼출성 망막박리
	CONSTRAINT 	DateValuesCheck  CHECK (FoundDate <= FirstSurgeryDate)
	);













#################################################################################
CREATE TABLE MEDICAL_DATA (
	PatientID				 Int				NOT NULL,
    DateID					 Int				NOT NULL,
    
    DateValue			     date				NOT NULL,
	State 					 varChar(100) 		NOT NULL,
	IsThereImage 			 Int				NOT NULL,
	EyeSight 			     Int 		 		NULL,
	EyePressure			 	 Int 				NULL,
	IsThereTreatment 		 Int 				NOT NULL,
    
	CONSTRAINT 	DataPK				 	 PRIMARY KEY(PatientID, DateID),
	CONSTRAINT 	DataPatientFK			 FOREIGN KEY(PatientID)
      						 REFERENCES PATIENT(PatientID)
 							        ON UPDATE CASCADE
							        ON DELETE CASCADE,
	

	CONSTRAINT 	State CHECK
					(State IN ('Severe', 'Moderate', 'Weak', 'Overcomed')),
	CONSTRAINT 	IsThereImage CHECK
					(IsThereImage IN (0,1)),
	CONSTRAINT 	EyeSight CHECK
					(EyeSight Between -10 and -1),
	CONSTRAINT 	EyePressure CHECK
					(EyePressure Between 1 and 20),
	CONSTRAINT 	IsThereTreatment CHECK
					(IsThereTreatment IN (0,1))
	);






#################################################################################
CREATE TABLE DOCTOR (
	DoctorID				 Int				NOT NULL AUTO_INCREMENT,
    
    DoctorName 			     varChar(100)		NOT NULL,
    HospitalName 			 varChar(100)		NOT NULL,
	SurgeryExperience		 Int				NOT NULL,
    
	CONSTRAINT 	DoctorPK				 	 PRIMARY KEY(DoctorID),
    
	CONSTRAINT 	SurgeryExperience		CHECK
				(SurgeryExperience > 0)
	);
    
    
    
    


#################################################################################
CREATE TABLE TREATMENT (
	TreatmentID				 Int				NOT NULL AUTO_INCREMENT,
    
    TreatmentName 			 varChar(100)		NOT NULL,
	IsSurgery 				 Int	 		 	NOT NULL,
	
	CONSTRAINT 	TreatmentPK				 PRIMARY KEY(TreatmentID),
    CONSTRAINT  TreatmentAK				 UNIQUE(TreatmentName),
	
	CONSTRAINT 	IsSurgery CHECK
					(IsSurgery IN (0,1)) # 0 : just little treatment, 1 : Surgery
	);







#################################################################################
CREATE TABLE TREATMENT_DOCTOR_INT(
	DoctorID 			 Int 				NOT NULL,
	TreatmentID 		 Int 				NOT NULL,

	CONSTRAINT 	TDIntPK					PRIMARY KEY(DoctorID, TreatmentID),
	CONSTRAINT 	TDInt_DoctorFK				    FOREIGN KEY(DoctorID)
							   REFERENCES DOCTOR(DoctorID)
 							        ON UPDATE CASCADE
							        ON DELETE CASCADE,
	CONSTRAINT 	TDInt_TreatmentFK  				FOREIGN KEY(TreatmentID)
						       REFERENCES TREATMENT(TreatmentID)
							        ON UPDATE CASCADE
							        ON DELETE CASCADE
	);



#################################################################################
CREATE TABLE DATA_DOCTOR_INT(
	DateID			     Int				NOT NULL,
    PatientID	         Int				NOT NULL,
	DoctorID 			 Int 				NOT NULL,
	
	CONSTRAINT 	DDIntPK					PRIMARY KEY(DateID, PatientID, DoctorID),
	CONSTRAINT 	DDInt_PatientFK		 	FOREIGN KEY(PatientID, DateID)
						       REFERENCES MEDICAL_DATA(PatientID, DateID)
									ON UPDATE CASCADE
							        ON DELETE CASCADE,
	CONSTRAINT 	DDInt_DoctorFK  				FOREIGN KEY(DoctorID)
						       REFERENCES DOCTOR(DoctorID)
							        ON UPDATE CASCADE
							        ON DELETE CASCADE
	);








#################################################################################
CREATE TABLE DATA_TREATMENT_INT(
	PatientID 			 Int 				NOT NULL,
	DateID 			 	 Int		 		NOT NULL,
	TreatmentID 		 Int 				NOT NULL,
	

	CONSTRAINT 	DTIntPK				    PRIMARY KEY(PatientID, DateID, TreatmentID),
	CONSTRAINT 	DTInt_PatientFK		 	FOREIGN KEY(PatientID, DateID)
						       REFERENCES MEDICAL_DATA(PatientID, DateID)
									ON UPDATE CASCADE
							        ON DELETE CASCADE,

                                    
	CONSTRAINT 	DTInt_TreatmentFK  		FOREIGN KEY(TreatmentID)
						       REFERENCES TREATMENT(TreatmentID)
							        ON UPDATE CASCADE
							        ON DELETE CASCADE
	);



#################################################################################
CREATE TABLE QUESTION (
	QuestionNumber 		Int 				NOT NULL auto_increment,
    PatientID			Int					NOT NULL,
    
    ViewCount			Int					NULL,
    
    CONSTRAINT 	QuestionPK				    PRIMARY KEY(QuestionNumber),
    
	CONSTRAINT 	QuestionPatientFK			FOREIGN KEY(PatientID)
						       REFERENCES PATIENT(PatientID)
 							        ON UPDATE CASCADE
									ON DELETE CASCADE,
                                    
	CONSTRAINT 	ViewCount		CHECK
				(ViewCount > 0)
	);





#################################################################################
CREATE TABLE ANSWER (
	AnswerNumber 		Int 				NOT NULL,
    QuestionNumber 		Int 				NOT NULL,
    
    DoctorID			Int					NOT NULL,
    
    AnswerGrade		varChar(100)		NULL,
    
    CONSTRAINT 	AnswerPK				    PRIMARY KEY(AnswerNumber, QuestionNumber),
	CONSTRAINT 	QuestionAnswerFK			FOREIGN KEY(QuestionNumber)
						       REFERENCES QUESTION(QuestionNumber)
 							        ON UPDATE CASCADE
                                    ON DELETE CASCADE,
	CONSTRAINT 	AnswerDoctorFK				FOREIGN KEY(DoctorID)
						       REFERENCES DOCTOR(DoctorID)
 							        ON UPDATE CASCADE
									ON DELETE CASCADE,
                                    
	CONSTRAINT 	AnswerGrade		CHECK
				(AnswerGrade >= 0 and AnswerGrade <= 100)
	);
    
    
    
    
    
    #################################################################################
    CREATE TABLE RESEARCHER (
	ResearcherID 		     Int 				NOT NULL AUTO_INCREMENT,
    
	ResearcherName		     varChar(100)		NOT NULL,
	Major		     		 varChar(100)		NOT NULL,
	Interest	     		 varChar(100)		NOT NULL,
	Career   		  		 Int				NULL,
    
	CONSTRAINT 	ResearchPK				    PRIMARY KEY(ResearcherID),
	CONSTRAINT  ResearchAK					UNIQUE(ResearcherName)
	);
    
    
    
    
    
    
    #################################################################################
    CREATE TABLE PROJECT (
	ProjectID 		   	     Int 				NOT NULL AUTO_INCREMENT,
    ProjectName				 varChar(100)		NULL,
    
    IsRecruting				 Int				NULL DEFAULT 0,
	StartDate		         DATE				NULL,
	EndDate					 DATE				NULL,
    Sector					 varChar(100)		NULL,
   
    
	CONSTRAINT 	ProjectPK				    PRIMARY KEY(ProjectID),
	CONSTRAINT 	ProjectAK				    UNIQUE(ProjectName),

	CONSTRAINT  IsRecruting			CHECK
							(	IsRecruting IN (0,1)	),
	CONSTRAINT	DateConst			CHECK
							(	StartDate < EndDate	)
	);







#################################################################################
CREATE TABLE PROJECT_RESEARCHER_INT(
	ProjectID 			 Int 				NOT NULL,
	ResearcherID 	 	 Int		 		NOT NULL,
	

	CONSTRAINT 	PRIntPK				    PRIMARY KEY(ProjectID, ResearcherID),
	CONSTRAINT 	PRInt_ProjectFK		 	FOREIGN KEY(ProjectID)
						       REFERENCES PROJECT(ProjectID)
									ON UPDATE CASCADE
							        ON DELETE CASCADE,

                                    
	CONSTRAINT 	PRInt_ResearcherFK  		FOREIGN KEY(ResearcherID)
						       REFERENCES RESEARCHER(ResearcherID)
							        ON UPDATE CASCADE
							        ON DELETE CASCADE
	);