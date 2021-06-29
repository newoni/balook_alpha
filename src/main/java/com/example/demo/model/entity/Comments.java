package com.example.demo.model.entity;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
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
public class Comments {
    @Id
    private Long id;

    private Long author;

    private Long targetBoard;

    private String contents;

    private Date boardedAt;

    private Date updatedAt;
}
