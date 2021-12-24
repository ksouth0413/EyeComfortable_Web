############################################################################
CREATE TABLE DISEASE_SUMMARY_TEMP(
	PatientID	 		 Int 				NOT NULL,
    
	DiseaseEntity		 varChar(100)		NULL,
	SurgeryName			 varChar(1000)		NULL DEFAULT 'NONE',
	NumberOfSurgery		 Int				NULL DEFAULT 0,
	StdOfEyeSight 		 float 		 		NULL DEFAULT 0,
	StdOfEyePressure	 float 				NULL DEFAULT 0,
	DangerDegree		 varChar(100)		NULL DEFAULT 'NA',
	
	CONSTRAINT 			 DSTPK				PRIMARY KEY(PatientID),
	CONSTRAINT 			 DSTFK			    FOREIGN KEY(PatientID)
      						 REFERENCES PATIENT(PatientID)
 							        ON UPDATE CASCADE
							        ON DELETE CASCADE
    );




#################################################################################
DELIMITER //

CREATE PROCEDURE InsertNOPAndDD
	    (
        
        )
	
BEGIN

	DECLARE 	varPatientID    		 Int;

	DECLARE		varTemp0				 Int DEFAULT 0;
	DECLARE 	varTemp1		       	 float;
	DECLARE		varTemp2				 varChar(100);
	
    DECLARE 	varScore				 float;
    DECLARE		varSurgeryKind			 Int;
    
	DECLARE  	done          		 	 Int DEFAULT 0;
	DECLARE  	DSTCursor   			 CURSOR FOR


	# CURSOR에 대한 정보.
		SELECT	PatientID
		FROM	DISEASE_SUMMARY_TEMP
        ORDER BY PatientID;
        
	DECLARE  continue	HANDLER FOR NOT FOUND SET done = 1;
	
	TRUNCATE TABLE DISEASE_SUMMARY_TEMP;
    
	INSERT INTO DISEASE_SUMMARY_TEMP (PatientID, DiseaseEntity) 
		(SELECT	PatientID, DiseaseEntity
		 FROM			  PATIENT
         ORDER BY PatientID);
    
    # 수술의 종류를 저장한다.
    # 나중에 점수화를 위한 상수.
    SELECT COUNT(*) INTO varSurgeryKind
    FROM TREATMENT
    WHERE IsSurgery = 1;
    
	OPEN	DSTCursor;
		REPEAT
			FETCH DSTCursor INTO varPatientID;
			IF NOT done THEN
				
			
				# SurgeryName 열 채우기.
				UPDATE DISEASE_SUMMARY_TEMP
					SET SurgeryName = 
						(SELECT GROUP_CONCAT(DISTINCT TreatmentName SEPARATOR ' / ')
						 FROM DATA_TREATMENT_INT AS DTInt JOIN TREATMENT AS T
								ON DTInt.TreatmentID = T.TreatmentID
						 WHERE PatientID = varPatientID
						 AND IsSurgery = 1
						 GROUP BY PatientID)
					WHERE PatientID = varPatientID;
                  
                # NumberOfSurgery 열 채우기.
				UPDATE DISEASE_SUMMARY_TEMP
					SET NumberOfSurgery = 
						(SELECT COUNT(*)
						 FROM DATA_TREATMENT_INT AS DTInt JOIN TREATMENT AS T
								ON DTInt.TreatmentID = T.TreatmentID
						 WHERE PatientID = varPatientID
						 AND IsSurgery = 1
						 GROUP BY PatientID)
					WHERE PatientID = varPatientID;
				
                # StdOfEyeSight 열 채우기.
                UPDATE DISEASE_SUMMARY_TEMP
					SET StdOfEyeSight = 
						(SELECT STD(EyeSight)
						 FROM MEDICAL_DATA
						 WHERE PatientID = varPatientID
						 GROUP BY PatientID)
					WHERE PatientID = varPatientID;
				
                # StdOfEyePressure 열 채우기.
                UPDATE DISEASE_SUMMARY_TEMP
					SET StdOfEyePressure = 
						(SELECT SUM(ABS(EyePressure-15)) # 정상값이 15이므로 15와의 차이를 절댓값으로 더함.
						 FROM MEDICAL_DATA
						 WHERE PatientID = varPatientID
						 GROUP BY PatientID)
					WHERE PatientID = varPatientID;
                    
			    # StdOfEyeSight 열 채우기.
                UPDATE DISEASE_SUMMARY_TEMP
					SET StdOfEyeSight = 
						(SELECT STD(EyeSight)
						 FROM MEDICAL_DATA
						 WHERE PatientID = varPatientID
						 GROUP BY PatientID)
					WHERE PatientID = varPatientID;
				
                
                # DangerDegree 열 채우기.
                
                # 점수값 초기화.
                SET varScore = 0;
                
                # 1. SurgeryName 점수화.
                # 받은 수술의 종류를 varTemp1 변수에 저장.
                SELECT COUNT(DISTINCT TreatmentName) INTO varTemp1
				FROM DATA_TREATMENT_INT AS DTInt JOIN TREATMENT AS T
								ON DTInt.TreatmentID = T.TreatmentID
				WHERE PatientID = varPatientID
				AND IsSurgery = 1
				GROUP BY PatientID;
                
                # 최대 받을 수 있는 수술 수(varSurgeryKind)로 나눠서 0에서 1점 사이의 점수를 매김.
                SET varScore = varScore + varTemp1 / varSurgeryKind;
                
                 
                # 2. NumberOfSurgery 점수화.
                SET varTemp1 = 0;
                SELECT NumberOfSurgery INTO varTemp1
                FROM DISEASE_SUMMARY_TEMP
                WHERE PatientID = varPatientID;
                
                
                IF (varTemp1 >= 3) THEN # 수술 종류와 상관없이 3번 이상, 수술을 받으면 1점.
					SET varScore = varScore + 1;
				ELSE IF (varTemp1 >= 1) THEN # 3번 미만 1번 이상이면, 0.5점.
					SET varScore = varScore + 0.5;
                # 0번 이면, 점수없음.
                END IF;
                
                # 3. StdOfSight 점수화.
                SET varTemp1 = 0;
                SELECT StdOfEyeSight INTO varTemp1
                FROM DISEASE_SUMMARY_TEMP
                WHERE PatientID = varPatientID;
                
                IF (varTemp1 >= 0.5) THEN # 치료기간동안의 시력차이가 0.5이상이면 1점.
					SET varScore = varScore + 1;
				ELSE IF (varTemp1 >= 0.3) THEN # 0.5번 미만 0.3번 이상이면, 0.5점.
					SET varScore = varScore + 0.5;
                # 0.3미만이면, 점수없음.
                END IF;
                
				
                # 4. StdOfPressure 점수화.
                SET varTemp1 = 0;
                SELECT StdOfEyePressure INTO varTemp1
                FROM DISEASE_SUMMARY_TEMP
                WHERE PatientID = varPatientID;
                
                IF (varTemp1 >= 5) THEN # 치료기간동안의 정상안압(15)과의 차이이가 5이상이면 1점.
					SET varScore = varScore + 1;
				ELSE IF (varTemp1 >= 3) THEN # 5번 미만 3번 이상이면, 0.5점.
					SET varScore = varScore + 0.5;
                 # 3미만이면, 점수없음.
				END IF;
                
                
                
			END IF;
		UNTIL done END REPEAT;
	CLOSE	DSTCursor;
 
 
 
	
 
 
       
END
//

DELIMITER ;


call InsertNOPAndDD();

# 어쩔 수 없다. 이제 각 경우별로 점수를 반환하는 각각 만들어서 해결해야 할 것이다.























#################################################################################
CREATE VIEW DISEASE_SUMMARY AS
		SELECT DiseaseEntity AS Disease, COUNT(*) AS PatientCount, GROUP_CONCAT(SurgeryName) AS Surgery, AVG(NumberOfSurgery) AS SurgeryCount, AVG(StdOfEyeSight) AS EyeSightDiff, AVG(StdOfEyePressure) AS EyePressureDiff
        FROM DISEASE_SUMMARY_TEMP
        GROUP BY DiseaseEntity;
