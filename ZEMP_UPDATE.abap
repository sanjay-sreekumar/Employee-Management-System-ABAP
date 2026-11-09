REPORT ZEMP_UPDATE.

DATA: ls_emp TYPE yemp_details.

PARAMETERS:
  p_id   TYPE yemp_details-zemp_id,
  p_name TYPE yemp_details-zemp_name,
  p_dept TYPE yemp_details-zemp_department,
  p_city TYPE yemp_details-zemp_city,
  p_sal  TYPE yemp_details-zemp_salary.

START-OF-SELECTION.

  SELECT SINGLE *
    FROM yemp_details
    INTO ls_emp
    WHERE zemp_id = p_id.

  IF sy-subrc = 0.

    ls_emp-zemp_name = p_name.
    ls_emp-zemp_department = p_dept.
    ls_emp-zemp_city = p_city.
    ls_emp-zemp_salary = p_sal.

    UPDATE yemp_details FROM ls_emp.

    IF sy-subrc = 0.
      COMMIT WORK.
      WRITE: / 'Employee updated successfully'.
    ELSE.
      WRITE: / 'Employee update failed'.
    ENDIF.

  ELSE.

    WRITE: / 'Employee not found'.

  ENDIF.