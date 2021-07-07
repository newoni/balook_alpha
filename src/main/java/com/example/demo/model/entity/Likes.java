package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDate;
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
@Table(name="LIKES")
@SequenceGenerator(
        name="LIKES_SEQ_GEN",
        sequenceName="LIKES_SEQ",
        initialValue=1,
        allocationSize=1
)
public class Likes {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="LIKES_SEQ_GEN")
    private Long id;

    private Long author;

    private Long targetBoard;

    private LocalDate boardedAt;
}
