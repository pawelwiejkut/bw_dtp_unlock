REPORT ZUNLOCK_DTP.

PARAMETERS: pa_bach TYPE rsbtc_batch_id,
            pa_bap  TYPE char10.

SELECT SINGLE *
FROM rsbatchctrl
WHERE batch_id = @pa_bach
AND batch_process = @pa_bap
INTO @DATA(ls_RSBATCHCTRL).

CHECK ls_rsbatchctrl IS NOT INITIAL.

GET TIME STAMP FIELD DATA(lv_timestamp_now).

DATA(lv_timestamp_yesterday) = cl_abap_tstmp=>add( tstmp = lv_timestamp_now
                                secs  = -90000 ).

ls_rsbatchctrl-ts_last = lv_timestamp_yesterday.

MODIFY rsbatchctrl FROM ls_rsbatchctrl.
