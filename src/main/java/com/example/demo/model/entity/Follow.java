package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@Entity
@Builder
@Accessors
@Getter
@Setter
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Table(name="FOLLOW")
@SequenceGenerator(
        name="FOLLOW_SEQ_GEN",
        sequenceName="FOLLOW_SEQ",
        initialValue=1,
        allocationSize=1
)
public class Follow {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="FOLLOW_SEQ_GEN")
    private Long id;

    private Long followBy;

    private Long followTo;

    private Date followAt;
}
