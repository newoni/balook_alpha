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
@Table(name="FOLLOW")
public class Follow {
    @Id
    private Long id;

    private Long followBy;

    private Long followTo;

    private Date followAt;
}
