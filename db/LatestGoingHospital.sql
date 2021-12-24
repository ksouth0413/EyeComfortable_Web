#################################################################################
CREATE TABLE LATEST_GOING_HOSPITAL(
	PatientID 		     Int 				NOT NULL,
	PatientName		     varChar(100)		NULL,
    
    LatestDate			 Date				NULL,
	State 				 varChar(100) 		NULL,
    Term				 Int				NULL,
    Alert 				 Int				NULL,
	DoctorID			 Int				NULL,

    CONSTRAINT 	LGH_PatientPK					PRIMARY KEY(PatientID),
	CONSTRAINT 	LGH_PatientAK				   	UNIQUE(PatientName),
    CONSTRAINT  LGH_PatientFK					FOREIGN KEY(PatientID)
							   REFERENCES PATIENT(PatientID)
 							        ON UPDATE CASCADE
							        ON DELETE CASCADE,
    CONSTRAINT  LGH_DoctorFK					FOREIGN KEY(DoctorID)
							   REFERENCES DOCTOR(DoctorID)
 							        ON UPDATE CASCADE
							        ON DELETE CASCADE
);
	
	
  
            
            
            
            
            
            
            
#################################################################################
DELIMITER //

CREATE PROCEDURE InsertTermAndAlert
	    (
        
        )
	
BEGIN
  
	DECLARE 	varPatientID	Int;

	DECLARE  	done           	Int DEFAULT 0;
	DECLARE  	LGHCursor   	CURSOR FOR
        
	# CURSOR에 대한 정보.
		SELECT	PatientID
		FROM	LATEST_GOING_HOSPITAL;
        
	DECLARE  continue	HANDLER FOR NOT FOUND SET done = 1;

	TRUNCATE TABLE LATEST_GOING_HOSPITAL;
    
    
	# LATEST_GOING_HOSPITAL 테이블에 PatientID, LatestDate열 값 채워넣기.
	# 테이블에 환자정보와 가장 최근의 병문 방문 날짜를 가져온다.
	INSERT INTO LATEST_GOING_HOSPITAL (PatientID, LatestDate) 
		(SELECT	PatientID, max(DateValue) # 가장 최근의 날
		 FROM			  MEDICAL_DATA
		 GROUP BY	  	  PatientID);

	# LATEST_GOING_HOSPITAL 테이블에 Term열 값 채워넣기.
	UPDATE 	LATEST_GOING_HOSPITAL
		SET	Term = DATEDIFF('2021-12-30', LatestDate);
        # 오늘이 2021년 12월 30일이라고 하고, 오늘을 기준으로 마지막 진료받은 날까지 얼마나 지났는지를 저장한다.

                    
                    
	# 아까 지정한 Cursor을 연다.
	OPEN	LGHCursor;
		REPEAT
			FETCH LGHCursor INTO varPatientID;
			IF NOT done THEN
            
				# LATEST_GOING_HOSPITAL 테이블에 PatientName열 값 채워넣기.
				UPDATE 	LATEST_GOING_HOSPITAL
					SET	PatientName = 
                    (SELECT PatientName
					 FROM PATIENT
					 WHERE PatientID = varPatientID)
					WHERE	PatientID = varPatientID;
				
				# LATEST_GOING_HOSPITAL 테이블에 State열 값 채워넣기.
                UPDATE 	LATEST_GOING_HOSPITAL
					SET	State = 
						(SELECT State
						FROM MEDICAL_DATA
						WHERE PatientID = varPatientID
						AND DateID IN
							(SELECT MAX(DateID)
							FROM MEDICAL_DATA
							WHERE PatientID = varPatientID))
					WHERE	PatientID = varPatientID;
				
                # LATEST_GOING_HOSPITAL 테이블에 DoctorID열 값 채워넣기.
				UPDATE 	LATEST_GOING_HOSPITAL
					SET	DoctorID = 
						(SELECT DoctorID
						FROM DATA_DOCTOR_INT AS DDInt
						WHERE DDInt.PatientID = varPatientID
							AND DDInt.DateID IN
								(SELECT MAX(DateID)
								FROM DATA_DOCTOR_INT
								WHERE DDInt.PatientID = varPatientID
								GROUP BY DDInt.PatientID))
					WHERE	PatientID = varPatientID;

                                    

			END IF;
		UNTIL done END REPEAT;
	CLOSE	LGHCursor;
    
       
                    
                    
					
                    
	UPDATE LATEST_GOING_HOSPITAL
		SET Alert = 1
        WHERE Term >= 180; # 마지막 진료받은지 6개월(180)이 경과하면, 진료받을 시간이 되었음을 알려준다.
      
    UPDATE LATEST_GOING_HOSPITAL
		SET Alert = 1
		WHERE Term >= 90 AND State IN ('severe', 'moderate')
		AND Alert IS NULL;
		# 마지막 진료받은지 3개월(90)이 지나고, 환자의 마지막 상태가 중증이상(moderate, severe)이면
        # 진료받을 시간이 되었음을 알려준다.
 
    UPDATE LATEST_GOING_HOSPITAL
		SET Alert = 0
        WHERE Alert IS NULL;
				
	 
      
    
END
//

DELIMITER ;


call InsertTermAndAlert();





#################################################################################
CREATE VIEW AlertTextView AS
	 SELECT PatientName AS Patient, DoctorName AS Doctor, HospitalName AS Hospital
     FROM LATEST_GOING_HOSPITAL AS LGH JOIN DOCTOR AS D
		ON LGH.DoctorID = D.DoctorID
	 WHERE Alert = 1;
     
                            
