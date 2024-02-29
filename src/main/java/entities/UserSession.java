package entities;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;
import java.util.UUID;

@Data
@AllArgsConstructor
public class UserSession {

    private Integer id;
    private String sessionId;
    private Integer userId;
    private Timestamp timeCreated;
    private Timestamp validUntil;
    private boolean active;
    private final Integer SESSION_VALID_TIME = 1000 * 60 * 60 * 24;
    public UserSession() {

    }


    public UserSession(Integer userId){
        this.userId = userId;
        this.sessionId = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
        this.timeCreated = new Timestamp(System.currentTimeMillis());
        this.validUntil = new Timestamp(this.timeCreated.getTime() + SESSION_VALID_TIME);
    }

}
