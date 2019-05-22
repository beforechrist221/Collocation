package ssm.demo.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Collocation implements Serializable {
    private Integer id;
    private String title;
    private String introduce;
    private String coverPicture;
    private String content;
    private String status;
    private String createTime;
    private Integer lookData;
    private Integer typeId;
    private Integer userId;

    private Type type;
    private User user;
}