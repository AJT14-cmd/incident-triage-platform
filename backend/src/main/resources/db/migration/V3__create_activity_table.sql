CREATE TABLE activity (
    id UUID Primary Key,
    incident_id UUID NOT NULL,
    actor_user_id UUID,
    event_type VARCHAR(50) NOT NULL,
    message TEXT,
    metadata JSONB,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_activity_incident
        FOREIGN KEY (incident_id) REFERENCES incident(id) ON DELETE CASCADE,

    CONSTRAINT fk_actor_user_id
        FOREIGN KEY (actor_user_id) REFERENCES app_user(id) ON DELETE SET NULL

);