REPORT ZEMP_INSERTS.


DATA: ls_emp TYPE yemp_details.

PARAMETERS:
  p_id   TYPE yemp_details-zemp_id,
  p_name TYPE yemp_details-zemp_name,
  p_dept TYPE yemp_details-zemp_department,
  p_city TYPE yemp_details-zemp_city,
  p_sal  TYPE yemp_details-zemp_salary.

START-OF-SELECTION.



IF p_id IS INITIAL.
    WRITE: / 'Please enter Employee ID'.
    RETURN.
  ENDIF.

  IF p_name IS INITIAL.
    WRITE: / 'Please enter Employee Name'.
    RETURN.
  ENDIF.

  IF p_dept IS INITIAL.
    WRITE: / 'Please enter Employee Department'.
    RETURN.
  ENDIF.

  IF p_sal <= 0.
    WRITE: / 'Salary must be greater than zero'.
    RETURN.
  ENDIF.


SELECT SINGLE zemp_id
    FROM yemp_details
    INTO @DATA(lv_emp_id)
    WHERE zemp_id = @p_id.

  IF sy-subrc = 0.
    WRITE: / 'Employee ID already exists'.
    RETURN.
  ENDIF.

  ls_emp-mandt = sy-mandt.
  ls_emp-zemp_id = p_id.
  ls_emp-zemp_name = p_name.
  ls_emp-zemp_department = p_dept.
  ls_emp-zemp_city = p_city.
  ls_emp-zemp_salary = p_sal.

  INSERT yemp_details FROM ls_emp.

  IF sy-subrc = 0.
    COMMIT WORK.
    WRITE: / 'Employee inserted successfully'.
  ELSE.
    WRITE: / 'Employee insertion failed'.
  ENDIF.
