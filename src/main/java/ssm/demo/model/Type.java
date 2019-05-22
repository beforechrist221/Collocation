package ssm.demo.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type implements Serializable {
    private Integer id;
    private String typename;
}