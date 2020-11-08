CREATE OR REPLACE FUNCTION increaseSomeKeeperSalariesFunction(maxIncreaseAmount INTEGER)
RETURNS INTEGER AS $$

    DECLARE

    increase INTEGER;
    newSalary NUMERIC(7,2);
    increasesCount INTEGER;
    increasePerLevel INTEGER;

    fkeeperID  INTEGER;
	fname VARCHAR(30);
	fhireDate DATE;
	fkeeperLevel CHAR(1);
	fkeeperSalary NUMERIC(7,2);

    salaryCursor CURSOR FOR SELECT S.keeperID, S.name, S.hireDate, K.keeperLevel, S.keeperSalary
                                    FROM salaryCursor S, Keepers K
                                    WHERE S.keeperID = K.keeperID
                                      AND S.name = K.name
                                      AND s.hireDate = K.hireDate
                                      AND K.keeperLevel IN ('A', 'B', 'C')
                                      AND S.keeperSalary IS NOT NULL
                                      ORDER BY K.keeperLevel ASC, S.hireDate ASC; 

    BEGIN
        -- input validation
        IF maxIncreaseAmount < 0 THEN
            RETURN -1; 
        END IF;
        increase = 0;
        increasesCount = 0;

        OPEN salaryCursor;

        LOOP

            FETCH salaryCursor INTO fkeeperID, fname, fhireDate, fkeeperLevel, fkeeperSalary;

            -- We exit if there are no more record for keeper level or we surpass maxIncreaseAmount
            EXIT WHEN NOT FOUND
                    OR increaseCount >= maxIncreaseAmount;

            -- we change increasePerLevel 
            
            IF fkeeperLevel = 'A' THEN
                increasePerLevel = 10.00;
            
            ELSIF fkeeperLevel = 'B' THEN
                increasePerLevel = 20.00;

            ELSIF fkeeperLevel = 'C' THEN
                increasePerLevel = 30.00;
            END if;

            

            newSalary = fkeeperSalary + increasePerLevel;

        
            UPDATE salaryCursor
            SET keeperSalary = newSalary
            WHERE keeperID = fkeeperID
              AND name = fname
              AND hireDate = fhireDate
              AND keeperLevel = fkeeperLevel;

              increasesCount = increasesCount + 1;
              increase = increase + increasePerLevel;

        END LOOP;
        CLOSE salaryCursor;
        RETURN increase;

    END
$$ LANGUAGE plpgsql;




        