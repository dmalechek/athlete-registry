-- *****************************************************************************
-- Table: table_sequences
DROP TABLE IF EXISTS  table_sequences; 
CREATE TABLE table_sequences
(
  table_sequence_id integer NOT NULL,
  table_name character varying(150),
  current_value integer NOT NULL,
  CONSTRAINT table_sequences_pkey PRIMARY KEY (table_sequence_id)
) WITH (OIDS=FALSE);
ALTER TABLE table_sequences OWNER TO postgres;

-- *****************************************************************************
-- Table: table_sequences
DROP TABLE IF EXISTS  system_database_updates;
CREATE TABLE system_database_updates
(
  system_database_update_id SERIAL NOT NULL,
  script_name character varying(150),
  created_date date NOT NULL,
  created_by integer NOT NULL,
   CONSTRAINT system_database_updates_pkey PRIMARY KEY (system_database_update_id)
) WITH (OIDS=FALSE);
ALTER TABLE system_database_updates OWNER TO postgres;
insert into table_sequences (table_sequence_id, table_name, current_value)
values (1, 'system_database_updates', 0);


-- *****************************************************************************
-- Test table
DROP TABLE IF EXISTS  person;
CREATE TABLE person
(
  id integer NOT NULL,
  firstname character varying(50),
  lastname character varying(50),
  CONSTRAINT person_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
ALTER TABLE person OWNER TO postgres;


-- *****************************************************************************
-- Table: system_defaults
DROP TABLE IF EXISTS  system_defaults;
CREATE TABLE system_defaults
(
  system_default_id integer NOT NULL,
  description character varying(150) NOT NULL,
  system_default_value character varying(1000) NOT NULL,
  created_date date NOT NULL,
  created_by integer NOT NULL,
  last_modified_date date NOT NULL,
  last_modified_by integer NOT NULL,
  CONSTRAINT system_defaults_pkey PRIMARY KEY (system_default_id)
) WITH (OIDS=FALSE);
ALTER TABLE system_defaults OWNER TO postgres;
insert into table_sequences (table_sequence_id, table_name, current_value)
values (2, 'system_defaults', 0);


-- *****************************************************************************
-- Table: users
DROP TABLE IF EXISTS  users;
CREATE TABLE users
(
  user_id integer NOT NULL,
  username character varying(50) NOT NULL,
  first_name character varying(100) NOT NULL,
  last_name character varying(100) NOT NULL,
  email character varying(132),
  is_username_an_email boolean,
  password character varying(25) NOT NULL,
  password_salt character varying(256) NOT NULL,
  type character varying(25) NOT NULL,
  created_date date NOT NULL,
  created_by integer NOT NULL,
  last_modified_date date NOT NULL,
  last_modified_by integer NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (user_id),
  CONSTRAINT users_type_check CHECK (type::text = ANY (ARRAY['system'::character varying, 'client'::character varying, 'user'::character varying]::text[]))
) WITH (OIDS=FALSE);
ALTER TABLE users OWNER TO postgres;
insert into table_sequences (table_sequence_id, table_name, current_value)
values (3, 'users', 0);



-- *****************************************************************************
-- Table: user_audit_logs
DROP TABLE IF EXISTS  user_audit_logs;
CREATE TABLE user_audit_logs
(
  user_audit_log_id integer NOT NULL,
  user_id integer NOT NULL references users(user_id),
  entry_type integer NOT NULL,
  entry_title character varying(100),
  entry_text character varying(2000),
  entry_date date NOT NULL,
  created_date date NOT NULL,
  created_by integer NOT NULL,
  last_modified_date date NOT NULL,
  last_modified_by integer NOT NULL,
  CONSTRAINT user_audit_logs_pkey PRIMARY KEY (user_audit_log_id)
) WITH (OIDS=FALSE);
ALTER TABLE user_audit_logs OWNER TO postgres;
insert into table_sequences (table_sequence_id, table_name, current_value)
values (4, 'user_audit_logs', 0);



-- *****************************************************************************
-- Always finish with this
insert into system_database_updates (script_name, created_date, created_by)
values ('2015-11-28_1411111111.sql', now(), 1);




