DELIMITER //

CREATE PROCEDURE PostDataToAPI6(
  IN apiUrl VARCHAR(255),
  IN postData VARCHAR(255),
  OUT result VARCHAR(500)
)
BEGIN
  DECLARE curlCmd VARCHAR(500);
  DECLARE cmdOutput VARCHAR(500);

  SET curlCmd = CONCAT('curl -X POST -H "Content-Type: application/json" -d "', postData, '" "', apiUrl, '"');
  
  -- Execute the curl command using sys_exec and capture the output
  SET cmdOutput = sys_exec(curlCmd);

  SET result = cmdOutput;
END //

DELIMITER ;
CALL PostDataToAPI6('http://127.0.0.1:5000/api/user', '{\\"name\\": \\"John\\", \\"age\\": 25}', @result);


DELIMITER //
create procedure test2(IN apiUrl VARCHAR(255), IN postData VARCHAR(255))
Begin 
  SET @curlCmd = CONCAT('curl -X POST -H "Content-Type: application/json" -d "', postData, '"  ', apiUrl);
  select @curlCmd;
  END //
  DELIMITER ;
  call test2('http://127.0.0.1:5000/api/user', '{\\"name\\": \\"John\\", \\"age\\": 25}')





curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"John\", \"age\": 25}" http://127.0.0.1:5000/api/user


