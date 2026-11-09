REPORT zemp_display.

DATA: lt_emp TYPE TABLE OF yemp_details,
      ls_emp TYPE yemp_details.

START-OF-SELECTION.

  SELECT *
    FROM yemp_details
    INTO TABLE lt_emp.

  IF sy-subrc = 0.

    LOOP AT lt_emp INTO ls_emp.

      WRITE: / ls_emp-zemp_id,
               ls_emp-zemp_name,
               ls_emp-zemp_department,
               ls_emp-zemp_city,
               ls_emp-zemp_salary.

    ENDLOOP.

  ELSE.

    WRITE: / 'No employee records found'.

  ENDIF.