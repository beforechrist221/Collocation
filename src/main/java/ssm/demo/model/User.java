package ssm.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable{
    private Integer id;
    private String email;
    private String username;
    private String password;
    private String avatar;
    private String sign;
    private String gender;
    private String phone;
    private String updateTime;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
