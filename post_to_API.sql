-- PROCEDURE: public.post_data_to_api12(character varying, character varying)

-- DROP PROCEDURE IF EXISTS public.post_data_to_api12(character varying, character varying);

CREATE OR REPLACE PROCEDURE public.post_data_to_api12(
	IN input1 character varying,
	IN input2 character varying)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    data JSONB;
BEGIN
    -- Construct the data payload
    data := jsonb_build_object('input1', input1, 'input2', input2);

    -- Call the Python API with the data payload
    PERFORM pg_notify('api_notification', data::TEXT);
END;
$BODY$;
ALTER PROCEDURE public.post_data_to_api12(character varying, character varying)
    OWNER TO postgres;


-- Exec --
CALL public.post_data_to_api12(
	<IN input1 character varying>, 
	<IN input2 character varying>
)
