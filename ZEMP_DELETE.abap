REPORT ZEMP_DELETED.


DATA: lv_emp_id TYPE yemp_details-zemp_id.

PARAMETERS: p_id TYPE yemp_details-zemp_id.

START-OF-SELECTION.

  SELECT SINGLE zemp_id
    FROM yemp_details
    INTO lv_emp_id
    WHERE zemp_id = p_id.

  IF sy-subrc = 0.

    DELETE FROM yemp_details
      WHERE zemp_id = p_id.

    IF sy-subrc = 0.
      COMMIT WORK.
      WRITE: / 'Employee deleted successfully'.
    ELSE.
      WRITE: / 'Employee deletion failed'.
    ENDIF.

  ELSE.

    WRITE: / 'Employee not found'.

  ENDIF.