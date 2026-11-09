REPORT zemp_alv.

TYPE-POOLS: slis.

DATA: lt_emp TYPE TABLE OF yemp_details.

START-OF-SELECTION.

  SELECT *
    FROM yemp_details
    INTO TABLE lt_emp.

  IF sy-subrc = 0.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_structure_name = 'YEMP_DETAILS'
      TABLES
        t_outtab = lt_emp.

  ELSE.

    WRITE: / 'No employee records found'.

  ENDIF.