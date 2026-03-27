CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE app_user (
                          id BIGSERIAL PRIMARY KEY,
                          full_name VARCHAR(150) NOT NULL,
                          email VARCHAR(150) NOT NULL UNIQUE,
                          password_hash VARCHAR(255) NOT NULL,
                          is_active BOOLEAN NOT NULL DEFAULT TRUE,
                          created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE role (
                      id BIGSERIAL PRIMARY KEY,
                      code VARCHAR(50) NOT NULL UNIQUE,
                      name VARCHAR(100) NOT NULL
);

CREATE TABLE user_role (
                           user_id BIGINT NOT NULL,
                           role_id BIGINT NOT NULL,
                           PRIMARY KEY (user_id, role_id),
                           CONSTRAINT fk_user_role_user FOREIGN KEY (user_id) REFERENCES app_user(id),
                           CONSTRAINT fk_user_role_role FOREIGN KEY (role_id) REFERENCES role(id)
);

INSERT INTO role (code, name) VALUES
                                  ('ADMIN', 'Administrator'),
                                  ('EDITOR', 'Editor'),
                                  ('VIEWER', 'Viewer');