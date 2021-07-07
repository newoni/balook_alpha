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
@Table(name="COMMENTS")
@SequenceGenerator(
        name="COMMENT_SEQ_GEN",
        sequenceName = "COMMENTS_SEQ",
        initialValue = 1,
        allocationSize=1
)
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="COMMENTS_SEQ_GEN")
    private Long id;

    private Long author;

    private Long targetBoard;

    private String contents;

    private Date boardedAt;

    private Date updatedAt;
}
